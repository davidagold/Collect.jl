module TestCombinations

using Collect
using Base.Test

A = [1, 2, 3]
B = [4, 5, 6]
C = ["a", "b", "c"]
D = [:a, :b, :c]

src = DataFrame(
    A = NullableArray(A),
    B = NullableArray(B),
    C = NullableArray(C),
    D = NullableArray(D)
)
_src = copy(src)

# test combinations
_res = DataFrame(
    B = NullableArray([4])
)
res = @collect filter(src, A == 1) |>
    select(B)
@test isequal(src, _src)
@test isequal(_res, res)

end
