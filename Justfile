default := "lua"

lua:
    nvim --headless +"Fnlfile make.fnl" +qa
    cp ./lua/oxocarbon/init.lua ~/.config/nvim/colors/oxocarbon.lua
