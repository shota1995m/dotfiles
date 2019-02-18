# LANG
export LANG=ja_JP.UTF-8

# ビープ音鳴らさない
setopt nobeep

# 補完
autoload -U compinit
compinit

#LS_COLORSを設定しておく
export LSCOLORS=exfxcxdxbxegedabagacad
export LS_COLORS='di=46:ln=35:so=32:pi=33:ex=31:bd=46;34:cd=43;34:su=41;30:sg=46;30:tw=42;30:ow=43;30'

alias ls="ls -GF"
alias gls="gls --color"
alias co="commit"

zstyle ':completion:*' list-colors 'di=34' 'ln=35' 'so=32' 'ex=31' 'bd=46;34' 'cd=43;34'

# PROMPT
autoload colors
colors
#PROMPT="%{$fg[green]%}%m%(!.#.$) %{$reset_color%}"
#PROMPT="
# %{${fg[cyan]}%}%~%{${reset_color}%} 
# [%n@%m]"
#PROMPT2="%{$fg[green]%}%_> %{$reset_color%}"
PROMPT2='[%n]> '
SPROMPT="%{$fg[red]%}correct: %R -> %r [n/y/a/e]? %{$reset_color%}"
#RPROMPT="%{$fg[cyan]%}[%~]%{$reset_color%}"

#PROMPT git
autoload -Uz vcs_info
setopt prompt_subst

#zstyle ':vcs_info:*' enable git svn
#zstyle ':vcs_info:*' actionformats '(%s)-[%b|%a] '
#zstyle ':vcs_info:*' formats       '(%s)-[%b] '
#zstyle ':vcs_info:(sv[nk]|bzr):*' branchformat '%b:%r'

#zstyle ':completion:*' menu select
#zstyle ':completion:*' matcher-list '' 'm:{a-zA-Z}={A-Za-z}'

zstyle ':vcs_info:git:*' check-for-changes true
 #formats 設定項目で %c,%u が使用可
zstyle ':vcs_info:git:*' stagedstr "%F{green}!"
 #commit されていないファイルがある
zstyle ':vcs_info:git:*' unstagedstr "%F{magenta}+"
 #add されていないファイルがある
zstyle ':vcs_info:*' formats "%F{cyan}%c%u(%b)%f"
 #通常
zstyle ':vcs_info:*' actionformats '[%b|%a]'
 #rebase 途中,merge コンフリクト等 formats 外の表示

precmd () { vcs_info }

# color
blue_g1='%{[38;5;082m%}'
blue_g2='%{[38;5;085m%}'
blue_g3='%{[38;5;087m%}'
reset='%{[0m%}'

# color
blue_g1='%{[38;5;082m%}'
blue_g2='%{[38;5;085m%}'
blue_g3='%{[38;5;087m%}'
reset='%{[0m%}'

PROMPT="
 %{${fg[cyan]}%}%~%{${reset_color}%} ${vcs_info_msg_0_}
 %n@%m ${blue_g1}❯${blue_g2}❯${blue_g3}❯${reset} "

alias ssh='ssh -A'
alias vi='nvim'

# history
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt hist_ignore_dups     # ignore duplication command history list
setopt share_history        # share command history data 
setopt extended_history
setopt hist_expire_dups_first
setopt hist_ignore_dups
setopt hist_ignore_all_dups
setopt hist_ignore_space
setopt hist_find_no_dups
setopt hist_save_no_dups
setopt hist_beep

export FZF_ALT_C_OPTS="--preview 'tree -C {} | head -200'"
export FZF_CTRL_R_OPTS="--preview 'echo {}' --preview-window down:3:hidden:wrap --bind '?:toggle-preview'"
export FZF_DEFAULT_COMMAND='ag -g ""'
[ -f ~/.zshrc.local ] && source ~/.zshrc.local
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
