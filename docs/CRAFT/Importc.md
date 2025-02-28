# `importc()`

```julia
using ArtSet

# Using previous variables
Tools.importc(COLOR1; ID=:COLOR1)
```

#### `importc()` just imports the color created manually to the ColorsKit Dict

### ARGS:

| KWARG              | TYPE     | MEANING  |
| ------------------ | -------- | -------- |
| `COLOR`               | **CraftIn256**, **CraftInRGB**| The color that will be imported/saved |
| `ID`               | **String**, **Symbol** | The ID of the color that will be saved/imported |
----