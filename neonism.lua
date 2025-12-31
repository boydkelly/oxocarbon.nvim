-- carbonizer.lua
local input_path = "./lua/neovim/init.lua"
local output_path = os.getenv("HOME") .. "/.config/nvim/colors/neovim-test.lua"

-- Read original file
local infile = assert(io.open(input_path, "r"))
local lines = {}
for line in infile:lines() do
	table.insert(lines, line)
end
infile:close()

-- Find where to stop copying (i.e., start of original oxocarbon assignment)
local stop_index
for i, line in ipairs(lines) do
	if line:match("^local neovim%s*=") then
		stop_index = i
		break
	end
end

assert(stop_index, "Could not find 'local neovim=' in the source file")

-- Replacement header block
local replacement = [[
if vim.g.colors_name then
  vim.cmd("hi clear")
end

vim.g.colors_name = "neovim-test"
vim.o.termguicolors = true

-- Custom static base colors (you can edit these freely)
local base00 = "#07080d"  -- background dark
local base06 = "#ffffff"  -- foreground light
local base01 = "#1c1c1c"  -- was: blend(base00, base06, 0.085)
local base02 = "#262626"  -- was: blend(base00, base06, 0.18)
local base03 = "#3d3d3d"  -- was: blend(base00, base06, 0.3)
local base04 = "#dcdcdc"  -- was: blend(base00, base06, 0.82)
local base05 = "#f2f2f2"  -- was: blend(base00, base06, 0.95)

local neovim = {
  base00 = base00,
  base01 = base01,
  base02 = base02,
  base03 = base03,
  base04 = base04,
  base05 = base05,
  base06 = base06,
  base07 = "#8cf8f7",
  base08 = "#8cf8f7",
  base09 = "#a6dbff",
  base10 = "#fce094",
  base11 = "#a6dbff",
  base12 = "#ffcaea",
  base13 = "#b3f6c0",
  base14 = "#ffcaea",
  base15 = "#82cfff",
  blend  = "#131313",
  none   = "NONE"
}
]]

-- Copy tail after the original oxocarbon block
local output = { replacement }
for i = stop_index + 1, #lines do
	table.insert(output, lines[i])
end

-- Write to new file
local outfile = assert(io.open(output_path, "w"))
outfile:write(table.concat(output, "\n"))
outfile:close()

print("✓ Generated: " .. output_path)
