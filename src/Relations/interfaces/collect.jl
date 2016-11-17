
prepare(r::Relations.Relation) = r
# TODO: make generic with Data.stream!
function Base.collect{S<:Attributed}(r::Relation{S})
    return DataFrame(Any[columns(source(r))...], DataFrames.Index(Relations.index(r), Relations.attributes(r)))
end
