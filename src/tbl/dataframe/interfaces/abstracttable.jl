function AbstractTables.fields(tbl::Tbl{DataFrame})
    df = tbl.src
    index = df.colindex
    flds = Vector{Symbol}(DataFrames.ncol(df))
    for field in collect(keys(df.colindex))
        j = index[field]
        flds[j] = field
    end
    return flds
end

AbstractTables.index(tbl::Tbl{DataFrame}) = tbl.src.colindex
AbstractTables.eltypes(tbl::Tbl{DataFrame}) = DataFrames.eltypes(tbl.src)
AbstractTables.nrow(tbl::Tbl{DataFrame}) = DataFrames.nrow(tbl.src)
