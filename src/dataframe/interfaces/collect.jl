# default(::DataFrame) = DataFrame()
StructuredQueries.prepare(src::DataFrame) = Relation(src)
SQ._with(q::SQ.Node, src::Tuple{DataFrame}) = SQ.as(collect(q), DataFrame)
SQ._with(q::SQ.Node, src::Tuple{DataFrame,DataFrame}) = SQ.as(collect(q), DataFrame)

SQ.as{S<:Attributed}(r::Relation{S}, ::Type{DataFrame}) = DataFrame(r)
SQ.as{S<:Relation}(g::Grouped{S}, ::Type{DataFrame}) =
    Grouped(SQ.as(g.src, DataFrame), g.group_indices, g.groupbys, g.group_levels, g.metadata)
