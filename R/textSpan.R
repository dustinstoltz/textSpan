# TEXTUAL SPANNING --------------------------------------------------------
# Input must be a square matrix of similarity scores. The function outputs
# a vector of cumulative textual spanning scores for each document.

    textSpan <- function(A, alpha=1){
        # zero the diagonal of the similarity matrix
        diag(A) <- 0 
        # get denominator (i.e. weighted degree), adjustable by alpha
        den <- (rowSums(A != 0)) * ((rowSums(A)/
                (rowSums(A != 0)))^alpha)
        # divide A by den to get proportional similarities,
        # equation (2) in the paper
        PS <- A/den
        # sum paths of length two using dot product
        PS2 <- PS%*%PS
        # cannot divide matrices, so find 
        # inverse of PS to multiple in next step
        iPS <- solve(PS)
        # remove zero edges and calculate the dyadic spanning 
        # score, which is the term in the parentheses in equation (1)
        SP <- (PS + (PS2*(as.numeric(iPS>0))))^2  
        # calculate cumulative spanning score for each vertex
        cSP <- rowSums(SP) 
        # standardize and invert the scores, equation (3) in the paper
        cSP <- ((cSP-mean(cSP))/sd(cSP))*-1
      }

# THE END -----------------------------------------------------------------
