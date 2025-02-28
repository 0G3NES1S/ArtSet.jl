# `CraftIn256()`

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
    MODE = UInt8(5), # Must be 5 if it is in range from 0 to 256 only
    COLOR = UInt8(256) # white
)

```

#### `CraftIn256` It's a mutable struct that creates the color itself, specifying his parameters

### ARGS:

| KWARG              | TYPE     | MEANING  |
| ------------------ | -------- | -------- |
| `BOLD`             | **BOOL** | **bold** style
| `FAINT`            | **BOOL** | **faint** style
| `ITALIC`           | **BOOL** | **Italic** style
| `UNDERLINE`        | **BOOL** | **underline** style
| `BLINKING`         | **BOOL** | **blinking** style
| `INVERSE`          | **BOOL** | **inverse** style
| `HIDDEN`           | **BOOL** | **hidden** style
| `STRIKETHROUGH`    | **BOOL** | **strikethrough** style
| `TYPE`             | **UInt8**, **String** | Select if the text *formatting* is for the foreground or *background* of the text.
| `MODE`             | **UInt8** | Must be **UInt8(5)** if its a range from **0** to **256** and **UInt8(2)** if it's a range from **(0,0,0)** to **(255,255,255)**
| `COLOR`            | **UInt8** | A color from **0** to **256** |

----