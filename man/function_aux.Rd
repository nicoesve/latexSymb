\name{at}
\alias{at}
\alias{pback}
\alias{pfow}
\alias{dd}
\alias{pp}
\alias{lim}
\title{Utilities for Mathematical Functions}
\usage{
    at(f, var)
    pback(f)
    pfow(f)
    dd(f, var)
    pp(f, var)
    lim(f, var, to = lsymb("\\\\infty"))
}
\arguments{
    \item{f}{latex_symb object representing a function}
    \item{var}{latex_symb object representing a variable}
    \item{to}{latex_symb object representing the limit of the function}
}
\description{
    These functions are used to create operations on functions in \code{LaTeX}. They represent evaluation, pullback, pushforward, derivatives and limits of functions.
}
\value{
    An object of class \code{latex_symb} whose \code{repr} is the \code{LaTeX} code for the operation applied to the function and the variable.
}
\examples{
    f <- lsymb("f")
    x <- lsymb("x")
    at(f, x)
    pback(f)
    pfow(f)
    dd(f, x)
    pp(f, x)
    lim(f, x)
}
