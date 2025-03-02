module M!Draw

    export Draw

    import ..M!CraftStructs

    import ..M!ColorsKit
    import ..M!Errors

    import ..M!ESC!CVariables

    function Draw(COLOR::Union{M!CraftStructs.CraftIn256, M!CraftStructs.CraftInRGB, Symbol}; TEXT="Hello World!")

        CURRENT_STRING = "$(M!ESC!CVariables.ESCAPE_CODE)$(M!ESC!CVariables.STARTER)"

        ARGUMENTS = nothing
        if typeof(COLOR) != Symbol
            ARGUMENTS = Dict(
                :CONDITION => [COLOR.BOLD, COLOR.FAINT, COLOR.ITALIC, COLOR.UNDERLINE, COLOR.BLINKING, COLOR.INVERSE, COLOR.HIDDEN, COLOR.STRIKETHROUGH],
                :VALUE => [:BOLD, :FAINT, :ITALIC, :UNDERLINE, :BLINKING, :INVERSE, :HIDDEN, :STRIKETHROUGH]
            )
        end

        if typeof(COLOR) == M!CraftStructs.CraftIn256
            # to avoid 'if' flood: iterates over the Dict key length
            # and then places every respective value
            for i in 1:length(ARGUMENTS[:CONDITION])
                if ARGUMENTS[:CONDITION][i] == true; CURRENT_STRING = "$(CURRENT_STRING)$(M!ColorsKit.ColorsKit[:ESPECIALS][ARGUMENTS[:VALUE][i]])$(M!ESC!CVariables.SEPARATOR)"; end
            end

            if COLOR.TYPE == UInt8(38) || COLOR.TYPE == "FOREGROUND"
                CURRENT_STRING = "$(CURRENT_STRING)$(M!ColorsKit.ColorsKit[:ESPECIALS][:FOREGROUND])$(M!ESC!CVariables.SEPARATOR)"
            elseif COLOR.TYPE == UInt8(48) || COLOR.TYPE == "BACKGROUND"
                CURRENT_STRING = "$(CURRENT_STRING)$(M!ColorsKit.ColorsKit[:ESPECIALS][:BACKGROUND])$(M!ESC!CVariables.SEPARATOR)"
            else
                return error(M!ERRORS.ERRORS[:ERROR_1])
            end

            CURRENT_STRING = "$(CURRENT_STRING)$(COLOR.MODE)$(M!ESC!CVariables.SEPARATOR)$(COLOR.COLOR)$(M!ESC!CVariables.FINALIZER)$(TEXT)$(M!ESC!CVariables.END)"

        elseif typeof(COLOR) == M!CraftStructs.CraftInRGB

            for i in 1:length(ARGUMENTS[:CONDITION])
                if ARGUMENTS[:CONDITION][i] == true; CURRENT_STRING = "$(CURRENT_STRING)$(M!ColorsKit.ColorsKit[:ESPECIALS][ARGUMENTS[:VALUE][i]])$(M!ESC!CVariables.SEPARATOR)"; end
            end

            if COLOR.TYPE == UInt8(38) || COLOR.TYPE == "FOREGROUND"
                CURRENT_STRING = "$(CURRENT_STRING)$(M!ColorsKit.ColorsKit[:ESPECIALS][:FOREGROUND])$(M!ESC!CVariables.SEPARATOR)"
            elseif COLOR.TYPE == UInt8(48) || COLOR.TYPE == "BACKGROUND"
                CURRENT_STRING = "$(CURRENT_STRING)$(M!ColorsKit.ColorsKit[:ESPECIALS][:BACKGROUND])$(M!ESC!CVariables.SEPARATOR)"
            else
                return error(M!ERRORS.ERRORS[:ERROR_1])
            end

            CURRENT_STRING = "$(CURRENT_STRING)$(COLOR.MODE)$(M!ESC!CVariables.SEPARATOR)$(COLOR.R)$(M!ESC!CVariables.SEPARATOR)$(COLOR.G)$(M!ESC!CVariables.SEPARATOR)$(COLOR.B)$(M!ESC!CVariables.FINALIZER)$(TEXT)$(M!ESC!CVariables.END)"

        elseif typeof(COLOR) == Symbol
            KIT_COLORS = [
                M!ColorsKit.ColorsKit[:FOREGROUND][:NEUTRAL],
                M!ColorsKit.ColorsKit[:FOREGROUND][:BRIGHT],
                M!ColorsKit.ColorsKit[:BACKGROUND][:NEUTRAL],
                M!ColorsKit.ColorsKit[:BACKGROUND][:BRIGHT],
            ]

            for ARRAY_VALUE in KIT_COLORS
                for (DICT_KEY, DICT_VALUE) in ARRAY_VALUE
                    if DICT_KEY == COLOR && typeof(DICT_VALUE) == String
                        CURRENT_STRING = "$(CURRENT_STRING)$(DICT_VALUE)$(M!ESC!CVariables.FINALIZER)$(TEXT)$(M!ESC!CVariables.END)"
                        println(CURRENT_STRING)
                        return
                    end
                end 
            end

            return error(M!ERRORS.ERRORS[:ERROR_2])

        end

        println(CURRENT_STRING)
    end

end