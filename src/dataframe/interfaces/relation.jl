Base.convert(::Type{Relation}, src::DataFrame) =
    Relation(tuple(src.colindex.names...),
             [ isa(col, DataArray) ? NullableArray(col) : col for col in src.columns ]...)
