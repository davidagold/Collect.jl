module Collect

using Reexport
@reexport using StructuredQueries
const SQ = StructuredQueries
using AbstractTables
@reexport using DataFrames

include("tbl/typedef.jl")

include("tbl/dataframe/interfaces/abstracttable.jl")
include("tbl/dataframe/interfaces/column_indexable.jl")
include("tbl/dataframe/interfaces/collect.jl")

include("dataframe/collect/collect.jl")

end # module
