#!/bin/bash
set -e

SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

source $SCRIPT_DIR/../ENV
 

echo "Setting up language server"
cd ${SCRIPT_DIR}/..
git clone $PURESCRIPT_LANGUAGE_SERVER_REPO_URI

cd ${SCRIPT_DIR}/../purescript-language-server
npm install purescript@${PURESCRIPT_LANGUAGE_SERVER_PS_VERSION}
npm install


echo "Setting up vscode plugin"
cd ${SCRIPT_DIR}/..
git clone $VSCODE_IDE_PURESCRIPT_REPO_URI
cd ${SCRIPT_DIR}/../vscode-ide-purescript

npm install
npm install purescript@${VSCODE_IDE_PURESCRIPT_PS_VERSION}

echo "Linking projects"
cd ${SCRIPT_DIR}/../vscode-ide-purescript/node_modules
rm -rf purescript-language-server
ln -s ../../purescript-language-server .

echo "Setup simple test project"
cd ${SCRIPT_DIR}/..
mkdir test-project && cd test-project && spago init || true
