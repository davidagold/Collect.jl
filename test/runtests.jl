fatalerrors = length(ARGS) > 0 && ARGS[1] == "-f"
quiet = length(ARGS) > 0 && ARGS[1] == "-q"
anyerrors = false

my_tests = (
    # "dataframe/collect/select.jl",
    # "dataframe/collect/filter.jl",
    # "dataframe/collect/groupby.jl",
    # "dataframe/collect/summarize.jl",
    # "dataframe/collect/combinations.jl",
    # "dataframe/grouped/collect/summarize.jl",
)

println("Running tests:")

using Base.Test

@testset "All tests" begin
    for my_test in my_tests
        try
            include(my_test)
            println("\t\033[1m\033[32mPASSED\033[0m: $(my_test)")
        catch e
            anyerrors = true
            println("\t\033[1m\033[31mFAILED\033[0m: $(my_test)")
            if fatalerrors
                rethrow(e)
            elseif !quiet
                showerror(STDOUT, e, backtrace())
                println()
            end
        end
    end
end

if anyerrors
    throw("Tests failed")
end
