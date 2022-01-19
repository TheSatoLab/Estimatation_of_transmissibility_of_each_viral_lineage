# Estimation of the transmissibility of each viral lineage

## Summary
To estimate the relative growth rate of each SARS-CoV-2 lineage, we established a statistical model representing the epidemic dynamics of each viral lineage based on the viral genomic surveillance data.  

The input data is a count matrix representing the abundance of respective viral lineages (viral lineage ID k ∈ {1, 2, …, K}) in respective time bins (t ∈ {1, 2, …, T}).


We modeled the transition of the relative frequency of K types of viral lineages with a Bayesian multinomial logistic model as below:  

![\boldsymbol{\mu_t}=\boldsymbol{b_0}+\boldsymbol{b_1}t](https://latex.codecogs.com/gif.latex?\boldsymbol{\mu_t}=\boldsymbol{b_0}+\boldsymbol{b_1}t)  
![\boldsymbol{\theta_t}=softmax(\boldsymbol{\mu_t})](https://latex.codecogs.com/gif.latex?\boldsymbol{\theta_t}=softmax(\boldsymbol{\mu_t}))  
![N_t=\sum_{k=1}^{K}\boldsymbol{Y_{tk}}](https://latex.codecogs.com/gif.latex?N_t=\sum_{k=1}^{K}\boldsymbol{Y_{tk}})  
![\boldsymbol{Y_t}\hspace{1em}\widetilde{}\hspace{1em}Multinomial(N_t,\boldsymbol{\theta_t})](https://latex.codecogs.com/gif.latex?\boldsymbol{Y_t}\hspace{1em}\widetilde{}\hspace{1em}Multinomial(N_t,\boldsymbol{\theta_t}))  

Where _**b<sub>0</sub>**_, _**b<sub>1</sub>**_, _**mu<sub>t</sub>**_, _**theta<sub>t</sub>**_, and _**Y<sub>t</sub>**_ are vectors with K elements, and the k-th element in the vector represents the value for the viral lineage k. The explanatory variable is time bin t, and the outcome variable _**Y<sub>t</sub>**_ represents the counts of respective viral lineages at t. In the model, the linear estimator _**mu<sub>t</sub>**_ consisting the intercept _**b<sub>0</sub>**_ and the slope _**b<sub>1</sub>**_ for t is converted to the simplex _**theta<sub>t</sub>**_, which represents the probability of occurrence of each viral lineage, by the softmax link function defined as:

![softmax(\boldsymbol{x})=\frac{exp(\boldsymbol{x})}{\sum_{1\lej\leJ}exp(\boldsymbol{x}_j)}](https://latex.codecogs.com/gif.latex?softmax(\boldsymbol{x})=\frac{exp(\boldsymbol{x})}{\sum_{j=1}^{J}exp(\boldsymbol{x}_j)})  

_**Y<sub>t</sub>**_ is generated from  _**theta<sub>t</sub>**_ and  N<sub>t</sub> representing the total count of all lineages at t, according to a Multinomial distribution.  

Relative growth rate per generation (i.e., viral spread rate in human population) of respective viral lineages (_**r**_, a vector with K elements) was calculated according to the slope parameter _**b<sub>1</sub>**_ in the model above with the assumption of a fixed generation time. The growth rate _**r**_ was defined as:  

![\boldsymbol{r}=exp(\gamma/w\boldsymbol{b_1})](https://latex.codecogs.com/gif.latex?\boldsymbol{r}=exp(\gamma/w\boldsymbol{b_1}))  

Where  and  are the viral generation time (5.5 days) and the time bin size (3 days), respectively. For the parameter estimation, the intercept and slope parameters of the Delta variant were fixed at 0. Consequently, the relative growth rate of Delta was fixed at 1, and those of the respective lineages were estimated relative to that of Delta.  

Parameter estimation was performed by the framework of Bayesian statistical inference with Markov chain Monte Carlo methods (MCMC) implemented in Stan (https://mc-stan.org). Non-informative priors were set for all parameters. Four independent MCMC chains were run with 2,000 and 4,000 steps of warmup and sampling iterations, respectively.  

## Contents
* script
	* **run_model.R:** main script
	* **multinomial.stan:** stan model file
* input
	* **input.count_matrix.txt:** a count matrix representing the abundance of respective viral lineages (column) in respective time bins (row)

* output
	* **MCMC_samples.txt:** output file containing MCMC samples 
	* **credible_interval.txt:** output file containing credible intervals

## Dependencies
* R (v3.6.3)
* R packages:
	* tidyverse (v1.3.1)
	* cmdstanr (v0.4.0)
* CmdStan (v2.28.1)
