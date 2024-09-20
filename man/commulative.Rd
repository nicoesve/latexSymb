\name{Sum}
\alias{Sum}
\alias{Int}
\alias{Prod}
\title{Cumulative Operators}
\usage{
Sum(f, from = lsymb(""), to = lsymb(""))
Prod(f, from = lsymb(""), to = lsymb(""))
Int(f, meas = lsymb("dx"), from = lsymb(""), to = lsymb(""))
}
\arguments{
\item{f}{An expression to be summed, multiplied or integrated.}
\item{from}{The lower limit of the sum, product or integral.}
\item{to}{The upper limit of the sum, product or integral.}
\item{meas}{The measure of the integral.}
}
\description{
These functions are used to create cumulative operators in \code{LaTeX}. They take care of the \code{sum}, \code{prod} and \code{int} functions.
}
\value{
An object of class \code{latex_symb} whose \code{repr} is the \code{LaTeX} code for the cumulative operator concatenated with the limits and the expression.
}
\examples{
    i <- lsymb("i")
    n <- lsymb("n")
    x <- lsymb("x")
    f <- function(x) lsymb("f") * pths(x)
    Sum(i, from = 1, to = n)
    Prod(i, from = 1, to = n)
    Int(f(x), from = 0, to = 1)
}
