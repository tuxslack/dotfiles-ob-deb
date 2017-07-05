

# ls...
alias ls='ls --color=auto --group-directories-first'
alias la='ls -lhA'
alias ll='ls -lh'
alias l='ls -CF'

# pede senha...
if [ $UID -ne 0 ]; then
    # reboot
    alias reboot='sudo reboot'
    # apt-get...
    alias update='sudo apt-get update'
    alias upgrade='sudo apt-get upgrade'
    alias dist-upgrade='sudo apt-get dist-upgrade'
    alias autoclean='sudo apt-get autoclean'
    alias autoremove='sudo apt-get autoremove'
    alias ifconfig='sudo ifconfig'
fi

# cd...
alias cd..='cd ..'
alias ..='cd ..'
alias cd~='cd ~'
alias cd-='cd -'

# mount...
alias mount='mount |column -t'

# date time...
alias path='echo -e ${PATH//:/\\n}'
alias now='date +"%d-%m-%Y %T"'
alias nowtime='date +"%T"'
alias nowdate='date +"%d-%m-%Y"'

# ps com busca..
alias pss='ps aux | grep -v grep | grep -i -e VSZ -e'

# mkdir...
alias mkdir='mkdir -pv'
mkcd() { echo; mkdir "$1"; echo; cd "$1"; }

# htop default...
alias top='htop'

# meu ip...
alias myip='echo && echo "IP Local  : `hostname -I`" && echo "IP Público: `curl -s ipinfo.io/ip`" && echo'

# Speed Test
alias speed='echo;echo "Aguarde...";echo;speedtest-cli --simple;echo'

# chmod...
alias chx="chmod +x"
alias chr="chmod -x"

# extract any archive...
extract() { 
    if [ -f $1 ] ; then 
      case $1 in 
        *.tar.bz2)   tar xjf $1     ;; 
        *.tar.gz)    tar xzf $1     ;; 
        *.bz2)       bunzip2 $1     ;; 
        *.rar)       unrar e $1     ;; 
        *.gz)        gunzip $1      ;; 
        *.tar)       tar xf $1      ;; 
        *.tbz2)      tar xjf $1     ;; 
        *.tgz)       tar xzf $1     ;; 
        *.zip)       unzip $1       ;; 
        *.Z)         uncompress $1  ;; 
        *.7z)        7z x $1        ;; 
        *)     echo "'$1' cannot be extracted via extract()" ;; 
         esac 
     else 
         echo "'$1' is not a valid file" 
     fi 
}

# busca pacotes...
showpkg () {
  apt-cache pkgnames | grep -i "$1" | sort | less
  return;
}

# espeake...
alias espeak='espeak -v mb-br4 -s 93 -p 42 -g 0 -a 25'

# desenha uma linha horizontal...
drawline () {
	printf '%*s\n' "${COLUMNS:-$(tput cols)}" '' | tr ' ' -
}

# ------------------------------------------------------------------------------
# prompts
# :~$
export PS1='${debian_chroot:+($debian_chroot)}:\[\033[01;34m\]\w\[\033[00m\]\$ '
