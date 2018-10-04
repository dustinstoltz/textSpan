# TEXTUAL SPANNING --------------------------------------------------------
# Input must be a square matrix of similarity scores. The function outputs
# a vector of cumulative textual spanning scores for each document.

  textSpan <- function(A, alpha=1){
                  # zero the diagonal of the similarity matrix
                  diag(A) <- 0 
                  #Get denominator, adjustable by alpha
                  den <- (length(A[1,])-1) * (rowSums(A)/(length(A[1,])-1))^alpha
                  # divide A by den
                  P <- A/den
                  # sum paths of length two using dot product
                  PSQ <- P%*%P
                  # calculate the dyadic spanning score
                  PC <- (P + (PSQ*(as.numeric(P>0))))^2  
                  # calculate cumulative spanning score for each vertex
                  ci5 <- rowSums(PC) 
                  # normalize and invert the final score
                  ci5 <- ((ci5-mean(ci5))/sd(ci5))*-1
                  }
# THE END -----------------------------------------------------------------
