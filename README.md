# textSpan quickstart guide
===========================

This is an R package used to measure textual spanning on a document by document similarity matrix. The basic data structure in text analysis is an MxN matrices of documents by terms, n-grams, parts of speech, topics and so on. The rows, therefore, are vector representations of the text and can be easily compared for similarity, usually with cosine similarity (or the dot product of the two vectors divided by the lengths of both vectors multiplied). The result is a one-mode document by document matrix, which can easily be interpreted as a weighted adjacency matrix amendable to network metrics. 

The `textSpan` function takes this document by document similarity matrix and outputs a document specific measure which increases when a document is similar to documents which are not also similar to each other. This is defined by the following equations:

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

Load additional packages used in the analysis and visualization:
```{r}
library(pacman)
pacman::p_load(ggneetwork, ggplot2, ggpubr, igraph, Hmisc, corrplot, tnet, stm, PerformanceAnalytics) 

```

## Simulated Examples
Load simulated datasets:
```{} 
sim1 <- read.csv("sim_ring.csv")
sim2 <- read.csv("sim_clique.csv")
sim3 <- read.csv("sim_core_periph.csv")
```
Calculate textual spanning scores using the textSpan function:
```{r}
    sim.span1 <- textSpan(as.matrix(sim1))
    sim.span2 <- textSpan(as.matrix(sim2))
    sim.span3 <- textSpan(as.matrix(sim3))
```

Prepare graph objects and add spanning scores as vertex attributes:
```{r}
    sim.net1 <- graph.adjacency(as.matrix(simulated1), diag=F, mode="lower", weighted=T)
    sim.net2 <- graph.adjacency(as.matrix(simulated2), diag=F, mode="lower", weighted=T)
    sim.net3 <- graph.adjacency(as.matrix(simulated3), diag=F, mode="lower", weighted=T)
    ##
    V(sim.net1)$spanning <- sim.span1
    V(sim.net2)$spanning <- sim.span2
    V(sim.net3)$spanning <- sim.span3

```
Prepare networks for ggplot2:
```{r}
    ## ring
    l1 <- layout_in_circle(sim.net1)
    sim.net1 <- ggnetwork(sim.net1, layout=l1, weight="weight")
    ## bifurcated clique
    l2 <- layout_with_fr(sim.net2)
    sim.net2 <- ggnetwork(sim.net2, layout=l2, weight="weight")
    ## core-periphery 
    l3 <- layout_with_fr(sim.net3)
    sim.net3 <- ggnetwork(sim.net3, layout=l3, weight="weight")
```
### Ring Graph Graph
```{r}
```

### Bifurcated Clique Graph
```{r}
```

### Core Periphery Graph
```{r}
```


## Empirical Examples

We use the CMU political blogs dataset which are used with the `stm` package. Because n=13,000 in this dataset, for simplicity we randomly sample 100 blog posts which we use in the following. We offer a subset of the document by term matrix and the document by topic probability matrix, the latter of which is based on the pre-processed topic model solution provided by CMU team (the RData file can be downloaded here: http://goo.gl/VPdxlS). 

```{r}
dtm <- read.csv("subset_dtm.csv")
tm  <- read.csv("subset_topic_solution.csv")

```




## 
