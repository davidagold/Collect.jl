AbstractTables.default(::Tbl{DataFrame}) = Tbl(DataFrame())
Base.copy(tbl::Tbl{DataFrame}) = Tbl(copy(tbl.src))
Base.collect(tbl::Tbl{DataFrame}) = tbl.src
