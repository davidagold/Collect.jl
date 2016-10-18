using Documenter, Collect

makedocs(
    modules = [Collect],
    format = :html,
    sitename = "Collect.jl",
    authors = "David A. Gold and contributors.",
    pages = Any[
        "Home" => "index.md",
        "Manual" => Any[
            "Guide" => "man/guide.md",
            "Syntax" => "man/syntax.md",
            # "Grouped Data" => "man/grouped.md"
            "One-Table Verbs" => "man/verbs1.md",
            "Two-Table Verbs" => "man/verbs2.md",
            "Examples" => "man/examples.md"
        ],
        "Library" => Any[
            "Public" => "lib/public.md"
            "Internals" => Any[
                "Internals" => "lib/internals.md",
                "lib/internals/interfaces.md"
            ]
        ]
    ]
)
