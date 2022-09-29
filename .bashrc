# .bashrc

# User specific aliases and functions

alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'

############
#My aliases#
############
alias ll='ls -alh --color=auto'
alias la='ls -alrth --color=auto'
alias psg='ps -ef | grep -v grep| grep --color=auto'
alias nets='netstat -anp|grep --color=auto'
alias whi='while true; do'
alias fr='sleep 1; clear; done'
alias d='dirs -v'
alias pu='pushd .'
alias less='less -M'
alias cgrep='grep --color=always'
alias ssh='ssh -e "+"'
#alias wanip='dig +short myip.opendns.com @resolver1.opendns.com'
alias wanip='wget -qO- http://ipecho.net/plain | xargs echo'
alias v='nvim'
alias dotfiles="/urs/bin/git --git-dir=$HOME/dotfiles/ --work-tree=$HOME"
#alias dul='data=$(ls -l|sed '1d'|awk 'BEGIN { OFS="" ; ORS="" } ; { for ( i=9; i<NF; i++ ) print $i " "; print $NF "\n" }'); printf '%s\n' "$data" | while IFS= read -r line ; do du -sh "$line"; done'
 
#alias table='iptables -L -vn --line-numbers'
Vig(){
	if [ -z $5 ]; then
		python3 /home/coret/.Vig "$1" "$2" "$3" "$4"
	else
		python3 /home/coret/.Vig "$1" "$2" "$3" "$4" "$5"
	fi
}
CHS(){
	python3 /home/coret/.CHS $1 $2 $3 $4 $5
}
table(){
        if [ "$#" -lt 1  ]; then
                iptables -L -vn --line-numbers
        else
                for var in "$@"
                do
                        echo -e ""
                        iptables -L "$var" -vn --line-numbers
                done
        fi
}
###################
#End of My aliases#
###################
export HISTTIMEFORMAT="%d/%m/%y %T "
#[date]username@hostname# (green, red date, green until @, yellow hostname, green #)

#for ROOT
#date [username@hostname]# (date red, username blue, hostname red, # blue, text yellow)
#PS1="\[\e[38;5;196m\]\A\[\e[m\] \[\e[38;5;27m\][\u@\[\e[m\]\[\e[38;5;196m\]\h\[\e[m\]\[\e[38;5;27m\]]#\[\e[m\] \e[38;5;226m\]"

#last=$(last|head -6)                                                                                                                                                               
#echo -e "This are the last 6 logins:\n$last"                                                                                                                                       
#logged=$(last|cgrep "still logged")                                                                                                                                                
#echo -e "\nThis are the current users logged:\n$logged"

#envfile="$HOME/.gnupg/gpg-agent.env"
#if [[ -e "$envfile" ]] && kill -0 $(grep GPG_AGENT_INFO "$envfile" | cut -d: -f 2) 2>/dev/null; then
#    eval "$(cat "$envfile")"
#else
#    eval "$(gpg-agent --daemon --allow-preset-passphrase --write-env-file "$envfile")"
#fi
#export GPG_AGENT_INFO

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

[ -f ~/.fzf.bash ] && source ~/.fzf.bash

#/home/coret/scripts/ping_test.sh &
PS1="\[\e[38;5;46m\][\[\e[m\]\[\e[38;5;196m\]\A\[\e[m\]\[\e[38;5;46m\]]\u@\[\e[m\]\[\e[38;5;226m\]\h\[\e[m\]\[\e[38;5;46m\]#\[\e[m\] "
