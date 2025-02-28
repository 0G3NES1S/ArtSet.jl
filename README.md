# ArtSet.jl 🎨🖌️

----

[![forthebadge](https://forthebadge.com/images/badges/license-mit.svg)](https://forthebadge.com) [![forthebadge](https://forthebadge.com/images/badges/made-with-julia.svg)](https://forthebadge.com) [![forthebadge](https://forthebadge.com/images/badges/you-didnt-ask-for-this.svg)](https://forthebadge.com) [![forthebadge](https://forthebadge.com/images/badges/works-on-my-machine.svg)](https://forthebadge.com)

[![CI](https://github.com/0G3NES1S/ArtSet.jl/actions/workflows/CI.yml/badge.svg)](https://github.com/0G3NES1S/ArtSet.jl/actions/workflows/CI.yml) [![CompatHelper](https://github.com/0G3NES1S/ArtSet.jl/actions/workflows/CompatHelper.yml/badge.svg)](https://github.com/0G3NES1S/ArtSet.jl/actions/workflows/CompatHelper.yml) [![Dependabot Updates](https://github.com/0G3NES1S/ArtSet.jl/actions/workflows/dependabot/dependabot-updates/badge.svg)](https://github.com/0G3NES1S/ArtSet.jl/actions/workflows/dependabot/dependabot-updates) [![TagBot](https://github.com/0G3NES1S/ArtSet.jl/actions/workflows/TagBot.yml/badge.svg)](https://github.com/0G3NES1S/ArtSet.jl/actions/workflows/TagBot.yml)

## What is ArtSet.jl ?

#### ArtSet.jl is a terminal text output formatting Julia package that brings to you a few ways to format terminal text output using ANSI escape codes.

### Here is a simple example:

```julia
using ArtSet

# Creates the color with the especific arguments you give to the
# function and then saves it in ColorsKit Dict
MyColor = Tools.Craft256(
    ID = "MyColorYeah!", # Color Identifier. You can skip this (not recommended)
    BOLD = true,
    FAINT = false,
    ITALIC = true,
    UNDERLINE = false,
    BLINKING = true,
    INVERSE = false,
    HIDDEN = false,
    STRIKETHROUGH = false,
    TYPE = UInt8(38), # It can be "FOREGROUND", "BACKGROUND", or UInt(48) too
    COLOR = UInt8(100)
)

Tools.Draw(MyColor; TEXT="Hello World!") # Prints the given text with the given color
```

#### ArtSet.jl has a variety of tools that allows you creating and use your own colors or use colors already created in a very simple way.

##### <u>See docs for more info.</u>