# Import colorscheme from 'wal' asynchronously
# # &   # Run the process in the background.
# # ( ) # Hide shell job control messages.
#
# # Alternative (blocks terminal for 0-3ms)
#
# # To add support for TTYs this line can be optionally added.
export TERM="xterm-256color"
# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
#ZSH_THEME="amuse"
ZSH_THEME="powerlevel9k/powerlevel9k"
POWERLEVEL9K_CUSTOM_WIFI_SIGNAL="zsh_wifi_signal"
POWERLEVEL9K_CUSTOM_WIFI_SIGNAL_BACKGROUND="white"
POWERLEVEL9K_CUSTOM_WIFI_SIGNAL_FOREGROUND="black"

zsh_wifi_signal(){
        local output=$(/System/Library/PrivateFrameworks/Apple80211.framework/Versions/A/Resources/airport -I)
        local airport=$(echo $output | grep 'AirPort' | awk -F': ' '{print $2}')

        if [ "$airport" = "Off" ]; then
                local color='%F{black}'
                echo -n "%{$color%}Wifi Off"
        else
                local ssid=$(echo $output | grep ' SSID' | awk -F': ' '{print $2}')
                local speed=$(echo $output | grep 'lastTxRate' | awk -F': ' '{print $2}')
                local color='%F{black}'

                [[ $speed -gt 100 ]] && color='%F{black}'
                [[ $speed -lt 50 ]] && color='%F{red}'

                echo -n "%{$color%}$speed Mbps \uf1eb%{%f%}" # removed char not in my PowerLine font
        fi
}

POWERLEVEL9K_CONTEXT_TEMPLATE='%n'
POWERLEVEL9K_CONTEXT_DEFAULT_FOREGROUND='white'
POWERLEVEL9K_BATTERY_CHARGING='yellow'
POWERLEVEL9K_BATTERY_CHARGED='green'
POWERLEVEL9K_BATTERY_DISCONNECTED='$DEFAULT_COLOR'
POWERLEVEL9K_BATTERY_LOW_THRESHOLD='10'
POWERLEVEL9K_BATTERY_LOW_COLOR='red'
POWERLEVEL9K_MULTILINE_FIRST_PROMPT_PREFIX=''
POWERLEVEL9K_BATTERY_ICON='\uf1e6 '
POWERLEVEL9K_PROMPT_ON_NEWLINE=true
POWERLEVEL9K_MULTILINE_LAST_PROMPT_PREFIX="%F{014}\u2570%F{cyan}\uF460%F{073}\uF460%F{109}\uF460%f "
POWERLEVEL9K_VCS_MODIFIED_BACKGROUND='yellow'
POWERLEVEL9K_VCS_UNTRACKED_BACKGROUND='yellow'
POWERLEVEL9K_VCS_UNTRACKED_ICON='?'

POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(os_icon context battery dir vcs)
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(status time dir_writable ip ram load background_jobs vi_mode)
# POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(status time dir_writable ip custom_wifi_signal ram load background_jobs vi_mode)

POWERLEVEL9K_SHORTEN_DIR_LENGTH=1

POWERLEVEL9K_TIME_FORMAT="%D{\uf017 %H:%M \uf073 %d/%m/%y}"
POWERLEVEL9K_TIME_BACKGROUND='white'
POWERLEVEL9K_RAM_BACKGROUND='yellow'
POWERLEVEL9K_LOAD_CRITICAL_BACKGROUND="white"
POWERLEVEL9K_LOAD_WARNING_BACKGROUND="white"
POWERLEVEL9K_LOAD_NORMAL_BACKGROUND="white"
POWERLEVEL9K_LOAD_CRITICAL_FOREGROUND="red"
POWERLEVEL9K_LOAD_WARNING_FOREGROUND="yellow"
POWERLEVEL9K_LOAD_NORMAL_FOREGROUND="black"
POWERLEVEL9K_LOAD_CRITICAL_VISUAL_IDENTIFIER_COLOR="red"
POWERLEVEL9K_LOAD_WARNING_VISUAL_IDENTIFIER_COLOR="yellow"
POWERLEVEL9K_LOAD_NORMAL_VISUAL_IDENTIFIER_COLOR="green"
POWERLEVEL9K_HOME_ICON=''
POWERLEVEL9K_HOME_SUB_ICON=''
POWERLEVEL9K_FOLDER_ICON=''
POWERLEVEL9K_STATUS_VERBOSE=true
POWERLEVEL9K_STATUS_CROSS=true
#ZSH_THEME="honukai"
# ZSH_THEME="flazz"
#ZSH_THEME="avit"
# POWERLEVEL9K_VI_INSERT_MODE_STRING="I"
# POWERLEVEL9K_VI_COMMAND_MODE_STRING="N"
    # Set 'dir_writable' segment colors
# Uncomment following line if you want to disable command autocorrection
DISABLE_CORRECTION="false"

# Uncomment following line if you want red dots to be displayed while waiting for completion
COMPLETION_WAITING_DOTS="true"

# Uncomment following line if you want to disable marking untracked files under
# VCS as dirty. This makes repository status check for large repositories much,
# much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

INTERACTIVECOMMENTS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
#
plugins=(git colorize gnu-utils brew history history-substring-search docker autojump vi-mode  dirhistory pip python thefuck web-search zsh-autosuggestions colored-man-pages copydir) 

zmodload -ap zsh/mapfile mapfile


export PATH=/usr/local/bin:$PATH:/usr/local/bin:/opt/local/sbin:/opt/local/bin:/opt/local/sbin:/usr/local/bin:/usr/local/git/bin:/System/Library/Perl/Extras/5.8.6:/Library/Perl/5.8.1:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/opt/X11/bin:/usr/local/texlive/2013/bin/universal-darwin:~/Library/Mathematica/Applications:~/code/Mathematica:/usr/local/ff++/openmpi/3.47/bin
export PATH=$PATH:/Applications/Mathematica.app/Contents/MacOS:/usr/local/bin:/home/junior/.local/bin

source $ZSH/oh-my-zsh.sh

LSCOLORS=

# Customize to your needs...
# export DROPBOX=~/Dropbox/
export MMA=/Applications/Mathematica\ Home\ Edition.app/SystemFiles/Links/MathLink/DeveloperKit/CompilerAdditions
export PYTHONIOENCODING=utf-8
# export PYTHONPATH=$PYTHONPATH:/usr/local/lib/python2.7/site-packages
export CUDA_ROOT=/usr/local/cuda/bin
export DYLD_LIBRARY_PATH=/usr/local/cuda/lib/:$DYLD_LIBRARY_PATH
# export CLICOLOR=1
export TERM="xterm-256color"
export box_name='rmbpro'
export FZF_DEFAULT_COMMAND='ag -g ""'
PROMPT_COMMAND='echo -ne "\033]0;${USER}: ${PWD}\007"'
#
#
set -o vi

excel()  {  open -a "Microsoft Excel" "$@"  }
word()   {  open -a "Microsoft Word" "$@"  }
ppt()    {  open -a "Microsoft Powerpoint" "$@"  }
ff()     {  open -a "/Applications/Firefox.app" "$@"  }
vimr()     {  open -a "/Applications/VimR.app" "$@"  }
safari() {  open -a Safari "$@"  }
# paraview() {  open -a "/Applications/paraview.app/Contents/MacOS/paraview" "$@"  }
utf8()
{
    iconv -f ISO-8859-1 -t UTF-8 $1 > $1.tmp
	    rm $1
		    mv $1.tmp $1
			}
alias ls=exa
alias apps='open /Applications'
# alias gh='/Applications/Github\ Desktop.app; open .; cd -'
alias ffp='freefem++'
alias killstatus='killall -KILL SystemUIServer'

alias v=nvim
alias vim=nvim
# alias gh=github
# alias j=autojump
alias vimv='nvim ~/.config/nvim/init.vim'
alias vimz='nvim ~/.zshrc'
alias vimi3='vim ~/.config/i3/config'
alias vimfc='vim ~/.fvwm/config'
alias rm='rm -v'
alias cp='cp -v'
alias mv='mv -v'
alias td='tmux detach'
alias vimt='vim ~/.tmux.conf'
alias tls='tmux ls'
alias py3='python3'
alias py2='python2'
alias py='python'
alias ipy3='ipython3'
eval $(thefuck --alias)
alias f='fuck'
alias zshr='source ~/.zshrc'
alias gits='git status'
alias dockerd='eval "$(docker-machine env default)"'
alias reload='source ~/.zshrc'
alias bupd='brew update'
alias bupg='brew upgrade'
alias cl='clear'
alias ff++='FreeFem++'
# alias tmux='TERM=xterm-256color tmux -2'
alias tmuxinator='TERM=xterm-256color tmuxinator'
# alias mux='TERM=xterm-256color mux'
alias octave='octave-cli'
alias vimt='vim ~/.tmux.conf'
alias vimd='vim ~/code/Docker/Dockerfile'
alias ms='MathematicaScript'
alias hsn='h|grep'
alias dockerm='docker run -p 8888:8888  -v ~/container:/home/jovyan/work -it wolfram-jupyter'
alias exa='exa --group-directories-first --icons'
alias startdocker="sudo systemctl start docker.service"
# alias ack='ack --pager="less -FRSX"'

CTAGS=--langmap=fortran:+.f90
# [[ -s `brew --prefix`/etc/autojump.sh ]] && . `brew --prefix`/etc/autojump.sh
set -k
export LC_CTYPE=en_US.UTF-8
export LC_ALL=en_US.UTF-8
function push {
    curl -s -F "token=asMoppDBgAybm4cessqpUUmG4yaSQq" \
		    -F "user=uXjLXfmTDSWy1vFqVyVPQ8ux7P1eeg" \
			    -F "title=iTerm" \
				    -F "message=$1" https://api.pushover.net/1/messages.json
	}
alias of231="/usr/bin/open ~/OpenFOAM.sparsebundle; sleep 1; . ~/OpenFOAM/OpenFOAM-2.3.1/etc/bashrc; . ~/.alias";
export PATH="/usr/local/sbin:$PATH"
export PATH="$PATH:$CUDA_ROOT"

# # Base16 Shell
# BASE16_SHELL="$HOME/Dropbox/Library/base16-material.dark.sh"
# [[ -s $BASE16_SHELL ]] && source $BASE16_SHELL

# test -e ${HOME}/.iterm2_shell_integration.zsh && source ${HOME}/.iterm2_shell_integration.zsh
# source ~/.iterm2_shell_integration.`basename $SHELL`
export EDITOR='nvim'
fpath=($HOME/.tmuxinator/completion ${fpath})
autoload -U compinit
compinit
# source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
export WORKON_HOME=/Users/junior/.virtualenvs
export VIRTUALENVWRAPPER_PYTHON=/usr/local/bin/python3
if [ "$TERM" = "xterm" ]; then
	  export TERM="xterm-256color"
fi
# source ~/.bin/tmuxinator.zsh  
# source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
BASE16_SHELL=$HOME/.config/base16-shell/
[ -n "$PS1" ] && [ -s $BASE16_SHELL/profile_helper.sh ] && eval "$($BASE16_SHELL/profile_helper.sh)"
# set VIMODE according to the current mode (default “[i]”)
VIMODE='[i]'
function zle-keymap-select {
 VIMODE="${${KEYMAP/vicmd/[n]}/(main|viins)/[i]}"
 zle reset-prompt
}

zle -N zle-keymap-select

# Set the prompt to “[user]@[host[ [vi mode] $ ”
# PROMPT="%n@%m ${VIMODE} \\$ "
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
sc() {find  ~/Documents/code/ ~/Dropbox/code/ -regex '.*\.\(py\|for\|c\|f\|h\|edp\)'  | fzf | xargs  nvim ;}
# open() {fd -t f | fzf |xargs -0 -n 1 xdg-open </dev/null >/dev/null 2>&1 ;} 
open() {fd -t f -H -I | fzf -m --preview="pistol {}" | xargs -ro -d "\n" xdg-open 2>&-}
cdf() {
    cd $HOME && cd "$(fd -t d | fzf --preview="tree -L 1 {}" --bind="space:toggle-preview" --preview-window=:hidden)"
}
si() {ack -l -m 20 "$1"  ~/Documents/code ~/Dropbox/code/| fzf | xargs nvim ;}
pacs() {
    sudo pacman -Syy $(pacman -Ssq | fzf -m --preview="pacman -Si {}" --preview-window=:hidden --bind=space:toggle-preview)
}
if [ $TILIX_ID ] || [ $VTE_VERSION ]; then
	        source /etc/profile.d/vte.sh
fi
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

j() {
    if [[ "$#" -ne 0 ]]; then
        cd $(autojump $@)
        return
    fi
    cd "$(autojump -s | sort -k1gr | awk '$1 ~ /[0-9]:/ && $2 ~ /^\// { for (i=2; i<=NF; i++) { print $(i) } }' |  fzf --height 60% --reverse --inline-info)" 
}
p () {
    open=xdg-open   # this will open pdf file withthe default PDF viewer on KDE, xfce, LXDE and perhaps on other desktops.

    ag -U -g ".pdf$" \
    | fast-p \
    | fzf --read0 --reverse -e -d $'\t'  \
        --preview-window down:80% --preview '
            v=$(echo {q} | tr " " "|"); 
            echo -e {1}"\n"{2} | grep -E "^|$v" -i --color=always;
        ' \
    | cut -z -f 1 -d $'\t' | tr -d '\n' | xargs -r --null $open > /dev/null 2> /dev/null
}
# Import colorscheme from 'wal' asynchronously
# &   # Run the process in the background.
# ( ) # Hide shell job control messages.
(cat ~/.cache/wal/sequences &)

# Alternative (blocks terminal for 0-3ms)
cat ~/.cache/wal/sequences

# To add support for TTYs this line can be optionally added.
source ~/.cache/wal/colors-tty.sh

alias covid19='watch -c -n600 "curl -s -L covid19.trackercli.com/Brazil"'
fb() {
    # save newline separated string into an array
    mapfile -t website <<< "$(buku -p -f 5 | column -ts$'\t' | fzf --multi)"

    # open each website
    for i in "${website[@]}"; do
        index="$(echo "$i" | awk '{print $1}')"
        buku -p "$index"
        buku -o "$index"
    done
}
eval "$(gh completion -s zsh)"
