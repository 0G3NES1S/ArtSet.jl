module M!Craft256

    export Craft256

    import ..M!CraftStructs
    import ..M!ColorsKit

    function Craft256(; 
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
        COLOR!::UInt8 = UInt8(0)
        )

        if typeof(ID!) == Symbol; else; ID! = Symbol(ID!); end

        Color = M!CraftStructs.CraftIn256(BOLD = BOLD!, FAINT = FAINT!, ITALIC = ITALIC!, UNDERLINE = UNDERLINE!, BLINKING = BLINKING!, INVERSE = INVERSE!, HIDDEN = HIDDEN!, STRIKETHROUGH = STRIKETHROUGH!, TYPE = TYPE!, MODE = UInt8(5), COLOR = COLOR!) # Creates the color
        M!ColorsKit.ColorsKit[:CRAFTED][ID!] = Color # Registers the color
        return Color # And then returns it
    end

end