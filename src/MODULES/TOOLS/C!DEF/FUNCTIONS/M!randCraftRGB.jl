module M!randCraftRGB

    export randCraftRGB

    import ..M!CraftStructs
    import ..M!ColorsKit
    import ..M!Errors

    function randCraftRGB(; TYPE!::UInt8 = UInt8(38), ID!::Union{String, Symbol} = "C!$(length(M!ColorsKit.ColorsKit[:CRAFTED]))")

        if TYPE! != UInt8(38) && TYPE! != "FOREGROUND" && TYPE! != UInt8(48) && TYPE! != "BACKGROUND"; return error(M!Errors.ERRORS[:ERROR_1]); end

        Color = M!CraftStructs.CraftInRGB(
            BOLD = rand(Bool), 
            FAINT = rand(Bool), 
            ITALIC = rand(Bool), 
            UNDERLINE = rand(Bool), 
            BLINKING = rand(Bool), 
            INVERSE = false, 
            HIDDEN = false, 
            STRIKETHROUGH = rand(Bool), 
            TYPE = TYPE!,
            MODE = UInt8(5), 
            R = rand(UInt8(0):UInt8(1):UInt8(255)),
            G = rand(UInt8(0):UInt8(1):UInt8(255)),
            B = rand(UInt8(0):UInt8(1):UInt8(255))
        )

        if typeof(ID!) == Symbol; else; ID! = Symbol(ID!); end

        M!ColorsKit.ColorsKit[:CRAFTED][ID!] = Color 
        return Color
    end

end