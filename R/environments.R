il <- function(x) paste0("$", x, "$")

lenv <- function(name, rows){
	   paste0("\\begin{",
		  name,
		  "}\\n",
		  Reduce(\(x,y) paste0(x,"\\n",y), rows),
		  "\\n\\end{",
		  name,
		  "}"
	   )
}
