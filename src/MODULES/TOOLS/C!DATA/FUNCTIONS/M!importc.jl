module M!importc

    export importc

    import ..M!CraftStructs
    import ..M!ColorsKit

    function importc(COLOR::Union{M!CraftStructs.CraftIn256, M!CraftStructs.CraftInRGB}; ID!::Union{String, Symbol} = "C!$(length(M!ColorsKit.ColorsKit[:CRAFTED]))")
        if typeof(ID!) == Symbol; else; ID! = Symbol(ID!); end
        M!ColorsKit.ColorsKit[:CRAFTED][ID!] = COLOR
    end

end