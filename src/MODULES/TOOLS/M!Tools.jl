module Tools

    include(joinpath(@__DIR__, "C!DEF", "STRUCTS", "M!CraftStructs.jl")); using .M!CraftStructs
    include(joinpath(@__DIR__, "C!DATA", "DICTS", "M!ColorsKit.jl")); using .M!ColorsKit
    include(joinpath(@__DIR__, "C!DATA", "DICTS", "M!Errors.jl")); using .M!Errors
    include(joinpath(@__DIR__, "..", "ANSI", "ESC!CODES", "M!ESC!CVariables.jl")); using .M!ESC!CVariables

    include(joinpath(@__DIR__, "C!DEF", "FUNCTIONS", "M!Craft256.jl")); using .M!Craft256
    include(joinpath(@__DIR__, "C!DEF", "FUNCTIONS", "M!CraftRGB.jl")); using .M!CraftRGB
    include(joinpath(@__DIR__, "C!DEF", "FUNCTIONS", "M!randCraft256.jl")); using .M!randCraft256
    include(joinpath(@__DIR__, "C!DEF", "FUNCTIONS", "M!randCraftRGB.jl")); using .M!randCraftRGB

    include(joinpath(@__DIR__, "C!DATA", "FUNCTIONS", "M!importc.jl")); using .M!importc

    include(joinpath(@__DIR__, "C!USE", "M!Draw.jl")); using .M!Draw

    export ColorsKit, Craft256, CraftRGB, randCraft256, randCraftRGB, CraftIn256, CraftInRGB, Draw, importc
end