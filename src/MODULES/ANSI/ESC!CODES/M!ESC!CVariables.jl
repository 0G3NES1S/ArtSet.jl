module M!ESC!CVariables

    export ESCAPE_CODE, STARTER, SEPARATOR, FINALIZER, END

    include(joinpath(@__DIR__, "..", "..", "TOOLS/C!DATA/DICTS/M!ColorsKit.jl"))

    import .M!ColorsKit

    ESCAPE_CODE = "\x1b" 
    STARTER = "["
    SEPARATOR = ";"
    FINALIZER = "m"
    END = "$(ESCAPE_CODE)$(STARTER)$(M!ColorsKit.ColorsKit[:ESPECIALS][:RESET])$(FINALIZER)"

end