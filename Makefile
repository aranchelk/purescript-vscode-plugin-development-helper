setup:
	./scripts/setup.sh

build:
	./scripts/build.sh

try-extension:
	code --inspect-extensions=9333 --extensionDevelopmentPath=./vscode-ide-purescript test-project
