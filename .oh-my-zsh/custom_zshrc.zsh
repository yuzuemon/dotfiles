# common -------------------------------
export LANG=ja_JP.UTF-8

autoload -U compinit                    # 強力な補完機能
compinit

case "$OSTYPE" in
# MacOS
darwin*)
  export EDITOR=/Applications/MacVim.app/Contents/MacOS/Vim
  ;;
esac

# bindkey -v                              # vim
bindkey -e                              # emacs

# color
autoload colors                         # カラーセット
colors
export LSCOLORS=gxfxcxdxbxegedabagacad

setopt transient_rprompt                # 右まできたら、時刻非表示

setopt prompt_subst                     # 候補自動補完
# setopt correct # うざい
unsetopt correct_all


# cd
setopt auto_cd                          # 自動的にcd
setopt auto_pushd                       # cd履歴表示
setopt pushd_ignore_dups                # 同じディレクトリを履歴に追加しない


# terminal
case "${TERM}" in
kterm*|xterm)
  precmd() {
    echo -ne "\033]0;${USER}@${HOST%%.*}:${PWD}\007"
  }
  ;;
esac


# auto complete
setopt list_packed                      # リストを詰めて表示
setopt list_types                       # 補完一覧ファイル種別表示
setopt nolistbeep                       # 補完候補表示時のビープ音無効
setopt noautoremoveslash                # 末尾の/の自動削除機能無効
# predict-on


# history
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000

setopt hist_ignore_dups                 # 重複を記録しない
setopt hist_reduce_blanks               # スペース排除
setopt share_history                    # 履歴ファイルを共有
setopt EXTENDED_HISTORY                 # zshの開始終了を記録

autoload history-search-end
zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end
bindkey "^P" history-beginning-search-backward-end
bindkey "^N" history-beginning-search-forward-end



setopt complete_aliases                 # デフォルトのコマンドをベースに補完

alias o='open'
case "$OSTYPE" in
darwin*)                                # for MacOS
  alias ls='ls -ahGp'
  alias ld='ls -ahGp | grep /'
  alias ll='ls -ahGlp'
  alias lld='ls -ahGlp | grep /'
  ;;
freebsd*)                               # for FreeBSD
  alias ls='ls -ahGp'
  alias ld='ls -ahGp | grep /'
  alias ll='ls -ahGlp'
  alias lld='ls -ahGlp | grep /'
  ;;
linux*)                                 # for GNU
  alias ls='ls -ahp --color=auto'
  alias ld='ls -ahp --color=auto | grep /'
  alias ll='ls -ahlp --color=auto'
  alias lld='ls -ahlp --color=auto | grep /'
  ;;
esac

# add PATH
PATH=$HOME/bin:$PATH
export JAVA_HOME=/usr/bin/java
export HADOOP_HOME=/usr/local/bin/hadoop

alias sl='sl -ae'

case "$OSTYPE" in
darwin*)
  alias vi='env LANG=ja_JP.UTF-8 /Applications/MacVim.app/Contents/MacOS/Vim "$@"'
  alias gvim='env LANG=ja_JP.UTF-8 /Applications/MacVim.app/Contents/MacOS/Vim -g "$@"'
  alias ctags='/Applications/MacVim.app/Contents/MacOS/ctags "$@"'
  alias cotEditor='/Applications/CotEditor.app/Contents/MacOS/CotEditor "$@"'
  ;;
freebsd*)
  alias vi='~/bin/vim'
  ;;
esac
alias vim='vi'
alias gvi='gvim'

alias expdiff='bzr cdiff | iconv -f cp932'

# if .zshrc.mine is find, that readed for source.
[ -f ~/.zshrc.mine ] && source ~/.zshrc.mine
