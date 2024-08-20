testthat("Elementary operations are parsed as expected", {
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
expect_equal(as.character(under(al, be)), "\\alpha _{ \\beta }")
})

testthat("Elementary grouping works as expected", {
al <- lsymb("\\alpha")
expect_equal(as.character(pths(al)), "\\left( \\alpha \\right)")
expect_equal(as.character(br(al)), "\\lbrace \\alpha \\rbrace")
expect_equal(as.character(sqbr(al)), "\\left[ \\alpha \\right]")
expect_equal(as.character(ang(al)), "\\langle \\alpha \\rangle")
})

testthat("LaTeX environments work", {
al <- lsymb("\\alpha")
expect_equal(as.character(il(al)), "$ \\alpha $")
expect_equal(as.character(lenv("align", c(lsymb(al, "&=\\\\"), lsymb("&=", al)))),
            "\\begin{align}\\n\\alpha &=\\\\\\n&= \\alpha\\n\\end{align}")
})
