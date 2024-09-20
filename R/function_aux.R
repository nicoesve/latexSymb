at <- function(f, var) f * pths(var)
pback <- function(f) f^"\\ast"
pfow <- function(f) f |> under("\\ast")
dd <- function(f, var) (lsymb("d") / (lsymb("d") * var)) * f
pp <- function(f, var) (lsymb("\\partial") / (lsymb("\\partial") * var)) * f
lim <- function(f, var, to = lsymb("\\infty")) {
    lsymb("\\lim") |> 
    under(var * "\\rightarrow" * to) |> 
    (\(x) x * f)()
}