# This file manages the tests for the `HillRegions.jl` package

# A flag to check if any error occurred
anyerrors = false

# Specify tests
tests_dir = joinpath(@__DIR__, "tests")
tests = ["TestHillRegion.jl", "regression/TestRegression.jl"]

# Print info
println("\e[1;32mRUNNING TESTS\e[0m for `HillRegions.jl`")

# Run tests
for test in joinpath.(tests_dir, tests)

    # Run a test
    try

        include(test)

        # If everything is fine, print about that
        println("\e[1;32mPASSED\e[0m: $(basename(test))")

    # If error occurred, note that
    catch e

        # Alter the global variable
        global anyerrors = true

        # Print about the fail
        println("\e[1;31mFAILED\e[0m: $(basename(test))")

        # Show the error
        showerror(stdout, e, backtrace())
        println()

    end
end

# If any errors, throw an exception
anyerrors && throw("Some tests have failed.")
