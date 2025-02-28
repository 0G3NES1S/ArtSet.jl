using Test
using ArtSet

@testset "Craft256 && CraftRGB" begin

    MyColor1 = Tools.Craft256(
        ID = :MyColor1Yeah!,
        BOLD = true,
        FAINT = false,
        ITALIC = true,
        UNDERLINE = false,
        BLINKING = true,
        INVERSE = false,
        HIDDEN = false,
        STRIKETHROUGH = false,
        TYPE = UInt8(38),
        COLOR = UInt8(255)
    )

    MyColor2 = Tools.CraftRGB(
        ID = "MyColor2Yeah!",
        BOLD = true,
        FAINT = false,
        ITALIC = true,
        UNDERLINE = false,
        BLINKING = true,
        INVERSE = false,
        HIDDEN = false,
        STRIKETHROUGH = false,
        TYPE = UInt8(38),
        R = UInt8(134),
        G = UInt8(200),
        B = UInt8(10),
    )

    @test haskey(Tools.ColorsKit[:CRAFTED], :MyColor1Yeah!)
    @test haskey(Tools.ColorsKit[:CRAFTED], :MyColor2Yeah!)

    @test typeof(MyColor1) == Tools.CraftIn256
    @test typeof(MyColor2) == Tools.CraftInRGB 

end

@testset "CraftIn256 && CraftInRGB" begin

    MyColor3 = Tools.CraftIn256(
        true,
        false,
        true,
        false,
        true,
        false,
        false,
        false,
        UInt8(38),
        UInt8(5),
        UInt8(60)
    )

    MyColor4 = Tools.CraftInRGB(
        true,
        false,
        true,
        false,
        true,
        false,
        false,
        false,
        UInt8(38),
        UInt8(5),
        UInt8(10),
        UInt8(20),
        UInt8(30)
    )

    Tools.importc(MyColor3; ID=:MyColor3Yeah!)
    Tools.importc(MyColor4; ID="MyColor4Yeah!")

    @test haskey(Tools.ColorsKit[:CRAFTED], :MyColor3Yeah!)
    @test haskey(Tools.ColorsKit[:CRAFTED], :MyColor4Yeah!)

end

@testset "Draw" begin

    MyColor1 = Tools.Craft256(
        ID = :MyColor1Yeah!,
        BOLD = true,
        FAINT = false,
        ITALIC = true,
        UNDERLINE = false,
        BLINKING = true,
        INVERSE = false,
        HIDDEN = false,
        STRIKETHROUGH = false,
        TYPE = UInt8(38),
        COLOR = UInt8(255)
    )

    MyColor2 = Tools.CraftIn256(
        true,
        false,
        true,
        false,
        true,
        false,
        false,
        false,
        UInt8(38),
        UInt8(5),
        UInt8(60)
    )

    Tools.Draw(MyColor1; TEXT="Hello World!")
    Tools.Draw(MyColor2; TEXT="Hello World!")

end