\name{latex_symb}
\alias{latex_symb}
\title{R wrapper for LaTeX symbols}
\usage{
    alp <- latex_symb("\\alpha")
    print(alp)
    as.character(alp)
}
\arguments{
    \item{repr}{A character string containing the LaTeX symbol. Backslashes must be escaped.}
}
\description{
    This function creates an object of the S3 class \code{latex_symb}. It is simply a wrapper for LaTeX code, for which a print and as.character methods are provided.
}