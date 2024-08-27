\name{+}
\alias{+}
\alias{-}
\alias{/}
\alias{*}
\alias{^}
\alias{under}
\title{Arithmetic}
\usage{
a + b
a - b
a / b
a * b
a ^ b
under(a,b)
}
\arguments{
\item{a}{An object that can be passed to \code{as.character}}
\item{b}{An object that can be passed to \code{as.character}}
}
\description{
There are natural interpretations for doing arithmetic operations on objects of class \code{latexSymb}. Namely, their output is another object of that class, constructed using the \code{repr} of the arguments and the corresponding symbol for the operation. These functions implement the elementary ones.
}
\value{
An object of class \code{latex_symb} whose \code{repr} is:
\itemize{
\item For \code{+} and \code{-}, the concatenation of \code{a}'s \code{repr}, the corresponding arithmetic symbol, and \code{b}'s \code{repr}.
\item For \code{*}, the concatenation of the \code{repr}, with a space between.
\item For \code{/}, \code{a} and \code{b}'s \code{repr} inside \code{\\frac{}{}}.
\item For \code{^}, \code{a}'s \code{repr}, a caret and \code{b}'s \code{repr} in braces.
\item For \code{under}, \code{a}'s \code{repr}, an underscore and \code{b}'s \code{repr} in braces
}
}
\examples{
a <- lsymb("\\\\alpha")
b <- lsymb("\\\\beta")
a+b
a-b
a*b
a/b
a^b
under(a,b)
}

