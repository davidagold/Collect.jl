# TODO: make generic with Data.stream!
Base.convert{S<:Attributed}(::Type{DataFrame}, r::Relation{S}) =
    DataFrame(Any[r.src...],
              DataFrames.Index(Relations.index(r), Relations.attributes(r)))

(::Type{DataFrame}){S<:Attributed}(r::Relation{S}) = convert(DataFrame, r)
