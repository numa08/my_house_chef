#!/usr/local/bin/zsh
fpath=(~/.zsh/completion $fpath)
autoload -U compinit
compinit

export LC_MESSAGE="en_US.UTF-8"
export LC_TIME="ja_JP.UTF-8"
export LANG="ja_JP.UTF-8"

setopt nolistbeep
bindkey -v
autoload history-search-end
zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end
bindkey "^P" history-beginning-search-backward-end
bindkey "^N" history-beginning-search-forward-end
setopt inc_append_history
bindkey "^R" history-incremental-search-backward
bindkey "^S" history-incremental-search-forward

HISTFILE=~/.zsh_history
HISTSIZE=10000
SVAEHIST=10000
setopt hist_ignore_dups
setopt share_history
setopt auto_cd
setopt auto_pushd
setopt correct
setopt list_packed

dot_files=(.path.zsh .git_setting.zsh .android.zsh .rbenv.zsh .java.zsh .scala.zsh)
for file in $dot_files
do
  if [ -f ${HOME}/$file ];then
    source ${HOME}/$file
  fi
done
local p_dir="%B%F{blue}[%d]%f%b"$'\n'
local p_mark=$'\n'"%B%(?,%F{green},%F{red})#%f%b"
local p_info="%B%F{green}＼(・ω・＼)%n@%m(／・ω・)／%f%b ${WINDOW:+"[$WINDOW]"}"
PROMPT="$p_dir $p_info $p_mark"
RPROMPT="%1(v|%B%F{red}%1v%f%b|)"