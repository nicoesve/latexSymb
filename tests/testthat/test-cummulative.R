test_that("Sum works correctly", {
    data("common")
    attach(common)
    lsymb("f(n)") |> Sum(n * eq * 1, "N") |> as.character() |> expect_equal("\\sum _{ n = 1 } ^{ N } f(n)")

})

test_that("Prod works correctly", {
    data("common")
    attach(common)
    lsymb("f(n)") |> Prod(n * eq * 1, "N") |> as.character() |> expect_equal("\\prod _{ n = 1 } ^{ N } f(n)")
})

test_that("Int works correctly", {
    data("common")
    attach(common)
    lsymb("f(x)") |> Int(from = x * eq * 0, to = 1) |> as.character() |> expect_equal("\\int _{ x = 0 } ^{ 1 } f(x) \\, dx")
})