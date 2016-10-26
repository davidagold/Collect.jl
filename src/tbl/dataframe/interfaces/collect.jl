# AbstractTables.default(::Tbl{DataFrame}) = Tbl(DataFrame())
# AbstractTables.default(::Grouped{DataFrame}) = Tbl(DataFrame())
# Base.copy(tbl::Tbl{DataFrame}) = Tbl(copy(tbl.src))
# Base.collect(tbl::Tbl{DataFrame}) = tbl.src

AbstractTables.default(::DataFrame) = DataFrame()
AbstractTables.default(::DataFrame, ::DataFrame) = DataFrame()
AbstractTables.default(::Grouped{DataFrame}) = DataFrame()
