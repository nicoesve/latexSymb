# latexSymb

> **Write LaTeX math like you think — not like you typeset**

Transform complex LaTeX mathematical expressions into readable, composable R code. Instead of wrestling with backslashes and braces, express your mathematics naturally using familiar R syntax.

## ✨ Why latexSymb?

### Before (Raw LaTeX) 😓
```latex
\frac{d}{dt} \left \langle V,W \right \rangle = \left \langle \frac{DV}{dt}, W \right \rangle + \left \langle V, \frac{DW}{dt} \right \rangle
```

### After (latexSymb) 🎉
```r
inner <- function(x, y) ang(lsymb(x, ",", y))
cov.der <- function(x) lsymb("D", x) / "dt"
ddt <- function(x) lsymb("d", x) / "dt"

ddt(inner(vf1, vf2)) == inner(cov.der(vf1), vf2) + inner(vf1, cov.der(vf2))
```

## 🚀 Key Features

### 1. **Natural Mathematical Syntax**
```r
# Division automatically becomes \frac
X / Y               # → \frac{X}{Y}

# Powers become superscripts
X^2                 # → X^{2}

# Subscripts with under()
X |> under(i)       # → X_{i}
```

### 2. **Automatic Delimiter Sizing**
No more `\left` and `\right` headaches!
```r
pths(X / Y)         # Parentheses with auto-sizing
ang(X, Y)           # Angle brackets ⟨X,Y⟩
sqbr(X + Y)         # Square brackets [X+Y]
br(condition)       # Braces {condition}
```

### 3. **Composable Mathematical Functions**
Build complex expressions from simple, reusable parts:
```r
# Define semantic functions
exp_val <- function(x) lsymb("\\mathbb{E}") * sqbr(x)
sq <- function(x) pths(x)^2
abs <- function(x) lsymb("\\abs{", x, "}")

# Compose naturally
exp_val(sq(abs(X - Y)))     # → 𝔼[(|X - Y|)²]
```

### 4. **Multi-line Equations Made Simple**
```r
proof_steps <- list(
  ruler * dist(x, y) * leq * dist(x, z) + dist(z, y) * endl,
  ruler * thus * dist(x, y) - dist(x, z) * leq * dist(z, y)
) |>
  lenv("align*", rows = _)
```

### 5. **Common Symbols Pre-loaded**
```r
data(common)
attach(common)
# Instantly use: alpha, beta, mu, sigma, eq, leq, sum, int, infty...
```

## 📦 Installation

**Released version from CRAN:**
```r
install.packages("latexSymb")
```

**Development version from GitHub:**
```r
# install.packages("devtools")
devtools::install_github("nicoesve/latexSymb")
```

## 🎓 Quick Example: Central Limit Theorem

```r
library(latexSymb)
data(common)
attach(common)

# Define components
sample_mean <- lsymb("\\bar{X}")
sqrt <- function(x) lsymb("\\sqrt{", x, "}")
conv_distr <- lsymb("\\overset{d}{\\rightarrow}")

# Express the theorem
clt <- sqrt(n) * (pths(sample_mean - mu) / sigma) * conv_distr * lsymb("N(0,1)")
```

## 📚 Learn More

- **Vignettes**: See `vignette("vignette1", package = "latexSymb")` for getting started
- **Advanced Usage**: `vignette("advanced_usage", package = "latexSymb")` for complex examples
- **Documentation**: Full function reference at `?latexSymb`

## 🎯 Perfect For

- 📊 Statistical reports with complex notation
- 🎓 Academic papers and presentations
- 📚 Course materials and textbooks
- 🧮 Any document with serious mathematics

**Stop fighting with LaTeX syntax. Start expressing your mathematics naturally with latexSymb!**


