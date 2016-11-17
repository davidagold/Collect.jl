function attributes end
function index end
function eltypes end
function ncol end
function nrow end

function columns end

columns(r::Relation) = r.cols
attributes{S,T}(r::Relation{S,T}) = fieldnames(T)
function index{S,T}(r::Relation{S,T})::Dict{Symbol, Int}
    index = Dict{Symbol, Int}()
    for (j, attr) in enumerate(fieldnames(T))
        index[attr] = j
    end
    return index
end
ncol(r::Relation) = ncol(r.src)
nrow(r::Relation) = nrow(r.src)
size(r::Relation) = nrow(r), ncol(r)
