# Package Guide

## Installation

Collect is a registered package. Install it with

```
Pkg.add("Collect")
```

This package supports Julia 0.5 and the current DataFrames.jl `master` branch. To obtain the latter, use

```
Pkg.checkout("DataFrames")
```

## Querying and Collection

Once you've checked out the DataFrames master branch, you're ready to use Collect.

```
julia> using DataFrames

julia> using Collect
```

Use `@query` to produce a `Query` against a `DataFrame`

```
q =
```

`Query`s can be composed ...

Use `collect` to materialize a `Query` as a `DataFrame`

```

```

Or, just use the `@collect ...` convenience macro (equivalent to `collect(@query ...)`) to query and collect in a single command:

```

```

## Backends
