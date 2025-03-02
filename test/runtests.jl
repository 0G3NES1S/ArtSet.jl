using Test
using ArtSet

@testset "Craft256 && CraftRGB" begin

    MyColor1 = Tools.Craft256(
        ID! = :C1255,
        BOLD! = true,
        FAINT! = false,
        ITALIC! = true,
        UNDERLINE! = false,
        BLINKING! = true,
        INVERSE! = false,
        HIDDEN! = false,
        STRIKETHROUGH! = false,
        TYPE! = UInt8(38),
        COLOR! = UInt8(255)
    )

    MyColor2 = Tools.CraftRGB(
        ID! = "C2_13420010",
        BOLD! = true,
        FAINT! = false,
        ITALIC! = true,
        UNDERLINE! = false,
        BLINKING! = true,
        INVERSE! = false,
        HIDDEN! = false,
        STRIKETHROUGH! = false,
        TYPE! = UInt8(38),
        R! = UInt8(134),
        G! = UInt8(200),
        B! = UInt8(10),
    )

    @test haskey(Tools.ColorsKit[:CRAFTED], :C1255)
    @test haskey(Tools.ColorsKit[:CRAFTED], :C2_13420010)

    @test typeof(MyColor1) == Tools.CraftIn256
    @test typeof(MyColor2) == Tools.CraftInRGB

    Tools.Draw(MyColor1; TEXT=":C1255")
    Tools.Draw(MyColor2; TEXT=":C2_13420010")

end

@testset "CraftIn256 && CraftInRGB && importc" begin

    MyColor1 = Tools.CraftIn256(
        BOLD = true,
        FAINT = false,
        ITALIC = true,
        UNDERLINE = false,
        BLINKING = true,
        INVERSE = false,
        HIDDEN = false,
        STRIKETHROUGH = false,
        TYPE = UInt8(38),
        MODE = UInt8(5),
        COLOR = UInt8(60)
    )

    MyColor2 = Tools.CraftInRGB(
        BOLD = true,
        FAINT = false,
        ITALIC = true,
        UNDERLINE = false,
        BLINKING = true,
        INVERSE = false,
        HIDDEN = false,
        STRIKETHROUGH = false,
        TYPE = UInt8(38),
        MODE = UInt8(5),
        R = UInt8(10),
        G = UInt8(20),
        B = UInt8(30)
    )

    Tools.importc(MyColor1; ID! =:C160)
    Tools.importc(MyColor2; ID! ="C2_102030")

    @test haskey(Tools.ColorsKit[:CRAFTED], :C160)
    @test haskey(Tools.ColorsKit[:CRAFTED], :C2_102030)

    Tools.Draw(MyColor1; TEXT=":C160")
    Tools.Draw(MyColor2; TEXT=":C2_102030")

end

@testset "randCraft256 && randCraftRGB" begin

    MyColor1 = Tools.randCraft256(; TYPE = UInt8(38), ID = "C138")
    MyColor2 = Tools.randCraft256(; TYPE = UInt8(48), ID = "C248")
    MyColor3 = Tools.randCraftRGB(; TYPE = UInt8(38), ID = "C338")
    MyColor4 = Tools.randCraftRGB(; TYPE = UInt8(48), ID = "C448")

    Tools.Draw(MyColor1; TEXT="C138")
    Tools.Draw(MyColor2; TEXT="C248")
    Tools.Draw(MyColor3; TEXT="C338")
    Tools.Draw(MyColor4; TEXT="C448")

end

@testset "Draw" begin

    MyColor1 = Tools.Craft256(
        ID! = :MyColor1Yeah!,
        BOLD! = true,
        FAINT! = false,
        ITALIC! = true,
        UNDERLINE! = false,
        BLINKING! = true,
        INVERSE! = false,
        HIDDEN! = false,
        STRIKETHROUGH! = false,
        TYPE! = UInt8(38),
        COLOR! = UInt8(255)
    )

    MyColor2 = Tools.CraftIn256(
        BOLD = true,
        FAINT = false,
        ITALIC = true,
        UNDERLINE = false,
        BLINKING = true,
        INVERSE = false,
        HIDDEN = false,
        STRIKETHROUGH = false,
        TYPE = UInt8(38),
        MODE = UInt8(5),
        COLOR = UInt8(60)
    )

    Tools.Draw(MyColor1; TEXT="C1255")
    Tools.Draw(MyColor2; TEXT="C260")

end