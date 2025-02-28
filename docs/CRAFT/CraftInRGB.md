# `CraftInRGB()`

```julia

using ArtSet

COLOR2 = Tools.CraftInRGB(
    BOLD = true,
    FAINT = false,
    ITALIC = true,
    UNDERLINE = false,
    BLINKING = true,
    INVERSE = false,
    HIDDEN = false,
    STRIKETHROUGH = false,
    TYPE = UInt8(38),
    MODE = UInt8(2),
    R = UInt8(255),
    G = UInt8(255),
    B = UInt8(255)
)

```

#### `CraftInRGB` Same as `CraftIn256` Instead it has a longer range, from: (0,0,0) to (255,255,255). 

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
| `MODE`             | **UInt8** | Must be **UInt8(5)** if its a range from **0** to **256** and **UInt8(2)** if it's a range from **(0,0,0)** to **(255,255,255)**
| `R`            | **UInt8** | A color from **0** to **255** |
| `G`            | **UInt8** | A color from **0** to **255** |
| `B`            | **UInt8** | A color from **0** to **255** |

----