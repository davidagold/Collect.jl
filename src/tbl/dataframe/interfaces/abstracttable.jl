function AbstractTables.fields(src::DataFrame)
    index = src.colindex
    flds = Vector{Symbol}(DataFrames.ncol(src))
    for field in collect(keys(src.colindex))
        j = index[field]
        flds[j] = field
    end
    return flds
end

# AbstractTables.index(tbl::Tbl{DataFrame}) = tbl.src.colindex
# AbstractTables.eltypes(tbl::Tbl{DataFrame}) = DataFrames.eltypes(tbl.src)
# AbstractTables.nrow(tbl::Tbl{DataFrame}) = DataFrames.nrow(tbl.src)

AbstractTables.index(src::DataFrame) = src.colindex
AbstractTables.eltypes(src::DataFrame) = DataFrames.eltypes(src)
AbstractTables.nrow(tbl::DataFrame) = DataFrames.nrow(src)
