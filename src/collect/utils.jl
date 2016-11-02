# function pushrow!(columns, row)::Void
#     # TODO: safety checks
#     for (col, v) in zip(columns, row)
#         push!(col, v)
#     end
#     return
# end

"""
    subset(tpl::Tuple, I::Tuple)

Produce a subset of `tpl` based on the contents of `I` (assumed to be numeric
indices).
"""
@generated function subset{J}(tpl::Tuple, I::Tuple{Vararg{Int, J}})
    res = Expr(:tuple)
    idxs = map(j->Expr(:ref, :I, j), 1:J)
    els = map(k->Expr(:ref, :tpl, idxs[k]), 1:J)
    res.args = els
    return res
end
