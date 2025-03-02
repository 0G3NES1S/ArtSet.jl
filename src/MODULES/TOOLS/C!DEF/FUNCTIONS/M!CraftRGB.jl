module M!CraftRGB

    export CraftRGB

    import ..M!CraftStructs
    import ..M!ColorsKit

    function CraftRGB(; 
        ID!::Union{String, Symbol} = "C!$(length(M!ColorsKit.ColorsKit[:CRAFTED]))",
        BOLD!::Bool = false,
        FAINT!::Bool = false,
        ITALIC!::Bool = false,
        UNDERLINE!::Bool = false, 
        BLINKING!::Bool = false,
        INVERSE!::Bool = false,
        HIDDEN!::Bool = false,
        STRIKETHROUGH!::Bool = false,
        TYPE!::Union{String, UInt8} = "FOREGROUND", 
        R!::UInt8 = UInt8(0),
        G!::UInt8 = UInt8(0),
        B!::UInt8 = UInt8(0)
        )

        if typeof(ID!) == Symbol; else; ID = Symbol(ID!); end
        
        Color = M!CraftStructs.CraftInRGB(BOLD = BOLD!, FAINT = FAINT!, ITALIC = ITALIC!, UNDERLINE = UNDERLINE!, BLINKING = BLINKING!, INVERSE = INVERSE!, HIDDEN = HIDDEN!, STRIKETHROUGH = STRIKETHROUGH!, TYPE = TYPE!, MODE = UInt8(2), R = R!, G = G!, B = B!)
        M!ColorsKit.ColorsKit[:CRAFTED][ID!] = Color 
        return Color
    end

end