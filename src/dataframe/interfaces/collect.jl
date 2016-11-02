# default(::DataFrame) = DataFrame()
Collect.prepare(src::DataFrame) = Relation(src)
