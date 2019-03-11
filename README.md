# textSpan quickstart guide

Install and load the textSpan package from GitHub:
```{r}
  # install.packages("devtools")
  library(devtools)
  install_github("dustinstoltz/textSpan")
  library(textSpan)
```

<img align="middle" src="https://journals.sagepub.com/na101/home/literatum/publisher/sage/journals/content/srda/2019/srda_5/2378023119827674/20190208/images/large/10.1177_2378023119827674-fig6.jpeg" width="600" height="500">

## Measure details

This is an R package used to measure textual spanning on a document by document similarity matrix. The `textSpan` function takes this document by document similarity matrix and outputs a document specific measure which increases when a document is similar to documents which are not also similar to each other. This is defined by the following equations:

<p><img src="https://latex.codecogs.com/gif.latex?S_i%20%3D%20%5Csum_j%20%5Cleft%20%28%20p_%7Bij%7D%20&plus;%20%5Csum_q%20%5Cfrac%7Bp_%7Bqj%7D%7D%7Bp_%7Biq%7D%7D%20%5Cright%20%29%5E2"/></p>

We define proportional similarities <img src="https://latex.codecogs.com/gif.latex?p_%7Bij%7D"> as:

<p><img src="https://latex.codecogs.com/gif.latex?p_%7Bij%7D%20%3D%20%5Cfrac%7Ba_%7Bij%7D%7D%7Bk_i%20%5Ctimes%20%5Cleft%20%28%20%5Cfrac%7B%5Csum_qa_%7Biq%7D%7D%7Bk_i%7D%20%5Cright%20%29%5E%5Calpha%7D"></p>

Finally, to make the measure more interpretable, we standardize the output by taking the __z__-score of each <img src="https://latex.codecogs.com/gif.latex?S_i"> and inverting it such that positive values indicate more textual spanning, while negative values indicate less textual spanning:

<p><img src="https://latex.codecogs.com/gif.latex?z%28S_i%29%20%3D%20%5Cleft%20%28%20%5Cfrac%7Bs_i-%5Cbar%7Bs%7D%7D%7B%5Csqrt%7B%5Cfrac%7B%5Csum_%7Bi%3D1%7D%5E%7Bn%7D%7B%28s-%5Cbar%7Bs%7D%29%5E2%7D%7D%7Bn-1%7D%7D%7D%20%5Cright%20%29%20%5Ctimes%20-1"></p>

For more elaborate discussion see Stoltz and Taylor (2019) ["Textual Spanning: Finding Discursive Holes in Text Networks"](https://journals.sagepub.com/doi/full/10.1177/2378023119827674) in _Socius_. The package includes the four simulated similarity matrices used in the paper, but further explanation of the code and data necessary to reproduce the measures, graphs, and plots in the paper can be found here: https://github.com/dustinstoltz/textual_spanning_socius


