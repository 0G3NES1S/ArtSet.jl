module M!CraftStructs

    export CraftIn256, CraftInRGB

    @kwdef mutable struct CraftIn256
        BOLD::Bool = false
        FAINT::Bool = false
        ITALIC::Bool = false
        UNDERLINE::Bool = false
        BLINKING::Bool = false
        INVERSE::Bool = false
        HIDDEN::Bool = false
        STRIKETHROUGH::Bool = false
        TYPE::Union{String, UInt8} = UInt8(38)
        MODE::UInt8 = UInt8(5)
        COLOR::UInt8 = UInt8(0)
    end

    @kwdef mutable struct CraftInRGB
        BOLD::Bool = false
        FAINT::Bool = false
        ITALIC::Bool = false
        UNDERLINE::Bool = false
        BLINKING::Bool = false
        INVERSE::Bool = false
        HIDDEN::Bool = false
        STRIKETHROUGH::Bool = false
        TYPE::Union{String, UInt8} = UInt8(38)
        MODE::UInt8 = UInt8(2)
        R::UInt8 = UInt8(0)
        G::UInt8 = UInt8(0)
        B::UInt8 = UInt8(0)
    end

end