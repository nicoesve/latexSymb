factory <- function(components, base_function){
        force(components)
        force(base_function)
        function(a,b){
	    flag <- list(a,b) |> 
			purrr::map_lgl(
			    .x = _, 
			    .f = \(y) inherits(y, "latex_symb")
			) |> 
			any()
	    result <- if(flag){
		   components(a,b) |> do.call(lsymb, args = _)
	    } else {
		   base_function(a,b)
	    }
	    return(result)
	}
}

`+` <- factory(\(a,b) list(a, "+", b), base::`+`)
`-` <- factory(\(a,b) list(a, "-", b), base::`-`)
`*` <- factory(\(a,b) list(a, b), base::`*`)
`/` <- factory(\(a,b) list("\\frac{", a, "}{", b, "}"), base::`/`)
`^` <- factory(\(a,b) list(a, "^{", b, "}"), base::`^`)

under <- function(a,b) lsymb(a, "_{", b, "}")
