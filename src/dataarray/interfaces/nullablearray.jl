Base.convert(::Type{NullableArray}, D::DataArray) =
    NullableArray(D.data, convert(Array{Bool}, D.na))
