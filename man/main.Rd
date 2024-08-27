\name{lsymb}
\alias{lsymb}
\alias{print.latex_symb}
\alias{as.character.latex_symb}
\title{Create, print and turn to string objects of class \code{latex_symb}}
\usage{
lsymb(...)
\method{print}{latex_symb}(x, ...)
\method{as.character}{latex_symb}(x, ...)
}
\arguments{
\item{...}{Objects that can be passed to \code{as.character}.}
\item{x}{An object of class \code{latex_symb}}
}
\description{
The class \code{latex_symb} is simply a wrapper for a string with \code{LaTeX} code. \code{lsymb} creates the wrapper, \code{as.character} and \code{print} extract the string.
}
\value{
\itemize{
\item \code{lsymb} returns an object of class \code{latex_symb}. 
It is an S3 class, whose objects are lists with a single component called \code{repr}. 
\code{repr} is the \code{LaTeX} code for the object, which is obtained by pasting the character representations of all the arguments. 
\item \code{print.lsymb} passes the \code{repr} of its first argument, plus additional arguments, to \code{print}. The returned value is whatever \code{print} returns. 
\item \code{as.character.lsymb} passes the \code{repr} of its first argument, plus additional arguments, to \code{as.character}. The returned value is whatever \code{as.character} returns.
}
}
\examples{
al <- lsymb("\\\\alpha")
print(al)
as.character(al)
}

