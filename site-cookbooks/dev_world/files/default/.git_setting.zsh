autoload -Uz vcs_info
zstyle ':vcs_info:*' formats '[%b]'
zstyle ':vsc_info:*' actionformats '[%b%a]'
precmd(){
  psvar=()
  LANG=en_US.UTF-8 vcs_info
  [[ -n "$vcs_info_msg_0_" ]] && psvar[1]="$vcs_info_msg_0_"
}

export GIT_DISCOVERY_ACROSS_FILESYSTEM=true