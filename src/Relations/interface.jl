function attributes end
function index end
function eltypes end
function ncol end
function nrow end

function columns end

columns(r::Relation) = r.cols
attributes(r::Relation) = attributes(r.src)
index(r::Relation) = index(r.src)
ncol(r::Relation) = ncol(r.src)
nrow(r::Relation) = nrow(r.src)
size(r::Relation) = nrow(r), ncol(r)
