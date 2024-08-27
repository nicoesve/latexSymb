il <- function(x) paste0("$", x, "$")

lenv <- function(name, rows){
	   paste0("\\begin{",
		  name,
		  "}",
		  Reduce(\(x,y) paste0(x,y), rows),
		  "\\end{",
		  name,
		  "}"
	   )
}
