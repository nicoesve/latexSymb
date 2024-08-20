factory <- function(components, base_function){
       function(a,b){
	    flag <- list(a,b) |> 
			purrr::map_lgl(
			    .x = _, 
			    .f = \(y) inherits(y, "latex_symb")
			) |> 
			any()
	    
	    ifelse(flag,
		   components(a,b) |> do.call(lsymb, args = _),
		   base_function(a,b)
	    )
	}
}

`+` <- factory(\(a,b) list(a, "+", b), base::`+`)
`-` <- factory(\(a,b) list(a, "-", b), base::`-`)
`*` <- factory(\(a,b) list(a, b), base::`*`)
`/` <- factory(\(a,b) list("\\frac{", a, "}{", b, "}"), base::`/`)
`^` <- factory(\(a,b) list(a, "^{", b, "}"), base::`^`)

under <- function(a,b) lsymb(a, "_{", b, "}")
