module TestSelect

using Collect
using AbstractTables
using Base.Test

A = [1, 2, 3]
B = [4, 5, 6]
C = ["a", "b", "c"]
D = [:a, :b, :c]

for T in (Array, NullableArray)
    r = Relation(A=T(A), B=T(B), C=T(C), D=T(D))
    global src = DataFrame(r)
    _src = copy(src)

    for (field, col) in zip(src.colindex.names, src.columns)
        @eval res = @with src select($field)
        @eval _res = DataFrame($field = $T($col))
        @show res
        @show _res
        @test isequal(src, _src)
        @test isequal(res, _res)
    end

    F = A .* B
    _res1 = DataFrame(F = NullableArray(F))
    res1 = @with src select(F = A * B)
    @test isequal(src, _src)
    @test isequal(res1, _res1)
end

# non-standard lifting semantics

# isnull(x)
src = DataFrame(
    A = NullableArray(collect(1:5), [true, false, true, false, true])
)
_res = DataFrame(
    B = NullableArray([true, false, true, false, true])
)

res = @collect select(src, B = isnull(A))
@test isequal(res, _res)

end
