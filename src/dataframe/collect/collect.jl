# SQ._collect(df::DataFrame, q::SQ.QueryNode) = SQ._collect(Tbl(df), q)
# function SQ._collect(g_df::Grouped{DataFrame}, q::SQ.SummarizeNode)
#     _g_df = Grouped(
#         Tbl(g_df.source), g_df.group_indices, g_df.groupbys,
#         g_df.group_levels, g_df.metadata
#     )
#     return SQ._collect(_g_df, q)
# end

SQ._collect(df::DataFrame, q::SQ.QueryNode) = AbstractTables.__collect(df, q)
SQ._collect(df1::DataFrame, df2::DataFrame, q::SQ.JoinNode) = AbstractTables.__collect(df1, df2, q)
Base.collect(df::DataFrame) = df
