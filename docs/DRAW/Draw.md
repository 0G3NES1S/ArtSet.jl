# `Draw()`

```julia
using ArtSet

# Using colors from previous scripts
Tools.Draw(MyColor; TEXT="Hello World!")

# Default Color value
Tools.Draw(:F_N_RED; TEXT="Hello World!") # FOREGROUND NORMAL RED = F_N_RED

```

#### `Draw()` Prints the given text with the given color.

### ARGS:

| KWARG OR ARG        | TYPE                                       | MEANING  |
| ------------------- | ------------------------------------------ | -------- |
| `COLOR`               | **CraftIn256**, **CraftInRGB**, **Symbol** | The color config or color value that the text given will be formated |
| `TEXT`                | **Any**                                 | Text that is going to be formatted |

----