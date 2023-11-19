-- Packer Bootstrap
local install_path = vim.fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
  vim.fn.execute('!git clone https://github.com/wbthomason/packer.nvim ' .. install_path)
  vim.cmd 'packadd packer.nvim'
end

-- Packer Configuration
require('packer').startup(function(use)
    use 'hashivim/vim-terraform'

    -- Add more plugins as needed
end)

vim.cmd([[autocmd VimEnter * PackerInstall]])


vim.cmd('set background=dark')  -- Set background to dark
vim.cmd('colorscheme blue')     -- Use a colorscheme that emphasizes blue tones
-- Add any other Terraform-specific configurations here

-- Function to split a string by a delimiter
local function split(str, delimiter)
    local result = {}
    for match in (str..delimiter):gmatch("(.-)"..delimiter) do
        table.insert(result, match)
    end
    return result
end

-- Function to add directories to the runtimepath
local function add_paths_to_rtp(paths)
    for _, path in ipairs(paths) do
        vim.o.runtimepath = vim.o.runtimepath .. ',' .. path
    end
end

-- Use environment variable to get the concatenated paths
local plugin_paths = os.getenv('NVIM_PLUGIN_PATHS')
if plugin_paths then
    local paths = split(plugin_paths, ':')
    add_paths_to_rtp(paths)
end
