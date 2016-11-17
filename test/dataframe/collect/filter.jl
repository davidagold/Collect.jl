module TestFilter

using Collect
using Base.Test

A = [1, 2, 3]
B = [4, 5, 6]
C = ["a", "b", "c"]
D = [:a, :b, :c]

src = DataFrame(A=A, B=B, C=C, D=D)
_src = copy(src)

# basic functionality

I = which(i->i>2, A)
_res = DataFrame(A=A[I], B=B[I], C=C[I], D=D[I])
res = @with src filter(A > 2)
@test isequal(src, _src)
@test isequal(res, _res)

# # non-standard lifting semantics
#
# # three-valued logic semantics for |
# src = DataFrame(
#     A = [true, true, false, false],
#     B = ([false, false, true, true], [true, false, true, false])
# )
# _src = copy(src)
# _res = DataFrame(
#     A = NullableArray([true, true, false]),
#     B = NullableArray([false, false, true], [true, false, false])
# )
# res = @with src filter(A | B)
# @test isequal(src, _src)
# @test isequal(res, _res)
#
# # three-valued logic semantics for &
# src = DataFrame(
#     A = NullableArray([true, true, false, false]),
#     B = NullableArray([true, true, false, false], [true, false, true, false])
# )
# _src = copy(src)
#
# _res = DataFrame(
#     A = NullableArray([true]),
#     B = NullableArray([true], [false])
# )
# res = @with src filter(A & B)
# @test isequal(src, _src)
# @test isequal(res, _res)
#
# # isnull(x)
#
# src = DataFrame(
#     A = NullableArray([true, true, false, false]),
#     B = NullableArray([true, true, false, false], [true, false, true, false])
# )
# _src = copy(src)
#
# _res = DataFrame(
#     A = NullableVector{Bool}(),
#     B = NullableVector{Bool}()
# )
# res = @with src filter(isnull(A))
# @test isequal(src, _src)
# @test isequal(res, _res)
#
# _res = DataFrame(
#     A = NullableArray([true, true, false, false]),
#     B = NullableArray([true, true, false, false], [true, false, true, false])
# )
# res = @with src filter(isnull(A))
# @test isequal(src, _src)
# @test isequal(res, _res)
#
# _res = DataFrame(
#     A = NullableArray([true, false]),
#     B = NullableArray([true, false], [true, true])
# )
# res = @with filter(isnull(B))
# @test isequal(src, _src)
# @test isequal(res, _res)



end
