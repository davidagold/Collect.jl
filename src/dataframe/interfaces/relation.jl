Rel.index(src::DataFrame) = src.colindex
function Rel.attributes(src::DataFrame)
    colidx = src.colindex
    attrs = Vector{Symbol}(length(colidx))
    for attr in keys(colidx)
        attrs[colidx[attr]] = attr
    end
    return attrs
end
Rel.eltypes(src::DataFrame) = DataFrames.eltypes(src)
Rel.ncol(src::DataFrame) = DataFrames.ncol(src)
Rel.nrow(src::DataFrame) = DataFrames.nrow(src)

Rel.columns(src::DataFrame) = src.columns

# TODO: make generic over column-indexable sources
function Base.convert(::Type{Relation}, src::DataFrame)
    cols = tuple(Rel.columns(src)...)
    attrs = tuple(Rel.attributes(src)...)

    # typedef_ex: an expression that declares a named-tuple type
    T = gensym()
    type_name_ex = Expr(:curly, T)
    type_decl_ex = Expr(:(<:), type_name_ex, :Row)
    type_fields_ex = Expr(:block)
    for attr in attrs
        param = gensym()
        push!(type_name_ex.args, param)
        push!(type_fields_ex.args, Expr(:(::), attr, param))
    end
    typedef_ex = Expr(:type, false, type_decl_ex, type_fields_ex)
    # NOTE: use of eval!
    eval(Relations, typedef_ex)

    # NOTE: Since only column eltypes (and not attributes) are included in
    # type parameters, we do NOT enforce any invariance amongst Relations with
    # given paramter T with respect to attributes. But should we?
    return Relation{typeof(src),typeof(cols),T}(src, cols)
end

Base.start(r::Relation{DataFrame}) = 1
Base.done(r::Relation{DataFrame}, s) = ifelse(s > nrow(r.src), true, false)
@generated function Base.next{C,T}(r::Relation{DataFrame,C,T}, s)
    ncols = length(C.parameters)
    tuple_ex = Expr(:call, Expr(:., :Rel, QuoteNode(T)))
    append!(tuple_ex.args,
        [ Expr(:ref, Expr(:ref, :cols, j), :s) for j in 1:ncols ]
    )

    return quote
        cols = r.cols
        $tuple_ex, s+1
    end
end
