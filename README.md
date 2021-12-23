# Estimatation of transmissibility of each viral lineage

## Summary
To estimate the relative transmissibility of each SARS-CoV-2 lineage, we established a statistical model to represent the epidemic dynamics of each viral lineage based on the viral genomic surveillance data.  

We modelled the transition of the relative frequency of K types of viral lineages with a Bayesian multinomial logistic model as below:  

![\boldsymbol{\mu_t}=\boldsymbol{b_0}+\boldsymbol{b_1}t](https://latex.codecogs.com/gif.latex?\boldsymbol{\mu_t}=\boldsymbol{b_0}+\boldsymbol{b_1}t)  
![\boldsymbol{\theta_t}=softmax(\boldsymbol{\mu_t})](https://latex.codecogs.com/gif.latex?\boldsymbol{\theta_t}=softmax(\boldsymbol{\mu_t}))  
![N_t=\sum_{k=1}^{K}\boldsymbol{Y_{tk}}](https://latex.codecogs.com/gif.latex?N_t=\sum_{k=1}^{K}\boldsymbol{Y_{tk}})  
![\boldsymbol{Y_t}\hspace{1em}\widetilde{}\hspace{1em}Multinomial(N_t,\boldsymbol{\theta_t})](https://latex.codecogs.com/gif.latex?\boldsymbol{Y_t}\hspace{1em}\widetilde{}\hspace{1em}Multinomial(N_t,\boldsymbol{\theta_t}))  

Where _**b<sub>0</sub>**_, _**b<sub>1</sub>**_, _**mu<sub>t</sub>**_, _**theta<sub>t</sub>**_, are vectors with K elements, and the k-th element in the vector represents the value for the viral lineage k. The explanatory variable is time bin t, and the outcome variable _**Y<sub>t</sub>**_ represents the counts of respective viral lineages at t. In the model, the linear estimator _**mu<sub>t</sub>**_ consisting the intercept _**b<sub>0</sub>**_ and the slope _**b<sub>1</sub>**_ for t is converted to the simplex _**theta<sub>t</sub>**_, which represents the probability of occurrence of each viral lineage, by the softmax link function defined as:

![softmax(\boldsymbol{x})=\frac{exp(\boldsymbol{x})}{\sum_{1\lej\leJ}exp(\boldsymbol{x}_j)}](https://latex.codecogs.com/gif.latex?softmax(\boldsymbol{x})=\frac{exp(\boldsymbol{x})}{\sum_{j=1}^{J}exp(\boldsymbol{x}_j)})  







