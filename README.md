# ⚙️ Cloud & Local Dotfiles (Neovim + LaTeX)

Este repositório contém a minha infraestrutura como código (IaC) para o ambiente de desenvolvimento Neovim, com foco em compilação de documentos LaTeX de alta performance.

A arquitetura foi desenhada para ser **Zero-Touch** na nuvem e facilmente replicável em máquinas locais. O motor principal é o `lazy.nvim`, configurado para baixar dependências (como o `vimtex`) sob demanda.

---

## ☁️ Deploy na Nuvem (GitHub Codespaces / Docker)

Se você está rodando isso via nuvem, **não é necessário clonar este repositório manualmente.**

A injeção destes dotfiles é feita de forma 100% automatizada através do `devcontainer.json` do projeto principal. O container baixa este repositório e executa o provisionamento sozinho via `postCreateCommand`.

---

## 💻 Deploy Local (Linux / macOS)

Se você formatou sua máquina física (ex: Manjaro Linux) e quer configurar o Neovim diretamente no sistema operacional (Bare Metal), execute os 2 passos abaixo:

**1. Clone o repositório para a sua máquina:**
`bash
git clone https://github.com/josedercy/dotfiles.git ~/dotfiles
`

**2. Execute o script de instalação (Ele criará a ponte de forma segura):**
`bash
bash ~/dotfiles/install.sh
`

*Na próxima vez que você digitar `nvim`, o gerenciador `lazy.nvim` fará o bootstrap automático.*
