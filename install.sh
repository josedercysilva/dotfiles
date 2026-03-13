#!/bin/bash

echo "🚀 Iniciando o provisionamento dos Dotfiles..."

# Garante que a pasta base existe
mkdir -p ~/.config

# Remove qualquer configuração padrão de Neovim que a nuvem tenha criado
rm -rf ~/.config/nvim

# Cria a ponte (symlink) usando o diretório atual de onde o GitHub baixou o repo
ln -s $(pwd)/.config/nvim ~/.config/nvim

echo "✅ Neovim linkado com sucesso!"
