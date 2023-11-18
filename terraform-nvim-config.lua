-- Packer Bootstrap
local install_path = vim.fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
  vim.fn.execute('!git clone https://github.com/wbthomason/packer.nvim ' .. install_path)
  vim.cmd 'packadd packer.nvim'
end

-- Packer Configuration
require('packer').startup(function(use)
    use 'vim-terraform'

    -- Add more plugins as needed
end)

vim.cmd('set background=dark')  -- Set background to dark
vim.cmd('colorscheme blue')     -- Use a colorscheme that emphasizes blue tones
-- Add any other Terraform-specific configurations here

