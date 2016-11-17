function _collect{R<:Relation}(_src::Tuple{R}, q::SQ.FilterNode)
    src = first(_src)
    @time res = similar(src)
    h = first(SQ.helpers(q))
    @time grow!(res, src, h)
    return res
end

function grow!{F}(res, src, h::SQ.FilterHelper{F})::Void
    # TODO: should only need one first here now that you've fixed filter
    f = first(first(SQ.parts(h)))
    for i in src
        v = f(i)
        if ifelse(v.hasvalue, v.value, false)
            push!(res, i)
        end
    end
end
