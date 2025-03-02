# ColorsKit

----

#### `ColorsKit` Is a Dict that saves every color of the package, this Dict has from default colors to crafted colors that the user created, it has sub-dicts with the objetive of organizing every color that ANSI escape codes can format.

```julia
using ArtSet

println(Tools.ColorsKit[:FOREGROUND][:NEUTRAL]) # Output: Dict(:F_N_RED => "31", :F_N_BLUE => "34", :F_N_YELLOW => "33", :F_N_WHITE => "37", :F_N_DEFAULT => "39", :F_N_CYAN => "36", :F_N_BLACK => "30", :F_N_GREEN => "32", :F_N_MAGENTA => "35")

println(Tools.ColorsKit[:FOREGROUND][:BRIGHT]) # Dict(:F_B_DEFAULT => "99", :F_B_BLACK => "90", :F_B_CYAN => "96", :F_B_GREEN => "92", :F_B_WHITE => "97", :F_B_BLUE => "94", :F_B_YELLOW => "93", :F_B_RED => "91", :F_B_MAGENTA => "95")

println(Tools.ColorsKit[:BACKGROUND][:NEUTRAL]) # Dict(:B_N_WHITE => "47", :B_N_BLACK => "40", :B_N_GREEN => "42", :B_N_MAGENTA => "45", :B_N_RED => "41", :B_N_YELLOW => "43", :B_N_CYAN => "46", :B_N_BLUE => "44")

println(Tools.ColorsKit[:BACKGROUND][:BRIGHT]) # Dict(:B_B_GREEN => "102", :B_B_BLACK => "100", :B_B_RED => "101", :B_B_YELLOW => "103", :B_B_MAGENTA => "105", :B_B_WHITE => "107", :B_B_BLUE => "104", :B_B_CYAN => "106")

println(Tools.ColorsKit[:CRAFTED]) # Crafted colors by the user
```
----