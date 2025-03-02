module M!ColorsKit

    export ColorsKit

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

end