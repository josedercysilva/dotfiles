-- =====================================================================
-- NEOVIM CONFIGURATION - CLOUD & LOCAL ENVIRONMENT
-- =====================================================================

-- ---------------------------------------------------------------------
-- 1. Core Settings (UI e Formatação)
-- ---------------------------------------------------------------------
-- Define os padrões de visualização e indentação estrita (4 espaços)
vim.opt.number = true
vim.opt.mouse = 'a'
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

-- ---------------------------------------------------------------------
-- 2. VimTeX (Ambiente LaTeX Profissional)
-- ---------------------------------------------------------------------
-- Motor de compilação: Tectonic 
-- Escolhido por baixar pacotes sob demanda, dispensando instalação do TeX Live.
vim.g.vimtex_compiler_method = 'tectonic'

-- Detecção Dinâmica de Hardware (Environment-Aware)
-- Se estiver rodando na nuvem (Codespaces/Navegador), usa visualizador genérico web.
-- Se rodar localmente no Manjaro (Desktop), usa o Zathura nativamente.
if os.getenv("CODESPACES") == "true" then
    vim.g.vimtex_view_method = 'general'
else
    vim.g.vimtex_view_method = 'zathura'
end

-- Workflow Limpo: 
-- Evita que a janela de QuickFix "roube" o foco a cada pequeno warning do LaTeX
vim.g.vimtex_quickfix_mode = 0

-- Força o parser do VimTeX a interpretar tudo como LaTeX moderno
vim.g.tex_flavor = 'latex'

-- Mantém os logs do compilador visíveis para debug (mudar para 1 para ocultar)
vim.g.vimtex_compiler_silent = 0
