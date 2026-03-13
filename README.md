# ⚙️ Cloud & Local Dotfiles (Neovim + LaTeX)

Este repositório contém a minha infraestrutura como código (IaC) para o ambiente de desenvolvimento Neovim, com foco em compilação de documentos LaTeX de alta performance.

A arquitetura foi desenhada para ser **Zero-Touch** e **Environment-Agnostic** (agnóstica ao ambiente). O mesmo código roda perfeitamente na minha máquina local (Manjaro Linux) e em containers efêmeros na nuvem (GitHub Codespaces / Alpine Linux).

## 🏗️ Arquitetura e Decisões Técnicas

* **Gerenciamento de Plugins:** `lazy.nvim` (Bootstrapping automático, sem necessidade de instalação manual prévia).
* **Core Business:** `VimTeX` (Carregamento imediato `lazy = false` para disponibilidade instantânea da API de compilação).
* **Motor de Compilação:** `Tectonic` (Substitui o pesado TeX Live. Baixa pacotes do CTAN sob demanda, ideal para VMs e containers leves).
* **Roteamento de Display Dinâmico:** O arquivo `init.lua` inspeciona variáveis de ambiente (`os.getenv("CODESPACES")`) para decidir o visualizador de PDF:
  * **Nuvem (Web):** Usa visualizador genérico integrado ao VS Code Web.
  * **Local (Manjaro):** Usa `Zathura` via RPC para live-reload sem travar o terminal.

## 🚀 Como fazer o Deploy (Máquina Local)

Para clonar e ativar esta configuração em uma nova máquina Linux/macOS, execute os passos abaixo. 
*(Nota: O GitHub Codespaces faz esse processo automaticamente via automação nativa).*

**1. Clone o repositório:**
```bash
git clone [https://github.com/josedercysilva/dotfiles.git](https://github.com/josedercysilva/dotfiles.git) ~/dotfiles
