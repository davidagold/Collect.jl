# function default(::Relation)
#
#     tuple([ NullableVector() ]...)
# end

function Base.push!(attrs_cols, row::Row)::Void
    # TODO: safety checks
    for (attr, col) in attrs_cols
        push!(col, getfield(row, attr))
    end
    return
end


# function Base.push!(r::Relation, row::Row)::Void
#     # TODO: safety checks
#     for (attr, col) in zip(Rel.attributes(tbl), r.cols)
#         push!(col, getfield(row, attr))
#     end
#     return
# end

# Base.push!(r::Relation, row::Row)::Void =
#     _push!(zip(AT.attributes(r), r.cols), row)
#
# @noinline function _push!(attrs_cols, row)::Void
#     for (attr, col) in attrs_cols
#         push!(col, getfield(row, attr))
#     end
#     return
# end

function Base.similar{S,C,T}(a::Relation{S,C,T}, n::Int)
    # cols = tuple([ NullableVector{C}(0) for C in eltypes(tbl) ]...)
    new_src = similar(a.src, 0)
    new_cols = tuple([ similar(col, 0) for col in a.cols ]...)
    return Relation{S,C,T}(new_src, new_cols)
end

# TODO: make generic with Data.stream!
function Base.collect(r::Relation)
    return DataFrame(Any[r.cols...], Relations.index(r))
end
