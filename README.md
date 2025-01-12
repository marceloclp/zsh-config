# Zsh

![config:type](https://img.shields.io/badge/config-zsh-red)

The Z shell (Zsh) is a Unix shell that can be used as an interactive login shell and as a command interpreter for shell scripting. Zsh is an extended Bourne shell with many improvements, including some features of Bash, ksh, and tcsh.

## Installation

Run the following script to download the configuration files:

```bash
cd ~/ && git clone https://github.com/marceloclp/zsh-config .zsh && source ~/.zsh/.zshrc
```

## Setup

### Loading order

|     | File          | Shell type               |
| :-: | :------------ | :----------------------- |
|  1  | `.zshenv`     | always                   |
|  2  | `.zprofile`   | login shell              |
|  3  | `.zshrc`      | interactive shell        |
|  4  | `.zlogin`     | login shell, on entering |
|  5  | `.zlogout`    | login shell, on exiting  |

#### `.zprofile`

- Loaded for login shells only (e.g., when calling `gh login`)
- Read before `.zshrc`
- Similar to `.profile` or `.bash_profile`
- Best for:
  - Environment variables
  - Path settings
  - One-time setup commands
  - Login-specific configuration

#### `.zshrc`

- Loaded for interactive shells
- Loaded after `.zprofile`
- Best for:
  - Aliases/sort-hands
  - Functions
  - Shell options
  - Command completion
  - Prompt configuration
  - Interactive shell customizations

#### `.p10k.zsh`

- [Powerlevel10k](https://github.com/romkatv/powerlevel10k) configuration

#### `.zsh_plugins.txt`

- List of [Antidote](https://antidote.sh/) plugins

## Links:

- [Awesome Zsh Plugins](https://github.com/unixorn/awesome-zsh-plugins?tab=readme-ov-file#plugins)
