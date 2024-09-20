test_that("at works fine", {
    data("common")
    attach(common)
    lsymb("f") |> at(x) |> as.character() |> expect_equal("f \\left( x \\right)")
})

test_that("pback works fine", {
    data("common")
    attach(common)
    lsymb("f") |> pback() |> as.character() |> expect_equal("f ^{ \\ast }")
})

test_that("pfow works fine", {
    data("common")
    attach(common)
    lsymb("f") |> pfow() |> as.character() |> expect_equal("f _{ \\ast }")
})

test_that("dd works fine", {
    data("common")
    attach(common)
    lsymb("f") |> dd(x) |> as.character() |> expect_equal("\\frac{ d }{ d x } f")
})

test_that("pp works fine", {
    data("common")
    attach(common)
    lsymb("f") |> pp(x) |> as.character() |> expect_equal("\\frac{ \\partial }{ \\partial x } f")
})

test_that("lim works fine", {
    data("common")
    attach(common)
    lsymb("f") |> lim(x) |> as.character() |> expect_equal("\\lim _{ x \\rightarrow \\infty } f")
})

