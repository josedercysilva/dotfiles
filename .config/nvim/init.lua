-- =====================================================================
-- NEOVIM DOTFILES: ENVIRONMENT-AGNOSTIC SETUP
-- Objetivo: Garantir reprodutibilidade zero-touch em qualquer máquina
-- (Local Manjaro ou Cloud/Codespaces) focada em compilação LaTeX.
-- =====================================================================

-- ---------------------------------------------------------------------
-- 1. Auto-Provisionamento (Bootstrapping do Lazy.nvim)
-- ---------------------------------------------------------------------
-- Garante que o gerenciador de pacotes seja instalado de forma idempotente.
-- Isso elimina a necessidade de rodar scripts manuais ao clonar os dotfiles
-- em um novo container ou máquina limpa.
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

-- ---------------------------------------------------------------------
-- 2. Registro de Dependências (Plugins)
-- ---------------------------------------------------------------------
require("lazy").setup({
    {
        "lervag/vimtex",
        -- Desativamos o lazy-loading para o VimTeX porque compilação de 
        -- documentos é o core business deste ambiente específico. 
        -- Queremos a API do plugin pronta no milissegundo em que o editor abrir.
        lazy = false, 
    }
})

-- ---------------------------------------------------------------------
-- 3. Padronização de UX e Editor
-- ---------------------------------------------------------------------
-- Mantém a consistência visual e de espaçamento independentemente do terminal host
vim.opt.number = true
vim.opt.mouse = 'a'
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

-- ---------------------------------------------------------------------
-- 4. Workflow VimTeX e Integração de Hardware
-- ---------------------------------------------------------------------
-- Motor de compilação: Tectonic. 
-- Motivo: Elimina a dependência de instalações monolíticas (TeX Live). 
-- O binário resolve dependências do CTAN on-the-fly, ideal para containers efêmeros.
vim.g.vimtex_compiler_method = 'tectonic'

-- Roteamento Dinâmico de Display (Environment-Aware Viewer)
-- Inspeciona variáveis de ambiente para evitar crash de servidor gráfico (X11/Wayland).
if os.getenv("CODESPACES") == "true" then
    -- Em Cloud (Web): Delega a renderização para a extensão do VS Code na mesma aba.
    vim.g.vimtex_view_method = 'general'
else
    -- Local (Manjaro): Usa o Zathura via daemon RPC para live-reload nativo.
    vim.g.vimtex_view_method = 'zathura'
end

-- Otimização de Foco (Redução de Ruído Visual)
vim.g.vimtex_quickfix_mode = 0         -- Impede o QuickFix de roubar o cursor em warnings triviais
vim.g.tex_flavor = 'latex'             -- Força o parser a não confundir LaTeX com plain TeX
vim.g.vimtex_compiler_silent = 0       -- Mantém stdout ativo para debug de pacotes CTAN ausentes
