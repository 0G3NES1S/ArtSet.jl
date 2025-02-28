module Tools
    export ColorsKit, CraftIn256, CraftInRGB, Craft256, CraftRGB, importc

    ERRORS = Dict(
        :ERROR_1 => "[    ERROR    ] ArtSet.jl ERROR: COLOR.TYPE VALUE MUST BE UInt8(38); UInt8(48) OR STRING 'FOREGROUND'; 'BACKGROUND'",
        :ERROR_2 => "[    ERROR    ] ArtSet.jl ERROR: SYMBOL PROVIDED AS AN ARGUMENT IN Draw() FUNCTION DOES NOT EXIST"
    )

    ColorsKit = Dict(
        :FOREGROUND => Dict(
            :NEUTRAL => Dict(
                :F_N_BLACK => "30",
                :F_N_RED => "31",
                :F_N_GREEN => "32",
                :F_N_YELLOW => "33",
                :F_N_BLUE => "34",
                :F_N_MAGENTA => "35",
                :F_N_CYAN => "36",
                :F_N_WHITE => "37",
                :F_N_DEFAULT => "39",
            ),
            :BRIGHT => Dict(
                :F_B_BLACK => "90",
                :F_B_RED => "91",
                :F_B_GREEN => "92",
                :F_B_YELLOW => "93",
                :F_B_BLUE => "94",
                :F_B_MAGENTA => "95",
                :F_B_CYAN => "96",
                :F_B_WHITE => "97",
                :F_B_DEFAULT => "99",
            ),
        ),
        :BACKGROUND => Dict(
            :NEUTRAL => Dict(
                :B_N_BLACK => "40",
                :B_N_RED => "41",
                :B_N_GREEN => "42",
                :B_N_YELLOW => "43",
                :B_N_BLUE => "44",
                :B_N_MAGENTA => "45",
                :B_N_CYAN => "46",
                :B_N_WHITE => "47",
            ),
            :BRIGHT => Dict(
                :B_B_BLACK => "100",
                :B_B_RED => "101",
                :B_B_GREEN => "102",
                :B_B_YELLOW => "103",
                :B_B_BLUE => "104",
                :B_B_MAGENTA => "105",
                :B_B_CYAN => "106",
                :B_B_WHITE => "107",
            ),
        ),
        :ESPECIALS => Dict(
            :RESET => "0",
            :BOLD => "1",
            :FAINT => "2",
            :ITALIC => "3",
            :UNDERLINE => "4",
            :BLINKING => "5",
            :INVERSE => "7",
            :HIDDEN => "8",
            :STRIKETHROUGH => "9",
            :FOREGROUND => "38",
            :BACKGROUND => "48" 
        ),
        :CRAFTED => Dict()
    )

    ESCAPE_CODE = "\x1b" 
    STARTER = "["
    SEPARATOR = ";"
    FINALIZER = "m"
    END = "$(ESCAPE_CODE)$(STARTER)$(ColorsKit[:ESPECIALS][:RESET])$(FINALIZER)"

    mutable struct CraftInRGB
        BOLD::Bool
        FAINT::Bool
        ITALIC::Bool
        UNDERLINE::Bool 
        BLINKING::Bool
        INVERSE::Bool
        HIDDEN::Bool
        STRIKETHROUGH::Bool
        TYPE::Union{String, UInt8} 
        MODE::UInt8
        R::UInt8
        G::UInt8
        B::UInt8
    end

    mutable struct CraftIn256
        BOLD::Bool
        FAINT::Bool
        ITALIC::Bool
        UNDERLINE::Bool 
        BLINKING::Bool
        INVERSE::Bool
        HIDDEN::Bool
        STRIKETHROUGH::Bool
        TYPE::Union{String, UInt8} 
        MODE::UInt8
        COLOR::UInt8
    end

    # Creates color in 256 Colors mode and it registers the color
    function Craft256(; 
        ID::Union{String, Symbol} = "C$(length(ColorsKit[:CRAFTED]))",
        BOLD::Bool = false,
        FAINT::Bool = false,
        ITALIC::Bool = false,
        UNDERLINE::Bool = false, 
        BLINKING::Bool = false,
        INVERSE::Bool = false,
        HIDDEN::Bool = false,
        STRIKETHROUGH::Bool = false,
        TYPE::Union{String, UInt8} = "FOREGROUND", 
        COLOR::UInt8 = UInt8(0)
        )

        CURRENT_MODE::UInt8 = UInt8(5)

        if typeof(ID) == Symbol; else; ID = Symbol(ID); end

        Color = CraftIn256(BOLD, FAINT, ITALIC, UNDERLINE, BLINKING, INVERSE, HIDDEN, STRIKETHROUGH, TYPE, CURRENT_MODE, COLOR) # Creates the color
        ColorsKit[:CRAFTED][ID] = Color # Registers the color
        return Color # And then returns it
    end

    # RGB Colors Mode
    function CraftRGB(; 
        ID::Union{String, Symbol} = "C$(length(ColorsKit[:CRAFTED]))",
        BOLD::Bool = false,
        FAINT::Bool = false,
        ITALIC::Bool = false,
        UNDERLINE::Bool = false, 
        BLINKING::Bool = false,
        INVERSE::Bool = false,
        HIDDEN::Bool = false,
        STRIKETHROUGH::Bool = false,
        TYPE::Union{String, UInt8} = "FOREGROUND", 
        R::UInt8 = UInt8(0),
        G::UInt8 = UInt8(0),
        B::UInt8 = UInt8(0)
        )

        CURRENT_MODE::UInt8 = UInt8(2)

        if typeof(ID) == Symbol; else; ID = Symbol(ID); end
        
        Color = CraftInRGB(BOLD, FAINT, ITALIC, UNDERLINE, BLINKING, INVERSE, HIDDEN, STRIKETHROUGH, TYPE, CURRENT_MODE, R, G, B)
        ColorsKit[:CRAFTED][ID] = Color
        return Color
    end

    # registers a manually created color
    function importc(COLOR::Union{CraftIn256, CraftInRGB}; ID::Union{String, Symbol}="C$(length(ColorsKit[:CRAFTED]))")
        if typeof(ID) == Symbol; else; ID = Symbol(ID); end
        ColorsKit[:CRAFTED][ID] = COLOR
    end

    # -<< Draw Function >>-

    # prints the given text with the given color
    function Draw(COLOR::Union{CraftIn256, CraftInRGB, Symbol}; TEXT="Hello World!")
        CURRENT_STRING = "$(ESCAPE_CODE)$(STARTER)"

        ARGUMENTS = nothing
        if typeof(COLOR) != Symbol
            ARGUMENTS = Dict(
                :CONDITION => [COLOR.BOLD, COLOR.FAINT, COLOR.ITALIC, COLOR.UNDERLINE, COLOR.BLINKING, COLOR.INVERSE, COLOR.HIDDEN, COLOR.STRIKETHROUGH],
                :VALUE => [:BOLD, :FAINT, :ITALIC, :UNDERLINE, :BLINKING, :INVERSE, :HIDDEN, :STRIKETHROUGH]
            )
        end

        if typeof(COLOR) == CraftIn256
            # to avoid macro flood: iterates over the Dict key length
            # and then places every respective value
            for i in 1:length(ARGUMENTS[:CONDITION])
                if ARGUMENTS[:CONDITION][i] == true; CURRENT_STRING = "$(CURRENT_STRING)$(ColorsKit[:ESPECIALS][ARGUMENTS[:VALUE][i]])$(SEPARATOR)"; end
            end

            if COLOR.TYPE == UInt8(38) || COLOR.TYPE == "FOREGROUND"
                CURRENT_STRING = "$(CURRENT_STRING)$(ColorsKit[:ESPECIALS][:FOREGROUND])$(SEPARATOR)"
            elseif COLOR.TYPE == UInt8(48) || COLOR.TYPE == "BACKGROUND"
                CURRENT_STRING = "$(CURRENT_STRING)$(ColorsKit[:ESPECIALS][:BACKGROUND])$(SEPARATOR)"
            else
                return error(ERRORS[:ERROR_1])
            end

            CURRENT_STRING = "$(CURRENT_STRING)$(COLOR.MODE)$(SEPARATOR)$(COLOR.COLOR)$(FINALIZER)$(TEXT)$(END)"

        elseif typeof(COLOR) == CraftInRGB

            for i in 1:length(ARGUMENTS[:CONDITION])
                if ARGUMENTS[:CONDITION][i] == true; CURRENT_STRING = "$(CURRENT_STRING)$(ColorsKit[:ESPECIALS][ARGUMENTS[:VALUE][i]])$(SEPARATOR)"; end
            end

            if COLOR.TYPE == UInt8(38) || COLOR.TYPE == "FOREGROUND"
                CURRENT_STRING = "$(CURRENT_STRING)$(ColorsKit[:ESPECIALS][:FOREGROUND])$(SEPARATOR)"
            elseif COLOR.TYPE == UInt8(48) || COLOR.TYPE == "BACKGROUND"
                CURRENT_STRING = "$(CURRENT_STRING)$(ColorsKit[:ESPECIALS][:BACKGROUND])$(SEPARATOR)"
            else
                return error(ERRORS[:ERROR_1])
            end

            CURRENT_STRING = "$(CURRENT_STRING)$(COLOR.MODE)$(SEPARATOR)$(COLOR.R)$(SEPARATOR)$(COLOR.G)$(SEPARATOR)$(COLOR.B)$(FINALIZER)$(TEXT)$(END)"

        elseif typeof(COLOR) == Symbol
            KIT_COLORS = [
                ColorsKit[:FOREGROUND][:NEUTRAL],
                ColorsKit[:FOREGROUND][:BRIGHT],
                ColorsKit[:BACKGROUND][:NEUTRAL],
                ColorsKit[:BACKGROUND][:BRIGHT],
            ]

            for ARRAY_VALUE in KIT_COLORS
                for (DICT_KEY, DICT_VALUE) in ARRAY_VALUE
                    if DICT_KEY == COLOR && typeof(DICT_VALUE) == String
                        CURRENT_STRING = "$(CURRENT_STRING)$(DICT_VALUE)$(FINALIZER)$(TEXT)$(END)"
                        println(CURRENT_STRING)
                        return
                    end
                end 
            end

            return error(ERRORS[:ERROR_2])

        end

        println(CURRENT_STRING)
    end
end