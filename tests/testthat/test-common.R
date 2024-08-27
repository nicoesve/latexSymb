test_that("Elementary operations are parsed as expected", {
al <- lsymb("\\alpha")
be <- lsymb("\\beta")
expect_equal(as.character(al), "\\alpha")
expect_equal(as.character(al + be), "\\alpha + \\beta")
expect_equal(as.character(al + 1), "\\alpha + 1")
expect_equal(as.character(al + "\\gamma"), "\\alpha + \\gamma")
expect_equal(as.character(al - be), "\\alpha - \\beta")
expect_equal(as.character(al * be), "\\alpha \\beta")
expect_equal(as.character(al / be), "\\frac{ \\alpha }{ \\beta }")
expect_equal(as.character(al ^ be), "\\alpha ^{ \\beta }")
expect_equal(as.character((al^2) - (be^2)), "\\alpha ^{ 2 } - \\beta ^{ 2 }")
expect_equal(as.character(under(al, be)), "\\alpha _{ \\beta }")
})

test_that("Elementary grouping works as expected", {
al <- lsymb("\\alpha")
expect_equal(as.character(pths(al)), "\\left( \\alpha \\right)")
expect_equal(as.character(br(al)), "\\lbrace \\alpha \\rbrace")
expect_equal(as.character(sqbr(al)), "\\left[ \\alpha \\right]")
expect_equal(as.character(ang(al)), "\\langle \\alpha \\rangle")
})

test_that("LaTeX environments work", {
al <- lsymb("\\alpha")
expect_equal(as.character(il(al)), "$\\alpha$")
expect_equal(as.character(lenv("align", c(lsymb(al^2, "&=\\\\"), lsymb("&=", al)))),
            "\\begin{align}\\alpha ^{ 2 } &=\\\\&= \\alpha\\end{align}")
})

test_that("nesting works", {
al <- lsymb("\\alpha")
be <- lsymb("\\beta")
testing_expr <- pths(al^2 + be)*pths(al - be/3)
expect_equal(as.character(testing_expr), "\\left( \\alpha ^{ 2 } + \\beta \\right) \\left( \\alpha - \\frac{ \\beta }{ 3 } \\right)")
env_expr <- lenv("align",
    c(
      lsymb(al^2 - be^2, "&=", 0, "\\\\"),
      lsymb(pths(al - be)*pths(al + be), "&=", 0)
     )
)
expect_equal(as.character(env_expr),
"\\begin{align}\\alpha ^{ 2 } - \\beta ^{ 2 } &= 0 \\\\\\left( \\alpha - \\beta \\right) \\left( \\alpha + \\beta \\right) &= 0\\end{align}")
})
