# Use friendly names for antidote bundles:
zstyle ':antidote:bundle' use-friendly-names 'yes'

# Load auto completion (required for autocompletion plugins to work).
autoload -Uz compinit && compinit

# Load p10k:
# This needs to stay close to the top of the file!
# @see https://github.com/romkatv/powerlevel10k
() {
  local P10K_CONFIG="${ZDOTDIR}/.p10k.zsh"
  local P10K_INSTANT_PROMPT="${ZDOTDIR}/p10k-instant-prompt-${(%):-%n}.zsh"

  # Enable P10K instant prompt (should stay close to the top of ~/.zshrc).
  # Initialization code that may require console input (password prompts, [y/n]
  # confirmations, etc.) must go above this block; everything else may go below.
  if [[ -r $P10K_INSTANT_PROMPT ]]; then
    source $P10K_INSTANT_PROMPT
  fi

  # To customize prompt, run `p10k configure` or edit ~/.zsh/.p10k.zsh.
  [[ ! -f $P10K_CONFIG ]] || source $P10K_CONFIG
}

# Create a symlink for .zshenv in the home directory:
# This is required for oh-my-zsh to always load the config files
# (e.g., `.zshrc`) from the correct directory.
if ! [[ -f "$HOME/.zshenv" ]]; then
  ln -s "$ZDOTDIR/.zshenv" "$HOME/.zshenv"
  source $HOME/.zshenv
fi

# Where to store the Antidote repository:
export ANTIDOTE_DIR="${HOME}/.antidote"
# Where to store Antidote plugins:
export ANTIDOTE_HOME="${ZDOTDIR}/.antidote"

export NVM_DIR="${HOME}/.nvm"   # Path to NVM
export NVM_COMPLETION=true      # Enable NVM completion in shell
export NVM_LAZY_LOAD=false      # Only load NVM after calling nvm
export NVM_AUTO_USE=true        # Call `nvm use` when switching directories

export BUN_DIR="${HOME}/.bun"   # Bun installation directory
export BUN_COMPLETION=true      # Enable Bun completion in shell

# Antidote:
# @see https://antidote.sh/install
() {
  local ANTIDOTE_CONFIG="${ZDOTDIR}/.zsh_plugins.txt"

  # Install antidote:
  if ! [[ -d $ANTIDOTE_DIR ]]; then
    git clone --depth=1 https://github.com/mattmc3/antidote.git $ANTIDOTE_DIR
  fi

  # Source antidote:
  if ! command -v "antidote" >/dev/null 2>&1; then
    source $ANTIDOTE_DIR/antidote.zsh
  fi

  # Load antidote plugins:
  antidote load
}

# Set the default shell to ZSH:
# This requires sudo privileges, so we first check if the
# default shell is not already ZSH.
if [[ "$SHELL" != "$(which zsh)" ]]; then
  chsh -s "$(which zsh)"
fi

# pnpm
export PNPM_HOME="/home/marceloclp/.pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end
