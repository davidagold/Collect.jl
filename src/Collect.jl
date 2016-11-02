module Collect

using Reexport
@reexport using StructuredQueries
const SQ = StructuredQueries
# using AbstractTables
# const AT = AbstractTables
@reexport using DataFrames


include("Relations/Relations.jl")
using .Relations
const Rel = Relations

include("collect/interface.jl")
include("collect/utils.jl")
include("collect/collect.jl")
include("collect/filter.jl")

include("dataframe/interfaces/relation.jl")
include("dataframe/interfaces/collect.jl")



end
