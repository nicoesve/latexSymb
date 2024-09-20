test_that("Sum works correctly", {
    data("common")
    lsymb("f(n)") |> Sum(n * eq * 1, "N") |> expect_equal("\\sum_{n = 1}^{N} f(n)")

})

test_that("Prod works correctly", {
    data("common")
    lsymb("f(n)") |> Prod(n * eq * 1, "N") |> expect_equal("\\prod_{n = 1}^{N} f(n)")
})

test_that("Int works correctly", {
    data("common")
    lsymb("f(x)") |> Int(from = x * eq * 0, 1) |> expect_equal("\\int_{x = 0}^{1} f(x) \\, dx")
})