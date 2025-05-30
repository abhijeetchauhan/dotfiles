# --- Aliases ---
source ~/.aliases

# --- Editor Defaults ---
export EDITOR="nvim"
export VISUAL="nvim"


# --- History Settings ---
HISTFILE=~/.zhistory
HISTSIZE=10000
SAVEHIST=10000
setopt HIST_SAVE_NO_DUPS      

# --- Zsh Behavior ---
setopt extendedglob nomatch notify AUTO_CD
bindkey -v

# --- Plugins and Tools ---
source /usr/share/doc/fzf/examples/key-bindings.zsh
eval "$(pyenv init -)"
source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh

# --- Git prompt ---
autoload -Uz vcs_info
precmd() { vcs_info }
zstyle ':vcs_info:git*' actionformats "%b %m%u%c "

setopt PROMPT_SUBST
PROMPT='[%F{green}%n%f %F{blue}%1~%f] %F{red}${vcs_info_msg_0_}%f$ '

# --- Node Version Manager ---
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# --- Custom functions ---
fixup() {
  local target=$(git log --oneline --reverse --first-parent "$(git merge-base HEAD develop/latest)"..HEAD | \
    fzf --preview='git show --color=always $(echo {} | awk "{print \$1}")' | \
    awk '{print $1}')
  [ -n "$target" ] && git commit --fixup="$target"
}
