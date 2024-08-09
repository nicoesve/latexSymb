#' Function that creates a `latex_symb` object
#'
#' @param ... One or more R objects, which get transformed into characters and then pasted to create the `LaTeX` code for the symbol.
#' @return An object of the S3 class `latex_symb`. 
#' @export
#' @examples 
#' al <- lsymb("\\alpha")
#' al$repr
lsymb <- function(...){
    result <- paste(...)
    x <- list(repr = result)
    class(x) <- "latex_symb"
    return(x)
}

#' Function that converts a `latex_symb` object to a character string
#' 
#' @param x A `latex_symb` object
#' @param ... Additional arguments
#' @return A character string with the `LaTeX` code for the symbol.
#' @export
#' @examples
#' as.character(lsymb("\\alpha"))
as.character.latex_symb <- function(x, ...){
    x$repr
}

#' Masking the addition operator to work with `latex_symb` objects
#' 
#' @param e1 An object
#' @param e2 An object
#' @return A `latex_symb` object if one of the arguments is a `latex_symb` object. Its representation is the representation of the first argument concatenated with a plus sign and the representation of the second argument. Otherwise, the base addition operator is called.
#' @export
#' @examples 
#' e1 <- lsymb("\\alpha")
#' e2 <- lsymb("\\beta")
#' e1 + e2
`+` <- function(e1, e2){
    if(inherits(e1, "latex_symb") || inherits(e2, "latex_symb")){
        return(lsymb(paste(e1, "+", e2)))
    } else {
        return(base::`+`(e1, e2))
    }
}

#' Masking the multiplication operator to work with `latex_symb` objects 
#' 
#' @param e1 An object
#' @param e2 An object
#' @return A `latex_symb` object if one of the arguments is a `latex_symb` object. Its representation is the representation of the first argument concatenated with the representation of the second argument. Otherwise, the base multiplication operator is called.
#' @export
#' @examples
#' e1 <- lsymb("\\alpha")
#' e2 <- lsymb("\\beta")
#' e1 * e2
`*` <- function(e1, e2){
    if(inherits(e1, "latex_symb") || inherits(e2, "latex_symb")){
        return(lsymb(paste(e1, e2)))
    } else {
        return(base::`*`(e1, e2))
    }
}

#' Masking the division operator to work with `latex_symb` objects
#' 
#' @param e1 An object
#' @param e2 An object
#' @return A `latex_symb` object if one of the arguments is a `latex_symb` object. Its representation is the `LaTeX` operator `frac`, with the representation of the first argument as the numerator and the representation of the second argument as the denominator. Otherwise, the base division operator is called.
#' @export
#' @examples
#' e1 <- lsymb("\\alpha")
#' e2 <- lsymb("\\beta")
#' e1 / e2
`/` <- function(e1, e2){
    if(inherits(e1, "latex_symb") || inherits(e2, "latex_symb")){
        return(lsymb(paste("\\frac{", e1, "}{", e2, "}")))
    } else {
        return(base::`/`(e1, e2))
    }
}

#' Masking the subtraction operator to work with `latex_symb` objects
#' 
#' @param e1 An object
#' @param e2 An object
#' @return A `latex_symb` object if one of the arguments is a `latex_symb` object. Its representation is the representation of the first argument concatenated with a minus sign and the representation of the second argument. Otherwise, the base subtraction operator is called.
#' @export
#' @examples
#' e1 <- lsymb("\\alpha")
#' e2 <- lsymb("\\beta")
#' e1 - e2
`-` <- function(e1, e2){
    if(inherits(e1, "latex_symb") || inherits(e2, "latex_symb")){
        return(lsymb(paste(e1, " - ", e2)))
    } else {
        return(base::`-`(e1, e2))
    }
}

#' Masking the power operator to work with `latex_symb` objects
#' 
#' @param e1 An object
#' @param e2 An object
#' @return A `latex_symb` object if one of the arguments is a `latex_symb` object. Its representation is the representation of the first argument concatenated with a caret symbol and the representation of the second argument enclosed in curly braces. Otherwise, the base power operator is called.
#' @export
#' @examples
#' e1 <- lsymb("\\alpha")
#' e2 <- lsymb("\\beta")
#' e1 ^ e2
`^` <- function(e1, e2){
    if(inherits(e1, "latex_symb") || inherits(e2, "latex_symb")){
        return(lsymb(paste(e1, "^{", e2, "}")))
    } else {
        return(base::`^`(e1, e2))
    }
}

#' Function that creates a `latex_symb` object consisting of its argument enclosed in parentheses
#' 
#' @param expr An object
#' @return A `latex_symb` object. Its representation is the argument enclosed in parentheses.
#' @export
#' @examples
#' e1 <- lsymb("\\alpha")
#' pths(e1)
pths <- function(expr){
    lsymb(paste("\\left(", expr, "\\right)"))
}

#' Function that creates a `latex_symb` object consisting of its argument enclosed in braces
#' 
#' @param expr An object
#' @return A `latex_symb` object. Its representation is the argument enclosed in braces.
#' @export
#' @examples
#' e1 <- lsymb("\\alpha")
#' braces(e1)
braces <- function(expr){
    lsymb(paste("\\lbrace", expr, "\\rbrace"))
}

#' Function that wraps a `latex_symb` object in dollar signs to be interpreted as inline math by `LaTeX`. 
#' 
#' @param expr An object
#' @return A string. It is the representation of `expr`, wrapped by dollar signs. 
#' @export
#' @examples
#' e1 <- lsymb("\\alpha")
#' il(e1)
il <- function(expr){
    paste("$", expr, "$")
}

#' Prints the `LaTeX` representation of a `latex_symb` object
#' 
#' @param x A `latex_symb` object
#' @param ... Other arguments
#' @return The object's representation
#' @export
print.latex_symb <- function(x, ...){
    print(x$repr)
}
