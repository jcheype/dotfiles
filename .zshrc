#if command -v nix-user-chroot && [ -z "${NIX_PROFILES}" ]; then
#    nix-user-chroot ~/.nix zsh -l
#fi

if [ -d /usr/local/bin ]; then
  export PATH=$PATH:/usr/local/bin
fi

export EDITOR=nvim
#export PYENV_ROOT="$HOME/.pyenv"
#export PATH="$PYENV_ROOT/bin:$PATH"
#export PATH="$PYENV_ROOT/shims:${PATH}"
#eval "$(pyenv init -)"
#eval "$(pyenv virtualenv-init -)"

eval "$(fzf --zsh)"
eval "$(starship init zsh)"
eval "$(direnv hook zsh)"
eval "$(zoxide init zsh)"


# Use fd (https://github.com/sharkdp/fd) for listing path candidates.
# - The first argument to the function ($1) is the base path to start traversal
# - See the source code (completion.{bash,zsh}) for the details.
_fzf_compgen_path() {
  fd --hidden --follow --exclude ".git" . "$1"
}

# Use fd to generate the list for directory completion
_fzf_compgen_dir() {
  fd --type d --hidden --follow --exclude ".git" . "$1"
}

# Advanced customization of fzf options via _fzf_comprun function
# - The first argument to the function is the name of the command.
# - You should make sure to pass the rest of the arguments to fzf.
_fzf_comprun() {
  local command=$1
  shift

  case "$command" in
    cd)           fzf --preview 'tree -C {} | head -200'   "$@" ;;
    export|unset) fzf --preview "eval 'echo \$'{}"         "$@" ;;
    ssh)          fzf --preview 'dig {}'                   "$@" ;;
    *)            fzf --preview 'bat -n --color=always {}' "$@" ;;
  esac
}


export ZSH="$HOME/.oh-my-zsh"
plugins=(git starship zoxide direnv zsh-autosuggestions zsh-syntax-highlighting)
source $ZSH/oh-my-zsh.sh


export NVM_DIR="$HOME/.nvm"
[ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"  # This loads nvm
[ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion




export PATH="$PATH:$HOME/bin:$HOME/.cargo/bin"


