\name{pths}
\alias{pths}
\alias{br}
\alias{sqbr}
\alias{ang}
\title{\code{LaTeX} Enclosings}
\usage{
pths(x)
br(x)
sqbr(x)
ang(x)
}
\arguments{
\item{x}{An object that can be passed to \code{as.character}.}
}
\description{
It is cumbersome to have to write \code{left} and \code{right} every time a grouping is used in \code{LaTeX}. These functions take care of that.
}
\value{
An object of class \code{latex_symb} whose \code{repr} is \code{x}'s \code{repr} enclosed by the corresponding symbols.
}
\examples{
al <- lsymb("\\\\alpha")
pths(al)
br(al)
sqbr(al)
ang(al)
}


