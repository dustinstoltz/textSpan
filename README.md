# textSpan quickstart guide
===========================

This is an R package used to measure textual spanning on a document by document similarity matrix. The `textSpan` function takes this document by document similarity matrix and outputs a document specific measure which increases when a document is similar to documents which are not also similar to each other. This is defined by the following equations:

<img src="https://latex.codecogs.com/gif.latex?S(i)&space;=&space;\sum_j&space;(p_{ij}&space;&plus;&space;\sum_q&space;p_{iq}&space;p_{qj})^2" title="S(i) = \sum_j (p_{ij} + \sum_q p_{iq} p_{qj})^2" />

# Function details

Install and load the textSpan package from GitHub:
```{r}
  install.packages("devtools")
  library(devtools)
  install_github("dustin-stoltz/textSpan")
  library('textSpan')
```
# Examples

For more elaborate discussion see Stoltz and Taylor (2019) ["Textual Spanning: Finding Discursive Holes in Text Networks"](https://journals.sagepub.com/doi/full/10.1177/2378023119827674) in _Socius_. and the code and data necessary to reproduce the measures, graphs, and plots: https://github.com/dustinstoltz/textual_spanning_socius

## 
