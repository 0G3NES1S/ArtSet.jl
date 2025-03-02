# `importc()`

```julia
using ArtSet

COLOR1 = Tools.CraftIn256(
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
    COLOR = UInt8(256)
)

Tools.importc(COLOR1; ID=:COLOR1)
```

#### `importc()` just imports the color created manually to the [ColorsKit Dict](https://github.com/0G3NES1S/ArtSet.jl/tree/main/docs/Colors_Saving/ColorsKit.md)

### ARGS:

| KWARG              | TYPE     | MEANING  |
| ------------------ | -------- | -------- |
| `COLOR`               | **CraftIn256**, **CraftInRGB**| The color that will be imported/saved |
| `ID`               | **String**, **Symbol** | The ID of the color that will be saved/imported |
----