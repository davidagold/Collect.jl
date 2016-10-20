SQ._collect(df::DataFrame, q::SQ.QueryNode) = SQ._collect(Tbl(df), q)
function SQ._collect(g_df::Grouped{DataFrame}, q::SQ.SummarizeNode)
    _g_df = Grouped(
        Tbl(g_df.source), g_df.group_indices, g_df.groupbys,
        g_df.group_levels, g_df.metadata
    )
    return SQ._collect(_g_df, q)
end
