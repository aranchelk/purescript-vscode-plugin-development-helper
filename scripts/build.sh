#!/bin/bash
set -e

SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

cd_rel_norm() {
  cd $(realpath ${SCRIPT_DIR}/$1)
}


echo "Building language server..."
cd_rel_norm ../purescript-language-server
npx spago build
npm link


echo "Building vscode plugin"
cd_rel_norm ../vscode-ide-purescript
npm link purescript-language-server
npx npm run build
