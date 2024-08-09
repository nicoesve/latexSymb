## -----------------------------------------------------------------------------
library(latexSymb)
rv1 <- lsymb("\\Sigma")
rv2 <- lsymb("\\Lambda")

## -----------------------------------------------------------------------------
bivec <- function(rv1, rv2){
    lsymb("\\vec{", rv1, rv2, "}")
}
Vect <- function(rv1, rv2){
    lsymb(
        "\\operatorname{Vec}_{", 
        rv1, 
        "}(",
        bivec(rv1, rv2),
        ")"
    )
} 
t.latex_symb <- function(x){
    lsymb(x, "^T")
}

## -----------------------------------------------------------------------------
bivec <- function(rv1, rv2) "\\vec{" * rv1 * rv2 * "}"

