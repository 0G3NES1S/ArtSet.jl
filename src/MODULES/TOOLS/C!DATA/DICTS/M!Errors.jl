module M!Errors

    export ERRORS

    ERRORS = Dict(
        :ERROR_1 => "[    ERROR    ] ArtSet.jl ERROR: COLOR.TYPE VALUE MUST BE UInt8(38); UInt8(48) OR STRING 'FOREGROUND'; 'BACKGROUND'",
        :ERROR_2 => "[    ERROR    ] ArtSet.jl ERROR: SYMBOL PROVIDED AS AN ARGUMENT IN Draw() FUNCTION DOES NOT EXIST",
    )

end