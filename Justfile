default := "lua"

lua:
  nvim --headless +"Fnlfile make.fnl" +qa
  lua carbonizer.lua
