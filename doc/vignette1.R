## -----------------------------------------------------------------------------
library(latexSymb)
data(common)
attach(common)
vf1 <- lsymb("V")
vf2 <- lsymb("W")

## -----------------------------------------------------------------------------
inner <- function(x, y) ang(lsymb(x, ",", y))
cov.der <- function(x) lsymb("D", x) / "dt"
ddt <- function(x) lsymb("d", x) / "dt"

## ----results = "asis"---------------------------------------------------------
lenv(
  "equation",
  lsymb(
    ddt(inner(vf1, vf2)),
    eq,
    inner(cov.der(vf1), vf2) + inner(vf1, cov.der(vf2))
  )
) |> cat()

## ----results = "asis"---------------------------------------------------------
lenv(
  "align*",
  c(
    lsymb(ddt(inner(vf1, vf2)), "&=\\\\"),
    lsymb("&=", inner(cov.der(vf1), vf2) + inner(vf1, cov.der(vf2)))
  )
) |> cat()

