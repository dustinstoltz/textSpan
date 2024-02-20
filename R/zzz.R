
.onAttach <- function(...) {

msg <- paste("The", sQuote("textSpan"), "package is deprecated as of February 2024.",
             "To use the textSpan method,", 
             "with improved functionality, please use",
             sQuote("text2map"), "instead. It is available on CRAN.", 
             "Run: install.packages('text2map'); remove.packages('textSpan')")

packageStartupMessage(msg)

}
