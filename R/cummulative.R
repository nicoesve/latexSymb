Sum <- function(f, from = lsymb(""), to = lsymb("")) {
    lsymb("\\sum") |>
    under(from) |>
    (\(x) x^to)() |>
    (\(x) x * f)()
}

Prod <- function(f, from = lsymb(""), to = lsymb("")) {
    lsymb("\\prod") |>
    under(from) |>
    (\(x) x^to)() |>
    (\(x) x * f)()
}

Int <- function(f, meas = lsymb("dx"), from = lsymb(""), to = lsymb("")) {
    lsymb("\\int") |>
    under(from) |>
    (\(x) x^to)() |>
    (\(x) x * f)() |>
    (\(x) x * "\\," * meas)()
}