# Use R to Write LaTeX Code in RMarkdown Documents"

Technical reports written in RMarkdown usually include mathematical symbols. 
RMarkdown addresses that by supporting the inclussion of raw LaTeX code. 
Depending on the desired output format, the code gets rendered by some LaTeX engine.
This feature is very convenient. 

The issue here is that writing LaTeX code can be cumbersome and the result is usually hard to read. 
Although the use of `newcommand` can alleviate that, in practice people use it infrequently.
The idea behind this package is that if you're writing an RMarkdown report, you're already using R, 
so yuo might as well use it to write your LaTeX code as well.  

## Example

This is best explained through an example. 
Consider the following equation, encountered in Riemannian geometry:

$$
\frac{d}{dt} \langle V,W \rangle = \langle \frac{DV}{dt}, W \rangle + \langle V, \frac{DW}{dt} \rangle
$$

The straightforward way to code that is:
```{latex}
\frac{d}{dt} \langle V,W \rangle = \langle \frac{DV}{dt}, W \rangle + \langle V, \frac{DW}{dt} \rangle
```

If you were to use `latexSymb`, you would proceed as follows instead. 
First you would create objects of class `latex_symb` to represent the vector fields:

```{r}
vf1 <- lsymb("V")
vf2 <- lsymb("W")
```

Then you would write R functions to represent the mathematical concepts being used: the covariant derivative and the ordinary derivative:

```{r}
cov.der <- function(x) lsymb("D", x)/"dt"
ddt <- function(x) lsymb("d", x)/"dt"
```

Then you would put everything in an `equation` environment:

```{r}
lenv("equation", 
     lsymb(
           ddt(ang(vf1, vf2)), 
           "=", 
           ang(cov.der(vf1), vf2) + ang(vf1, cov.der(vf2))
     )
)
```
A caveat here is that your chuncks should have the options `results='asis', include=FALSE` 
so that you obtain the plain LaTeX code. 

### Unpacking

Let us unpack all of this. 

Notice first that in the definition of `cov.der` an important feature is being used. 
Namely, the `/` function is overwritten by `latexSymb` so that if either of its arguments 
are objects of class `latex_symb`, the output is another object of that class 
that uses `frac` as you would expect. 
This is also done with `+`, `-`, `*` and `^`. 
Additionally, `under` adds support for the use of subscripts. 

Also, in the numerator of `cov.der`, `lsymb("D", x)` concatenates the string `"D"` 
and the object `x`, and wraps the result in a new `latex_symb` object. 

Further, there's the use of the `latexSymb` function `ang`, which provides the dynamic enclosing for 
the inner product, thus avoiding the need to write `left` and `right`. 
The functions `br`, `sqbr` and `pths` do the same for braces, square brackets and parentheses respectively. 

Finally, there is the function `lenv` that spares the user from writing `begin` and `end`. 
The second argument is a list or a vector, whose components represent different lines. 
So, for instance, we could have written also

```{r}
lenv("align*", 
     c(
       lsymb(ddt(ang(vf1, vf2)), "&="),
       lsymb("&=", ang(cov.der(vf1), vf2) + ang(vf1, cov.der(vf2)))
     )
)
```

`latex_symb` also exposes `il`, which surrounds expressions in dollar signs, 
for inline math environments. 

## Discussion

On the whole, `latexSymb` may not significantly reduce the amount of code
users have to write compared to raw LaTeX. 
But I do think it makes it more readable and hence less prone to errors. 
Users can mostly write what they mean, not what they want to see. 

Additionally, `latexSymb` is not limited to RMarkdown. 
Actually, it probably makes more sense in `.Rtex` documents. 
In any case, any format that `knit` can handle will do. 

Finally, for very complicated equations, R's piping should make things even more readable. 
