using StructuredQueries: Query, QueryNode, Node, DataNode

"""
    Base.collect(q::Query)

Collect a `qry` against the source wrapped in the base `DataNode` of
`qry.graph`.
"""
Base.collect(q::Query) = collect(collect(q.graph))
# Base.collect(q::Query) = collect(q.graph)

function Base.collect(q::QueryNode)
    inputs = tuple([ collect(input) for input in q.inputs ]...)
    g = Generator{typeof(inputs), typeof(q)}(q, inputs)
    return collect(g)
end

Base.collect(d::DataNode) = prepare(d.input)
