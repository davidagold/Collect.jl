
<a id='Syntax-Guide-1'></a>

# Syntax Guide


```
@collect X[predicates...] -> (transformations...) [/ {groupbys...}] => summarization(fields...)
```


e.g.


```
@collect iris[sepal_length > 5.0] /
    {species, petal_width > 1.5} =>
    avg_petal_length = mean(petal_length)
```


which is equivalent to


```
@collect filter(iris, sepal_length > 5.0) |>
    groupby(species, petal_width > 1.5) |>
    summarize(avg_petal_length = mean(petal_length))
```


```
@collect iris -> twice_sepal_length = 2 * sepal_length
@collect select(iris, twice_sepal_length = 2 * sepal_length)

```


```
@collect iris => my_avg = mean(5 * f(petal_length))
@collect summarize(iris, my_avg = mean(5 * f(petal_length))
```


```
@collect iris / {species, sepal_width > 1.0}
@collect groupby(iris, species, sepal_width > 1.0)


```


@collect X[x > .5] -> f(x) => mean(x)


```

```

