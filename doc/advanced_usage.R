## ----include = FALSE----------------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ----setup--------------------------------------------------------------------
library(latexSymb)
data(common)
attach(common)

## -----------------------------------------------------------------------------
# my_symbols.R
library(latexSymb)
data(common)
attach(common)

# Define document-specific symbols
pt <- lsymb("x")
pt_prime <- lsymb("x'")
metric_space <- lsymb("\\mathcal{X}")
measure <- lsymb("\\mu")

# Create specialized functions
dist <- function(x, y) lsymb("d") * pths(x * comma * y)

## -----------------------------------------------------------------------------
# Expectation operator
exp_val <- function(x) lsymb("\\mathbb{E}") * sqbr(x)

sq <- function(x) pths(x)^2

# Absolute value
abs <- function(x) lsymb("\\abs{", x, "}")

# Indicator function
indic <- function(condition) {
  lsymb("\\mathbbm{1}") |> under(br(condition))
}

# Composed example
X <- lsymb("X")
Y <- lsymb("Y")

## -----------------------------------------------------------------------------
# Build a proof step by step
proof_steps <- list(
  ruler * dist(x, y) * leq * dist(x, z) + dist(z, y) * endl,
  ruler * thus * dist(x, y) - dist(x, z) * leq * dist(z, y)
) |>
  lenv("align*", rows = _)

## -----------------------------------------------------------------------------
# Good: Clear, descriptive names
expectation_X <- exp_val(X)
variance_X <- exp_val(sq(X - exp_val(X)))

# Bad: Unclear abbreviations
# e_x <- exp_val(X)
# v_x <- exp_val(sq(X - exp_val(X)))

## -----------------------------------------------------------------------------
# Base functions that can be composed
norm <- function(x) lsymb("\\|", x, "\\|")
inner_prod <- function(x, y) lsymb("\\langle ", x, ", ", y, " \\rangle")

# Composed functions
induced_norm <- function(x) {
  sqrt(inner_prod(x, x))
}

## -----------------------------------------------------------------------------
# Setup
n <- lsymb("n")
X_i <- lsymb("X") |> under(i)
X_bar <- lsymb("\\bar{X}")
S_n <- lsymb("S") |> under(n)
conv_distr <- lsymb("\\xrightarrow{d}")
sqrt <- function(x) lsymb("\\sqrt{", x, "}")

# Build a Central Limit Theorem statement
clt_statement <- list(
  ruler * sqrt(n) * pths(X_bar - mu) / si *
    conv_distr * lsymb("N(0,1)") * endl,
  ruler * lsymb("\\text{where }") *
    X_bar * eq * (1 / n) * Sum(X_i, from = i * eq * 1, to = n)
) |>
  lenv("align*", rows = _)

