vim.cmd('colorscheme cyberpunk')     -- Use a colorscheme that emphasizes blue tones
-- Add any other Terraform-specific configurations here

local lspconfig = require('lspconfig')

lspconfig.terraformls.setup{

    on_attach = function(_, bufnr)
    -- Custom on_attach logic
       vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>f', '<cmd>lua vim.lsp.buf.format()<CR>', { noremap = true, silent = true })
    end,

    flags = {
        debounce_text_changes = 150,
    },
    settings = {
        -- Language server specific settings
    },
    handlers = {
        -- Custom handlers for language server events
    },
    capabilities = capabilities,

}

-- Tflint setup remains the same
lspconfig.tflint.setup {
    cmd = { "tflint", "--langserver" },
    filetypes = { "terraform" },
    root_dir = lspconfig.util.root_pattern(".terraform", "*.tf"),
    flags = {
        debounce_text_changes = 150,
    }
}

