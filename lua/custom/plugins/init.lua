-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information

-- [Bo]
-- Have to add this in from the original init.lua, sinc it has no visibility here.
-- I wonder why init.lua doesn't have the ability to load local packages? So you could 
-- pack all of your functions in that file and they would be accessable to any script that
-- imported them. Must be a way to do this. Though, I guess it would have diminishing returns,
-- in that I would have to modify the main init.lua to import the package anyway.
-- Guess I'll just redefine the gh() function here then.
local function gh(repo) return 'https://github.com' .. repo end

-- Iterate over all Lua files in the plugins directory and load them
local plugins_dir = vim.fs.joinpath(vim.fn.stdpath 'config', 'lua', 'custom', 'plugins')
for file_name, type in vim.fs.dir(plugins_dir, { follow = true }) do
  if (type == 'file' or type == 'link') and file_name:match '%.lua$' and file_name ~= 'init.lua' then
    local module = file_name:gsub('%.lua$', '')
    require('custom.plugins.' .. module)
  end
end

vim.pack.add { gh 'neanias/everforest-nvim' }
require('everforest').setup({})
vim.cmd.colorscheme 'everforest'
