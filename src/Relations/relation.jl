abstract Attributed

# S is type of source; T is the named-tuple-ish type




# immutable Columns{C}
#     cols::C
# end
# columns(c::Columns) = c.cols
# Base.length(c::Columns) = length(columns(c))
#
# Base.start(c::Columns) = tuple([ start(col) for col in columns(c) ]...)
# function Base.done(c::Columns, s)
#     res = false
#     for (col, s_j) in zip(columns(c), s)
#         res |= done(col, s_j)
#     end
#     return res
# end
# # Base.done(c::Columns, s) = length(c) > 0 ? (s > length(first(columns(c)))) : true
# # Base.next(c::Columns, s) = tuple([next])
# @inline @generated function Base.next{C}(c::Columns{C}, s)
#     v_ex, s_ex = Expr(:tuple), Expr(:tuple)
#     n = length(C.parameters)
#     for j in 1:length(C.parameters)
#         push!(v_ex.args, Symbol("v_$j"))
#         push!(s_ex.args, Symbol("s_$j"))
#     end
#
#     return quote
#         cols = c.cols
#         @nexprs $n j-> begin v_j, s_j = next(cols[j], s[j]) end
#         return $v_ex, $s_ex
#     end
# end
#
# function Base.push!{C}(c::Columns{C}, i::Row)
#     for (col, attr) in zip(columns(c), fieldnames(i))
#         push!(col, getfield(i, attr))
#     end
#     return
# end



# Relation{T}(c::Columns, ::Type{T}) = Relation{typeof(c),T}(c)
#
# function Relation{T}(cols::Tuple{Vararg{NullableVector}}, ::Type{T})
#     c = Columns(cols)
#     return Relation{typeof(c),T}(c)
# end
#
#
# Base.start{S<:Columns}(r::Relation{S}) = start(source(r))
# function Base.next{C,T}(r::Relation{C,T}, s)
#     tpl, s = next(source(r), s)
#     return T(tpl...), s
# end
# Base.done{S<:Columns}(r::Relation{S}, s) = done(source(r), s)
