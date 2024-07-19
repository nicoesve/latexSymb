\name{Arithmetic}
\alias{Arithmetic}
\title{Arithmetic of LaTeX symbols}
\usage{
e1 <- latex_symb("x")
e2 <- latex_symb("y")
e1 + e2
e1 * e2
e1 / e2
e1 - e2
e1 ^ e2
}
\arguments{
\item{e1}{An element of class latex_symb, or an object with an as.character method.}
\item{e2}{An element of class latex_symb, or an object with an as.character method.}
}
\description{
    Arithmetic of LaTeX symbols, or of a LaTeX symbol with a non-LaTeX symbol.
}
\examples{
x <- latex_symb("x")
y <- latex_symb("y")
print(x + 2*y + 1)
}
