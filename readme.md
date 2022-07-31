# Intro
* This repo contains scripts and config to more easily setup and build the PureScript IDE extension for Visual Studio Code

* There are two consituant projects for the extension
  * https://github.com/nwolverson/vscode-ide-purescript 
  * https://github.com/nwolverson/purescript-language-server

# Prereqs
* Visual Studio Code
* nodejs
* Posix environment with Bash

# Instructions
## Forking projects
If you've forked one or both associated projects replace the repo address(es) in the ENV file with the correct URI(s)


## Setup
```
make setup
```

## Build from the command line
```
make build
```

## Launch a test instance of VSCode running your newly built extension
### From the command line
```
make try-extension
```
### From VSCode
open vscode-ide-purescript in Visual Studio Code and hit F5 (or menu Run -> Start Debugging)

# Notes
* vscode-ide-purescript is a thin wrapper, most functionality is in purescript-language-server
* The project uses PureScript versions installed in the individual project directories
  * There may be more preferable versions than the ones defined in ENV, consult the docs and and config for each project
* vscode notifies the language server when files need to be processed adding features that process additional file types requires a change inside of vscode-ide-purescript
```
fileEvents:
    [ workspace.createFileSystemWatcher('**/*.purs')
    , workspace.createFileSystemWatcher('**/*.js')
    ]
```
* If building inside of VSCode, issues will likely be visible in the VSCode "terminal" panel
* If builds work correctly via Make, but not inside VSCode, check that you're using local versions of npm and associated tools:
![vscode setting detail](/vscode-setting-detail.png)

* Project documentation advises the use of "npm link" commands, but here an explicit creation of a symlink has been used to avoid reliance and alteration of system-wide state.
