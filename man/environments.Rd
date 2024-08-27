\name{il}
\alias{il}
\alias{lenv}
\title{\code{LaTeX} Environments}
\usage{
il(x)
lenv(name, rows)
}
\arguments{
\item{x}{An object of class \code{latex_symb}}
\item{name}{The name of the \code{LaTeX} environment. For instance, \code{align} or \code{gather}}.
\item{rows}{A list of objects that can be passed to \code{as.character}.}
}
\description{
Equations and symbols in \code{LaTeX} can be either inline or on their own. \code{il} wraps expressions for the former, \code{lenv} for the latter.
}
\value{
\itemize{
\item For \code{il}, \code{x}'s \code{repr} surrounded by dollar signs.
\item For \code{lenv}, a multiline string whose lines are: 
1. A \code{\\begin} statement for \code{name}; 
2. The character representation of each row;
3. An \code{\\end} statement for \code{name}
}
}
\examples{
al <- lsymb("\\\\alpha")
be <- lsymb("\\\\beta")
il(al)
lenv("align", 
    c(
      lsymb(al^2 - be^2, "&=", 0, "\\\\\\\\"),
      lsymb(pths(al - be)*pths(al + be), "&=", 0)
     )
) 
}

