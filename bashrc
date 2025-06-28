#
# ~/.bashrc
#
# If not running interactively, don't do anything
[[ $- != *i* ]] && return

export TERMINAL=alacritty

export HISTCONTROL=ignoreboth:erasedups

#PS1='[\u@\h \W]\$ '
parse_git_branch() {
     git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}
PS1="[\[\033[32m\]\w]\[\033[0m\]\$(parse_git_branch)\n\[\033[1;36m\]\u\[\033[32m\]$ \[\033[0m\]"

if [ -d "$HOME/.bin" ] ;
	then PATH="$HOME/.bin:$HOME/.local/bin:$PATH"
fi

#list
#alias ls='ls --color=auto'
#alias la='ls -a'
#alias ll='ls -lha'
#alias l='ls' 					
#alias l.="ls -A | egrep '^\.'"      

alias ls='exa'
alias la='ls -a'
alias ll='ls -lha'
alias l='ls' 					
alias l.="ls -a | grep -E '^\.'"      
alias newest='ls -t1 | head -n1'

#fix obvious typo's
alias cd..='cd ..'
alias pdw="pwd"

## Colorize the grep command output for ease of use (good for log files)##
alias grep='grep --color=auto'
alias egrep='grep -E --color=auto'
alias fgrep='fgrep --color=auto'

#readable output
alias df='df -h'

#pacman unlock
alias unlock="sudo rm /var/lib/pacman/db.lck"

#free
alias free="free -mt"

#continue download
alias wget="wget -c"

#userlist
alias userlist="cut -d: -f1 /etc/passwd"

#merge new settings
alias merge="xrdb -merge ~/.Xresources"

# Aliases for software managment
# pacman or pm
alias pacman='sudo pacman --color auto'
alias update='sudo pacman -Syyu'

# yay as aur helper - updates everything
alias pksyua="yay -Syu --noconfirm"

#ps
alias ps="ps auxf"
alias Psgrep="ps aux | grep -v grep | grep -i -e VSZ -e"

#grub update
alias update-grub="sudo grub-mkconfig -o /boot/grub/grub.cfg"

#improve png
alias fixpng="find . -type f -name "*.png" -exec convert {} -strip {} \;"

#add new fonts
alias fc='sudo fc-cache -fv'

#copy/paste all content of /etc/skel over to home folder - Beware
alias skel='cp -rf /etc/skel/* ~'

#quickly kill conkies
alias kc='killall conky'

#hardware info --short
alias hw="hwinfo --short"

#get fastest mirrors in your neighborhood 
alias mirror="sudo reflector --protocol https --latest 50 --number 20 --sort rate --save /etc/pacman.d/mirrorlist"
alias mirrors=mirror

#mounting the folder Public for exchange between host and guest on virtualbox
alias vbm="sudo mount -t vboxsf -o rw,uid=1000,gid=1000 Public /home/$USER/Public"

#shopt
shopt -s autocd # change to named directory
shopt -s cdspell # autocorrects cd misspellings
shopt -s cmdhist # save multi-line commands in history as single line
shopt -s dotglob
shopt -s histappend # do not overwrite history
shopt -s expand_aliases # expand aliases

#neofetch

EDITOR=nvim

alias vnc-port-forward="ssh -L 5901:localhost:5901 office-lenovo -N"
alias vnc-connect="vncviewer localhost:5901"

alias proxy-port-forward="ssh -L 3128:localhost:3128 office-lenovo -N"

# Home
alias open-dell-server="ssh dellserver"
alias vnc-dell-forward="ssh -L 5901:localhost:5901 dellserver -N"

#docker-compose
alias d-c="docker-compose"

# fyzzyfast and agrep section
[ -f ~/.fzf.bash ] && source ~/.fzf.bash
alias ag=agrep

# nvm section
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# ssh-agent section
if [ ! -S ~/.ssh/ssh_auth_sock ]; then
  eval `ssh-agent`
  ln -sf "$SSH_AUTH_SOCK" ~/.ssh/ssh_auth_sock
fi
export SSH_AUTH_SOCK=~/.ssh/ssh_auth_sock

#ssh-add -l > /dev/null || (ssh-add ~/.ssh/personal-ivan.majeru && ssh-add ~/.ssh/retently_rsa)
ssh-add -l > /dev/null || ssh-add ~/.ssh/personal-ivan.majeru

# virtualenvwrapper section
export WORKON_HOME=$HOME/.virtualenvs
source /usr/bin/virtualenvwrapper.sh


# rust and cargo
export PATH=$PATH:$HOME/.cargo/bin

# spring cli
export PATH=$PATH:/home/ivan/programs/spring-2.1.2.RELEASE/bin

# android / flutter
export ANDROID_HOME=$HOME/Android/Sdk
export ANDROID_SDK_ROOT=$ANDROID_HOME

# pacman update folder for download (need for jdk8 update)
export XDG_DOWNLOAD_DIR=$HOME/Downloads/

# review process
export REVIEW_BASE=master

# utils for retently

# nvim
alias vim=nvim

# retently docker-compose aliases
alias run_on_app="docker-compose exec app bash -c \"NODE_ENV=prod NPS_ENVIRONMENT_NAME=prod NPS_ENVIRONMENT_FILE=/startup/app.json ./node_modules/coffee-script/bin/coffee $@\""

export RETENTLY_DOCKER=$HOME/retently/app-docker
run_retently_worker () {
  cd $RETENTLY_DOCKER
  d-c exec app bash -c "NODE_ENV=prod NPS_ENVIRONMENT_NAME=prod NPS_ENVIRONMENT_FILE=/startup/app.json ./node_modules/coffee-script/bin/coffee $1"
  cd "$OLDPWD"
}
run_retently_debugger () {
  cd $RETENTLY_DOCKER
  local command=
  echo $command
  d-c exec app bash -c "NODE_ENV=prod NPS_ENVIRONMENT_NAME=prod NPS_ENVIRONMENT_FILE=/startup/app.json coffee --nodejs --inspect='0.0.0.0:9229' $1"
}
retently_docker () {
  cd $RETENTLY_DOCKER
  d-c $@
  cd "$OLDPWD"
}
alias ret-up="cd $RETENTLY_DOCKER && d-c up"
alias ret-stop="cd $RETENTLY_DOCKER && d-c stop"
alias ret-app="cd $RETENTLY_DOCKER && d-c exec app bash"
alias ret-nps="cd $RETENTLY_DOCKER/com.retently.nps-webapp"
alias ret-nutribot="cd $RETENTLY_DOCKER/../nutrichat/nutrichat-telegram-bot"
alias ret-integr="cd $RETENTLY_DOCKER/com.retently.integrations"
alias ret-integr-node="cd $RETENTLY_DOCKER/com.retently.integrations"
alias ret-worker="run_retently_worker"
alias ret-debug="run_retently_debugger"
run_retently_mongo () {
  cd $RETENTLY_DOCKER
  d-c exec app-mongo bash -c "mongo $@"
  cd "$OLDPWD"
}
alias ret-mongo="run_retently_mongo"


# history
export HISTSIZE=10000
export HISTFILESIZE=20000
shopt -s histappend
export PROMPT_COMMAND='history -a'

[[ -s "/home/ivan/.gvm/scripts/gvm" ]] && source "/home/ivan/.gvm/scripts/gvm"

start_tv () {
  mpv --demuxer-cache-wait --cache=yes --demuxer-readahead-secs=20 --demuxer-max-bytes=23400Kib $@
}

export IEDEM_PLS="http://767aea038b39.iedem.com/playlists/uplist/ec881abe933229ccf7f329c1c439ae6a/playlist.m3u8"
iedem () {
  vlc $IEDEM_PLS
}

export TELEK_PLS="http://telek.me/013738/22633483.m3u8"
telek () {
  vlc $TELEK_PLS
}

export FREE_TV="https://m3url.ru/premier15052023VPN.m3u"
free_tv () {
  vlc $FREE_TV
}

# poetry
export PATH="$HOME/.poetry/bin:$PATH"
source ~/.poetry_completion

eval "$(starship init bash)"

# pyenv
# export PYENV_ROOT="$HOME/.pyenv"
# command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
# eval "$(pyenv init -)"

# composer
export PATH=~/.config/composer/vendor/bin:$PATH

alias sail='bash vendor/bin/sail'

export SUDO_ASKPASS="$HOME/.bin/askpass-cmd"

export GOPATH=$HOME/go
export PATH=$PATH:$GOPATH/bin/

alias daynote='nvim $(date +%F).md'

source ~/.private_env
