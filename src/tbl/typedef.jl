"""
    Tbl <: AbstractTable

A wrapper type to interface general tabular data types with the AbstractTables
framework.
"""
immutable Tbl{S} <: AbstractTable
    src::S
end
