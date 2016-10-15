module TestSummarize

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

_res = DataFrame(
    B_avg = NullableArray([mean([4, 5, 6])])
)
res = @collect summarize(src, B_avg = mean(B))
@test isequal(src, _src)
@test isequal(res, _res)

# non-standard lifting semantics

src = DataFrame(
    A = NullableArray([true, true, false, false]),
    B = NullableArray([true, true, false, false], [true, false, true, false])
)
_src = copy(src)

## NOTE: the following two tests fail because `isnull` is parsed as the
##       name of a column! `isnull` needs to be interpolated
# _res = DataFrame(
#     mapred = NullableArray([false])
# )
# res = @collect summarize(src, red = mapreduce(insull, |, A))
# @test isequal(src, _src)
# @test isequal(res, _res)

# _res = DataFrame(
#     mapred = NullableArray([true])
# )
# res = @collect summarize(src, mapred = mapreduce(insull, |, true, A))
# @test isequal(src, _src)
# @test isequal(res, _res)

end
