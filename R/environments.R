il <- function(x) paste("$", x, "$")

env <- function(name, rows){
	   paste0("\\begin{",
		  name,
		  "}\\n",
		  Reduce(\(x,y) paste0(x,"\\n",y), rows),
		  "\\n\\end{",
		  name,
		  "}"
	   )
}
