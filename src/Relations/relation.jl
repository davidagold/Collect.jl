abstract Row

# S is type of source; C is a tuple type of column eltypes; T
immutable Relation{S,C,T}
    src::S
    cols::C
end

# TODO: make generic over arbitrary column-indexable sources
Base.start(r::Relation) = start(r.src)
Base.done(r::Relation, s) = done(r.src, s)
