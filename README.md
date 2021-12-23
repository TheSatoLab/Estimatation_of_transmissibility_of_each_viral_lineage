# Estimatation of transmissibility of each viral lineage

## Summary
To estimate the relative transmissibility of each SARS-CoV-2 lineage, we established a statistical model to represent the epidemic dynamics of each viral lineage based on the viral genomic surveillance data.  

We modelled the transition of the relative frequency of K types of viral lineages with a Bayesian multinomial logistic model as below:  
![\bm{\mu_t} = \bm{b_0} + \bm{b_1} t](https://latex.codecogs.com/gif.latex?\\bm{\mu_t} = \bm{b_0} + \bm{b_1} t)  
![\bm{\mu_t} = \bm{b_0} + \bm{b_1} t](https://latex.codecogs.com/gif.latex?\\bm{\mu_t} = \bm{b_0} + \bm{b_1} t)  
![\bm{\mu_t} = \bm{b_0} + \bm{b_1} t](https://latex.codecogs.com/gif.latex?\\bm{\mu_t} = \bm{b_0} + \bm{b_1} t)  
![\bm{\mu_t} = \bm{b_0} + \bm{b_1} t](https://latex.codecogs.com/gif.latex?\\bm{\mu_t} = \bm{b_0} + \bm{b_1} t)  








\bm{\mu_t} = \bm{b_0} + \bm{b_1} t
\boldsymbol{\theta_t} = softmax(\boldsymbol{\mu_t})
N_t = \sum_{1\le k\le K} \boldsymbol{Y_{tk}}
\boldsymbol{Y_t}  ~  Multinomial(N_t, \boldsymbol{\theta_t})
softmax(\boldsymbol{x}) = \frac{exp(\boldsymbol{x})}{\sum_{1\le j\le J} exp(\boldsymbol{x}_j)}





