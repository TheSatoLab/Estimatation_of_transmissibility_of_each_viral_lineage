# Estimatation of transmissibility of each viral lineage

## Summary
To estimate the relative transmissibility of each SARS-CoV-2 lineage, we established a statistical model to represent the epidemic dynamics of each viral lineage based on the viral genomic surveillance data.  

We modelled the transition of the relative frequency of K types of viral lineages with a Bayesian multinomial logistic model as below:  

![\boldsymbol{\mu_t}=\boldsymbol{b_0}+\boldsymbol{b_1}t](https://latex.codecogs.com/gif.latex?\boldsymbol{\mu_t}=\boldsymbol{b_0}+\boldsymbol{b_1}t)  
![\boldsymbol{\theta_t}=softmax(\boldsymbol{\mu_t})](https://latex.codecogs.com/gif.latex?\boldsymbol{\theta_t}=softmax(\boldsymbol{\mu_t}))  
![N_t=\sum_{k=1}^{K}\boldsymbol{Y_{tk}}](https://latex.codecogs.com/gif.latex?N_t=\sum_{k=1}^{K}\boldsymbol{Y_{tk}})  
![\boldsymbol{Y_t}\tilde{Multinomial(N_t,\boldsymbol{\theta_t})}](https://latex.codecogs.com/gif.latex?\boldsymbol{Y_t}\tilde{Multinomial(N_t,\boldsymbol{\theta_t})})  




![softmax(\boldsymbol{x})=\frac{exp(\boldsymbol{x})}{\sum_{1\lej\leJ}exp(\boldsymbol{x}_j)}](https://latex.codecogs.com/gif.latex?softmax(\boldsymbol{x})=\frac{exp(\boldsymbol{x})}{\sum_{1\lej\leJ}exp(\boldsymbol{x}_j)})  




\boldsymbol{Y_t}~Multinomial(N_t,\boldsymbol{\theta_t})
softmax(\boldsymbol{x})=\frac{exp(\boldsymbol{x})}{\sum_{1\lej\leJ}exp(\boldsymbol{x}_j)}





