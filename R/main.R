lsymb <- function(...){
	     x <- paste(...) |> list(repr = _)
	     class(x) <- "latex_symb"
	     return(x)
         }

as.character.latex_symb <- function(x, ...) base::as.character(x$repr, ...)

print.latex_symb <- function(x, ...) base::print(x$repr, ...)
