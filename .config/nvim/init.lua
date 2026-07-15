
vim.opt.clipboard = "unnamedplus"

-- 1. Bootstrapping do Lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- 2. Declaração e Configuração de Plugins
require("lazy").setup({
    
    -- Suporte a LaTeX
    { 
        "lervag/vimtex", 
        lazy = false, 
    },

    -- Treesitter (Highlight semântico)
    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
        opts = {
            ensure_installed = { "c", "lua", "vim", "vimdoc", "query", "verilog" },
            highlight = { enable = true },
            indent = { enable = true },
        },
        config = function(_, opts)
            local status, ts_configs = pcall(require, "nvim-treesitter.configs")
            if status then
                ts_configs.setup(opts)
            else
                require("nvim-treesitter").setup(opts)
            end
        end,
    },

    -- LSP Config (Servidor de Linguagem Verible - API Neovim 0.11+)
    { 
        "neovim/nvim-lspconfig",
        config = function()
            -- Configura os parâmetros do servidor usando a API nativa
            vim.lsp.config.verible = {
                root_dir = vim.fs.root(0, {".git"}),
            }
            
            -- Habilita o servidor nativamente
            vim.lsp.enable("verible")
        end
    },
})

vim.diagnostic.config({
    virtual_text = false,
    signs = false,
    underline = false,
})

