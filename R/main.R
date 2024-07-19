latex_symb <- function(repr){
    x <- list(repr = repr)
    class(x) <- "latex_symb"
    return(x)
}

as.character.latex_symb <- function(x){
    x$repr
}

`+` <- function(e1, e2){
    if(inherits(e1, "latex_symb") || inherits(e2, "latex_symb")){
        return(latex_symb(paste0(as.character(e1), " + ", as.character(e2))))
    } else {
        return(base::`+`(e1, e2))
    }
}

`*` <- function(e1, e2){
    if(inherits(e1, "latex_symb") || inherits(e2, "latex_symb")){
        return(latex_symb(paste0(as.character(e1), as.character(e2))))
    } else {
        return(base::`*`(e1, e2))
    }
}

`/` <- function(e1, e2){
    if(inherits(e1, "latex_symb") || inherits(e2, "latex_symb")){
        return(latex_symb(paste0("\\frac{", as.character(e1), "}{", as.character(e2), "}")))
    } else {
        return(base::`/`(e1, e2))
    }
}

`-` <- function(e1, e2){
    if(inherits(e1, "latex_symb") || inherits(e2, "latex_symb")){
        return(latex_symb(paste0(as.character(e1), " - ", as.character(e2))))
    } else {
        return(base::`-`(e1, e2))
    }
}

`^` <- function(e1, e2){
    if(inherits(e1, "latex_symb") || inherits(e2, "latex_symb")){
        return(latex_symb(paste0(as.character(e1), "^{", as.character(e2), "}")))
    } else {
        return(base::`^`(e1, e2))
    }
}

pths <- function(expr){
    latex_symb(paste0("\\left(", as.character(expr), "\\right)"))
}

braces <- function(expr){
    latex_symb(paste0("\\lbrace", as.character(expr), "\\rbrace"))
}

print.latex_symb <- function(x){
    print(x$repr)
}
