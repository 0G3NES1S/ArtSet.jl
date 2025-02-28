using Test
using ArtSet

@testset "ArtSet.jl" begin
    @test TESTCOLOR1 = Tools.Craft256(
        ID = :MyColorYeah!,
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

    @test TESTCOLOR2 = Tools.CraftRGB(
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

    MyColor = Tools.Craft256(
        ID = :MyColorYeah!,
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

    @test Tools.Draw(MyColor2; TEXT="Hello World!")
    @test Tools.Draw(Tools.ColorsKit[:CRAFTED][:MyColor2Yeah!]; TEXT="Hello World!")

    @test Tools.Draw(MyColor; TEXT="Hello World")
    @test Tools.Draw(Tools.ColorsKit[:CRAFTED][:MyColorYeah!]; TEXT="Hello World!")
    # -<<---->>--

    @test Tools.Draw(:N_F_RED; TEXT="Hello World!")

    # -<<---->>--

    @test TESTCOLOR3 = Tools.CraftIn256(
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

    @test TESTCOLOR4 = Tools.CraftInRGB(
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

    @test Tools.importc(MyColor3; ID=:MyColor3Yeah!TEST)
    @test Tools.importc(MyColor4; ID="MyColor4Yeah!TEST")

    Tools.importc(MyColor3; ID=:MyColor3Yeah!)
    Tools.importc(MyColor4; ID="MyColor4Yeah!")

    @test Tools.Draw(Tools.ColorsKit[:CRAFTED][:MyColor3Yeah!]; TEXT="Hello World!")
    @test Tools.Draw(Tools.ColorsKit[:CRAFTED][:MyColor4Yeah!]; TEXT="Hello World!")

end