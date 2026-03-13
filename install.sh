#!/bin/bash

# Aborta a execução imediatamente se qualquer comando falhar (Fail-Fast)
set -e

# Resolve o caminho absoluto do diretório do script para garantir 
# execução agnóstica de contexto (independente do $PWD de chamada).
BASEDIR=$(dirname "$(readlink -f "$0")")

echo "🚀 Iniciando provisionamento da infraestrutura em: $BASEDIR"

# Garante a existência do diretório base de configuração do usuário (Idempotência)
mkdir -p ~/.config

# Purga configurações pré-existentes ou symlinks corrompidos para forçar o estado desejado
rm -rf ~/.config/nvim

# Provisiona o link simbólico apontando para o repositório versionado (Single Source of Truth)
ln -s "$BASEDIR/.config/nvim" ~/.config/nvim

echo "✅ Configuração vinculada com sucesso (symlink estabelecido)!"
