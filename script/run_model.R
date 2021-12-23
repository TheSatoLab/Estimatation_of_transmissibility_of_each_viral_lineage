#!/usr/bin/env R

library(tidyverse)
library(cmdstanr)

#hyper parameters
bin.size <- 3
generation_time <- 5.5

#read stan file
stan_f.name <- 'script/multinomial.stan'
multi_nomial_model <- cmdstan_model(stan_f.name)

#read input file
data.name <- 'input/input_count_matrix.csv'
data <- read.csv(data.name,header=T,row.names=1)

#data preparation
X <- as.matrix(data.frame(X0 = 1, X1 = 1:nrow(data)))
Y <- data %>% as.matrix()
Y_sum.v <- apply(Y,1,sum)

group.df <- data.frame(group_Id = 1:ncol(Y),
                         group = colnames(Y))

data.stan <- list(K = ncol(Y),
                  N = nrow(Y),
                  D = 2,
                  X = X,
                  Y = Y,
                  generation_time = generation_time,
                  bin_size = bin.size,
                  Y_sum = Y_sum.v)

#fitting
fit.stan <- multi_nomial_model$sample(
    data=data.stan,
    iter_sampling=3000,
    iter_warmup=2000,
    seed=1234,
    parallel_chains = 4,
    chains=4)


#extracting relative growth rate
draw.df.growth_rate <- fit.stan$draws("growth_rate", format = "df") %>% as.data.frame() %>% select(! contains('.'))
draw.df.growth_rate.long <- draw.df.growth_rate %>% gather(key = class, value = value)

draw.df.growth_rate.long <- draw.df.growth_rate.long %>% mutate(group_Id = str_match(draw.df.growth_rate.long$class,'growth_rate\\[([0-9]+)\\]')[,2] %>% as.numeric() + 1)

draw.df.growth_rate.long <- inner_join(draw.df.growth_rate.long,group.df,by="group_Id") %>% select(value,group)

draw.df.growth_rate.summary <- draw.df.growth_rate.long %>% group_by(group) %>% summarize(posterior_mean=mean(value),posterior_q2.5 = quantile(value,0.025),posterior_q97.5 = quantile(value,0.975))

#output
out1.name <- 'output/MCMC_samples.txt'
write.table(draw.df.growth_rate.long,out1.name,col.names=T,row.names=F,sep="\t",quote=F)

out2.name <- 'output/credible_interval.txt'
write.table(draw.df.growth_rate.summary,out2.name,col.names=T,row.names=F,sep="\t",quote=F)

