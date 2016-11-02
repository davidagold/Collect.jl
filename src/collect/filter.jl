using Base: Generator

Base.start{A<:Relation, Q<:SQ.QueryNode}(src::Generator{Tuple{A}, Q}) = start(first(src.iter))
Base.done{A<:Relation, Q<:SQ.QueryNode}(src::Generator{Tuple{A}, Q}, s) = done(first(src.iter), s)

function Base.next{R<:Relation}(src::Generator{Tuple{R}, SQ.Node{:filter}}, s)
    rows = first(src.iter)
    i, s = next(rows, s)
    v = Nullable(true)
    # for h in SQ.helpers(src.f)
    #     p = SQ.parts(h)[1]
    #     v = SQ.lift(&, v, apply(p, i))
    #     ifelse(v.hasvalue, v.value, false) || break
    # end
    p = SQ.parts(SQ.helpers(src.f)[1])[1]
    v = apply(p, i)
    return (v, i), s
end

@noinline apply(p, i) = p(i)

function Base.collect{A<:Relation}(src::Generator{Tuple{A}, SQ.Node{:filter}})
    res = similar(first(src.iter), 0) # src.iter is an Relation
    attrs_cols = zip(Rel.attributes(res), res.cols)
    for (v, i) in src
        if ifelse(v.hasvalue, v.value, false)
            push!(attrs_cols, i)
        end
    end
    return res
end
