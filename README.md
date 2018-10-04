# textSpan quickstart guide
===========================

This is an R package used to measure textual spanning on a document by document similarity matrix. The basic data structure in text analysis is an MxN matrices of documents by terms, n-grams, parts of speech, topics and so on. The rows, therefore, are vector representations of the text and can be easily compared for similarity, usually with cosine similarity (or the dot product of the two vectors divided by the lengths of both vectors multiplied). The result is a one-mode document by document matrix, which can easily be interpreted as a weighted adjacency matrix amendable to network metrics. 

The `textSpan` function takes this document by document similarity matrix and outputs a document specific measure which increases when a document is similar to documents which are not also similar to each other. This is defined by the following equations:

<img src="https://latex.codecogs.com/gif.latex?S(i)&space;=&space;\sum_j&space;(p_{ij}&space;&plus;&space;\sum_q&space;p_{iq}&space;p_{qj})^2" title="S(i) = \sum_j (p_{ij} + \sum_q p_{iq} p_{qj})^2" />

# Function details

Load the textSpan package from GitHub:
```{r}
install.packages("devtools")
library(devtools)
install_github("dustin-stoltz/textSpan")
```
