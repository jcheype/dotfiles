#if command -v nix-user-chroot && [ -z "${NIX_PROFILES}" ]; then
#    nix-user-chroot ~/.nix zsh -l
#fi

if [ -d /usr/local/bin ]; then
  export PATH=$PATH:/usr/local/bin
fi

if [ -z "${HISTFILE}" ]; then
  export HISTFILE=$HOME/.zsh_history
  export HISTSIZE=10000
  export SAVEHIST=10000
fi

export EDITOR=nvim
#export PYENV_ROOT="$HOME/.pyenv"
#export PATH="$PYENV_ROOT/bin:$PATH"
#export PATH="$PYENV_ROOT/shims:${PATH}"
#eval "$(pyenv init -)"
#eval "$(pyenv virtualenv-init -)"

# export ZSH="$HOME/.oh-my-zsh"
# plugins=(zsh-autosuggestions zsh-syntax-highlighting)
# source $ZSH/oh-my-zsh.sh
source $HOME/.config/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source $HOME/.config/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
eval "$(starship init zsh)"
eval "$(direnv hook zsh)"

# ---- FZF -----

# Set up fzf key bindings and fuzzy completion
eval "$(fzf --zsh)"

# --- setup fzf theme ---
fg="#CBE0F0"
bg="#011628"
bg_highlight="#143652"
purple="#B388FF"
blue="#06BCE4"
cyan="#2CF9ED"

export FZF_DEFAULT_OPTS="--reverse"
# export FZF_DEFAULT_OPTS="--color=fg:${fg},bg:${bg},hl:${purple},fg+:${fg},bg+:${bg_highlight},hl+:${purple},info:${blue},prompt:${cyan},pointer:${cyan},marker:${cyan},spinner:${cyan},header:${cyan}"

# -- Use fd instead of fzf --

export FZF_DEFAULT_COMMAND="fd --hidden --strip-cwd-prefix --exclude .git"
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_ALT_C_COMMAND="fd --type=d --hidden --strip-cwd-prefix --exclude .git"

# Use fd (https://github.com/sharkdp/fd) for listing path candidates.
# - The first argument to the function ($1) is the base path to start traversal
# - See the source code (completion.{bash,zsh}) for the details.
_fzf_compgen_path() {
  fd --hidden --exclude .git . "$1"
}

# Use fd to generate the list for directory completion
_fzf_compgen_dir() {
  fd --type=d --hidden --exclude .git . "$1"
}

# source ~/fzf-git.sh/fzf-git.sh

show_file_or_dir_preview="if [ -d {} ]; then eza --tree --color=always {} | head -200; else bat -n --color=always --line-range :500 {}; fi"

export FZF_CTRL_T_OPTS="--preview '$show_file_or_dir_preview'"
export FZF_ALT_C_OPTS="--preview 'eza --tree --color=always {} | head -200'"

# Advanced customization of fzf options via _fzf_comprun function
# - The first argument to the function is the name of the command.
# - You should make sure to pass the rest of the arguments to fzf.
_fzf_comprun() {
  local command=$1
  shift

  case "$command" in
    cd)           fzf --preview 'eza --tree --color=always {} | head -200' "$@" ;;
    export|unset) fzf --preview "eval 'echo \${}'"         "$@" ;;
    ssh)          fzf --preview 'dig {}'                   "$@" ;;
    *)            fzf --preview "$show_file_or_dir_preview" "$@" ;;
  esac
}

# ----- Bat (better cat) -----

export BAT_THEME=tokyonight_night

# ---- Eza (better ls) -----

alias l="eza --color=always --long --git --icons=always"

# ---- Zoxide (better cd) ----
eval "$(zoxide init zsh)"

alias cd="z"


jjsynca(){
	#set -x
	jj git fetch && jj rebase -s "all:roots($1..@)" -d $1
	#set +x
}

jjpa() {
	#set -x
	jj git push -r "mine() & bookmarks() & $1::" --allow-new
	#set +x
}
jjspa(){
  jjsync $1 && jjpa $1
}


export PATH="$PATH:$HOME/.config/tmux/plugins/tmuxifier/bin"
eval "$(tmuxifier init -)"

export PATH="$PATH:$HOME/bin:$HOME/.cargo/bin"
#export NVM_DIR="$HOME/.nvm"
#[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
#[ -s "$NVM_DIR/etc/bash_completion.d/nvm" ] && \. "$NVM_DIR/etc/bash_completion.d/nvm"  # This loads nvm bash_completion

if command -v mise 2>&1 >/dev/null
then
  eval "$(`which mise` activate zsh)"
fi

export JJ_CONFIG=$HOME/.config/jj/config.toml

export XDG_DATA_DIRS="/opt/homebrew/share:$XDG_DATA_DIRS"
export PATH="/opt/homebrew/opt/llvm/bin:$PATH"

eval "$(atuin init zsh --disable-up-arrow)"


# Load Angular CLI autocompletion.
#source <(ng completion script)
