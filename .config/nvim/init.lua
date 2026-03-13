vim.opt.number = true
vim.opt.mouse = 'a'
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

-- ==========================================
-- Configuração Profissional do VimTeX
-- ==========================================

-- Define o Zathura como o visualizador de PDF padrão
vim.g.vimtex_view_method = 'zathura'

vim.g.vimtex_compiler_method = 'tectonic'

-- Evita que a janela de QuickFix abra automaticamente a cada pequeno warning
vim.g.vimtex_quickfix_mode = 0

-- Define o sabor padrão do TeX
vim.g.tex_flavor = 'latex'

-- Opcional: Ocultar as mensagens de compilação bem-sucedida para manter a tela limpa
vim.g.vimtex_compiler_silent = 0
