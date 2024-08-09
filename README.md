# Use R to Write LaTeX in Dynamic Documents

This package has a specific use case. 

Suppose you're writing an `.Rmd` document that has LaTeX code embedded in it. 
If the math that you're trying to write is not trivial, then the code can become cumbersome. 
On top of that, it is annoying to have to switch between writing R and LaTeX code on the same document.

For instance, consider writing the expression 
    $$
        \operatorname{Vec}_{\Sigma^\ast}(\vec{\Sigma \Lambda})^T \operatorname{Vec}_{\Sigma^\ast}(\vec{\Sigma \Lambda})
    $$
which is encountered in the study of Riemannian-manifold-valued random variables ($\Sigma$ and $\Lambda$ being the random variables).

Not only is it cumbersome, it is very hard to read without compiling to PDF. I'd argue there are two reasons for that:
1. It is encoding what we want to see, not what we mean. 
2. There is a lot of operations being composed: the vector arrow, the vectorization and the transposition.

About the first reason, think about it: $\Sigma$ is a symbol encoding something (the random variable), which we then encode into the LaTeX code `\Sigma`, neither of which are particularly informative (or only so by convention i.e. if you're used to it). 
If this was actual code, you'd use informative yet simple variable names, like `rv`. 
This package is a way to do that, while maintining the ability to write the LaTeX code necessary for sharing or publishing. 

The basic idea is that you'd have an R chunk:
```{r}
library(latexSymb)
rv1 <- lsymb("\\Sigma")
rv2 <- lsymb("\\Lambda")
```
And then when you need it in your `.Rmd` document, you just write `` `r il(rv1)` `` (the `il` is to wrap the expression in dollar signs, so that it is interpreted as inline math).

To encode the operations, you'd use R functions:
```{r}
bivec <- function(rv1, rv2){
    lsymb("\\vec{", as.character(rv1), as.character(rv2), "}")
}
Vect <- function(rv1, rv2){
    lsymb(
        "\\operatorname{Vec}_{", 
        as.character(rv1), 
        "}(",
        bivec(rv1, rv2),
        ")"
    )
} 
t.latexSymb <- function(x){
    lsymb(as.character(x), "^T")
}
```
(you could also just write 
```{r}
bivec <- function(rv1, rv2) "\\vec{" * rv1$repr * rv2$repr * "}"
```
if you know you'll only use the function with `latex_symb` objects).

Then you just write `` `r bivec(rv1, rv2)` `` and `` `r Vect(rv1, rv2)` `` and 
`` `r t(Vect(rv1, rv2))*Vect(rv1, rv2)` `` inside math environments (or passed to `il`).

Notice that R's `*` function is overwritten to return an object of class `latex_symb` whose LaTeX representation is the concatenation of the LaTeX representations of the arguments. The operations `+`, `-` and `^` are similarly overwritten, with `/` using `frac`. 

About the second reason, I personally like using pipes to deal with that issue. 
I'd write `` `r Vect(rv1, rv2) |> (\(x) t(x)*x)()` ``. 
Whether you consider this more readable is a matter of taste. 

One last trick has to do with the fact that it is very common to subset mathematical symbols with some kind of index. 
To deal with this, `latex_symb` objects have an `index` function that does just that. 
So for instance, 

```{r}
al <- lsymb("\\alpha")
al$index(0)
```

Overall, is this less work than writing the LaTeX code? 
Probably not. 
I just think it feels better, especially if you spend more time writing R code than LaTeX. 
Could you do all of this using `\newcommand`? 
Of course. 
I just don't think that a lot of people do that. 

The package is intentionally bare-bones. 
You're encouraged to write you're own functions. 
LaTeX is powerful because of its flexibility and I want to go with that. 

