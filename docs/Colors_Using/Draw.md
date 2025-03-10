# `Draw()`

```julia
using ArtSet

MyColor = Tools.Craft256(
    ID! = "MyColorYeah!",
    BOLD! = true,
    FAINT! = false,
    ITALIC! = true,
    UNDERLINE! = false,
    BLINKING! = true,
    INVERSE! = false,
    HIDDEN! = false,
    STRIKETHROUGH! = false,
    TYPE! = UInt8(38),
    COLOR! = UInt8(100)
)

Tools.Draw(MyColor; TEXT="Hello World!")

Tools.Draw(:F_N_RED; TEXT="Hello World!") # FOREGROUND NORMAL RED = F_N_RED

```

#### `Draw()` Prints the given text with the given color.

### ARGS:

| KWARG OR ARG        | TYPE                                       | MEANING  |
| ------------------- | ------------------------------------------ | -------- |
| `COLOR`               | **CraftIn256**, **CraftInRGB**, **Symbol** | The color config or color value that the text given will be formated |
| `TEXT`                | **Any**                                 | Text that is going to be formatted |

----