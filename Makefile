run-all: setup build try-extension

setup:
	./scripts/setup.sh

build:
	./scripts/build.sh

try-extension:
	code --inspect-extensions=9333 --extensionDevelopmentPath=$(realpath ./vscode-ide-purescript) test-project
