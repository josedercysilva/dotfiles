#!/bin/bash

# 1. Descobre o caminho REAL de onde este script está guardado
# Não importa de onde ele seja chamado, BASEDIR será sempre /home/vscode/dotfiles
BASEDIR=$(dirname "$(readlink -f "$0")")

echo "🚀 Iniciando provisionamento sênior em: $BASEDIR"

# 2. Garante a estrutura de pastas
mkdir -p ~/.config

# 3. Remove links quebrados ou pastas padrão que o GitHub cria
rm -rf ~/.config/nvim

# 4. Cria a ponte usando o caminho absoluto que descobrimos no passo 1
ln -s "$BASEDIR/.config/nvim" ~/.config/nvim

echo "✅ Configuração vinculada com sucesso!"
