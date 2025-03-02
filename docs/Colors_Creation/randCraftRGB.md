# `randCraftRGB()`

```julia
using ArtSet

WHITE_COLOR = Tools.randCraftRGB(; TYPE! = UInt8(38), ID! = :MyRandColor,)
```

#### Same as [randCraft256()](https://github.com/0G3NES1S/ArtSet.jl/blob/main/docs/Colors_Creation/randCraft256.md) with the difference that is in RGB mode

### ARGS:

| KWARG              | TYPE     | MEANING  |
| ------------------ | -------- | -------- |
| `TYPE!`               | **String**, **Symbol** | Select if the text *formatting* is for the foreground or *background* of the text. If u skip this, default value is **"FOREGROUND"**. This value can only be a **String** or a **UInt8**: **UInt8(38)** **"FOREGROUND"** / **UInt8(38)** **"BACKGROUND"** |
| `ID!`               | **String**, **Symbol** | Changes the ID of the color <u>*(RECOMMENDED)*</u> If you dont change it, the function will set a "C" (Color) with the total elements crafted as a default value. Like: "C14" |
----