#' Function that creates a latex_symb object
#' 
#' @param repr A character string representing the latex expression
#' @return A latex_symb object
#' @export
#' @examples
#' al <- latex_symb("\\alpha")
latex_symb <- function(repr){
    x <- list(repr = repr)
    class(x) <- "latex_symb"
    return(x)
}

#' Function that converts a latex_symb object to a character string
#' 
#' @param x A latex_symb object
#' @param ... Additional arguments
#' @return A character string
#' @export
#' @examples
#' as.character(latex_symb("\\alpha"))
as.character.latex_symb <- function(x, ...){
    x$repr
}

#' Masking the addition operator to work with latex_symb objects
#' 
#' @param e1 An object
#' @param e2 An object
#' @return A latex_symb object if one of the arguments is a latex_symb object. Its representation is the representation of the first argument concatenated with a plus sign and the representation of the second argument. Otherwise, the base addition operator is called.
#' @export
`+` <- function(e1, e2){
    if(inherits(e1, "latex_symb") || inherits(e2, "latex_symb")){
        return(latex_symb(paste0(as.character(e1), " + ", as.character(e2))))
    } else {
        return(base::`+`(e1, e2))
    }
}

#' Masking the multiplication operator to work with latex_symb objects 
#' 
#' @param e1 An object
#' @param e2 An object
#' @return A latex_symb object if one of the arguments is a latex_symb object. Its representation is the representation of the first argument concatenated with the representation of the second argument. Otherwise, the base multiplication operator is called.
#' @export
`*` <- function(e1, e2){
    if(inherits(e1, "latex_symb") || inherits(e2, "latex_symb")){
        return(latex_symb(paste0(as.character(e1), as.character(e2))))
    } else {
        return(base::`*`(e1, e2))
    }
}

#' Masking the division operator to work with latex_symb objects
#' 
#' @param e1 An object
#' @param e2 An object
#' @return A latex_symb object if one of the arguments is a latex_symb object. Its representation is the latex operator frac, with the representation of the first argument as the numerator and the representation of the second argument as the denominator. Otherwise, the base division operator is called.
#' @export
`/` <- function(e1, e2){
    if(inherits(e1, "latex_symb") || inherits(e2, "latex_symb")){
        return(latex_symb(paste0("\\frac{", as.character(e1), "}{", as.character(e2), "}")))
    } else {
        return(base::`/`(e1, e2))
    }
}

#' Masking the subtraction operator to work with latex_symb objects
#' 
#' @param e1 An object
#' @param e2 An object
#' @return A latex_symb object if one of the arguments is a latex_symb object object. Its representation is the representation of the first argument concatenated with a minus sign and the representation of the second argument. Otherwise, the base subtraction operator is called.
#' @export
`-` <- function(e1, e2){
    if(inherits(e1, "latex_symb") || inherits(e2, "latex_symb")){
        return(latex_symb(paste0(as.character(e1), " - ", as.character(e2))))
    } else {
        return(base::`-`(e1, e2))
    }
}

#' Masking the power operator to work with latex_symb objects
#' 
#' @param e1 An object
#' @param e2 An object
#' @return A latex_symb object if one of the arguments is a latex_symb object. Its representation is the representation of the first argument concatenated with a caret symbol and the representation of the second argument enclosed in curly braces. Otherwise, the base power operator is called.
#' @export
`^` <- function(e1, e2){
    if(inherits(e1, "latex_symb") || inherits(e2, "latex_symb")){
        return(latex_symb(paste0(as.character(e1), "^{", as.character(e2), "}")))
    } else {
        return(base::`^`(e1, e2))
    }
}

#' Function that creates a latex_symb object consisting of its argument enclosed in parentheses
#' 
#' @param expr An object
#' @return A latex_symb object. Its representation is the argument enclosed in parentheses.
#' @export
pths <- function(expr){
    latex_symb(paste0("\\left(", as.character(expr), "\\right)"))
}

#' Function that creates a latex_symb object consisting of its argument enclosed in braces
#' 
#' @param expr An object
#' @return A latex_symb object. Its representation is the argument enclosed in braces.
#' @export
braces <- function(expr){
    latex_symb(paste0("\\lbrace", as.character(expr), "\\rbrace"))
}

#' Adaptation of the generic print function for latex_symb objects
#' 
#' @param x A latex_symb object
#' @param ... Additional arguments
#' @export
print.latex_symb <- function(x, ...){
    print(x$repr)
}
