using StructuredQueries: Query, QueryNode, Node, DataNode



# TODO: make generic with Data.stream!
# function Base.collect{S<:Attributed}(r::Relation{S})
#     return DataFrame(Any[Relations.columns(r)...], DataFrames.Index(Relations.index(r), Relations.attributes(r)))
# end
