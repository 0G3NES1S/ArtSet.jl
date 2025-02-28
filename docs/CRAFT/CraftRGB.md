# `CraftRGB()`

```julia
using ArtSet

BLACK_COLOR = Tools.CraftRGB(
    ID = :BLACK,
    BOLD = true,
    FAINT = false,
    ITALIC = true,
    UNDERLINE = false,
    BLINKING = true,
    INVERSE = false,
    HIDDEN = false,
    STRIKETHROUGH = false,
    TYPE = UInt8(38),
    R = UInt8(0),
    G = UInt8(0),
    B = UInt8(0),
)
```

#### Same shit as `Craft256()` Instead it has a longer range, from: (0,0,0) to (255,255,255). 

### ARGS:

| KWARG              | TYPE     | MEANING  |
| ------------------ | -------- | -------- |
| `ID`               | **String**, **Symbol** | Changes the ID of the color <u>*(RECOMMENDED)*</u> If you dont change it, the function will set a "C" (Color) with the total elements crafted as a default value. Like: "C14" |
| `BOLD`            | **BOOL** | If the value is **true** the function will add a **bold** style to the text given
| `FAINT`            | **BOOL** | **faint** style
| `ITALIC`           | **BOOL** | **Italic** style
| `UNDERLINE`        | **BOOL** | **underline** style
| `BLINKING`         | **BOOL** | **blinking** style
| `INVERSE`          | **BOOL** | **inverse** style
| `HIDDEN`           | **BOOL** | **hidden** style
| `STRIKETHROUGH`    | **BOOL** | **strikethrough** style
| `TYPE`             | **UInt8**, **String** | Select if the text *formatting* is for the foreground or *background* of the text. If u skip this, default value is **"FOREGROUND"**. This value can only a **String** or a **UInt8**: **UInt8(38)** **"FOREGROUND"** / **UInt8(38)** **"BACKGROUND"**
| `R`            | **UInt8** | Select a color from **0 to 255**. Default value is: **UInt8(0)**
| `G`            | **UInt8** | Select a color from **0 to 255**. Default value is: **UInt8(0)**
| `B`            | **UInt8** | Select a color from **0 to 255**. Default value is: **UInt8(0)**

###### <u>note: Color craft structs integer values only supports UInt8</u>
----