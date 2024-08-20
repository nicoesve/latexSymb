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


