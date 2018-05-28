# Source global definitions
if [ -f /etc/bashrc ]; then
        . /etc/bashrc
fi
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
# HISTSIZE=1000
# HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
#force_color_prompt=yes

export LANG='UTC-8'
export LC_ALL='en_US.UTF-8'
if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
    # We have color support; assume it's compliant with Ecma-48
    # (ISO/IEC-6429). (Lack of such support is extremely rare, and such
    # a case would tend to support setf rather than setaf.)
    color_prompt=yes
    else
    color_prompt=yes
    fi
fi

if [ "$color_prompt" = yes ]; then
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m]\u@\h\[\033[00m\]: \[\033[01;34m\]\w\[\033[00m\] \$\n'
#     PS1=' \[\033[01;34m\]\w\[\033[00m\] \$\n'
else
    PS1='\[\t\] \[\d\] \[\w\] \$\n '
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    #PS1="[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a]$PS1"
    PS1="${debian_chroot:+($debian_chroot)}\u@\h:$PS1"
    ;;
*)
    ;;
esac

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    alias dir='dir --color=auto'
    alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# some more ls aliases
#alias R='/mnt/nfs/user/yangjie/bin/R/bin/R'
alias ll='ls -alF'
alias le='less -r'
alias les='less -S'
#alias less='less -S'
alias la='ls -A'
alias l='ls -CF'
alias rq="cd /mnt/nfs/user/renqian"
alias em='/mnt/nfs/user/renqian/bin/emacs/bin/emacs'
# alias pro='cd /mnt/cfs/project/test_freshman/renqian'
alias pp='/mnt/nfs/user/renqian/easycommand/projectfind.sh'
alias getsample='/mnt/nfs/user/renqian/easycommand/getsample.sh'
alias generator='/mnt/nfs/user/renqian/easycommand/generator.sh'
alias tesela='cd /mnt/cfs/prj17a/QG77000/renqian'
alias mybin='cd /mnt/nfs/user/renqian/bin'
alias myenv='cd /mnt/nfs/user/renqian'
alias mylink='python2 -m SimpleHTTPServer 8999'
alias soft='cd /mnt/nfs/software/'
alias sub='qsub -cwd -l vf=8g -q test.q -P test'
alias tools='cd /mnt/nfs/pipeline/yucecloud'
alias pipeme='cd /mnt/nfs/user/renqian/pipeline'


# Add an "alert" alias for long running commands.  Use like so:
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'
# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

# yucebio
alias monitor="python /mnt/nfs/pipeline/yucecloud/modular/bin/monitor.py"
alias RNAplfold="/mnt/nfs/software/share/ViennaRNA-2.2.6/dist/bin/RNAplfold"
alias yucebio="cd /mnt/nfs/pipeline/yucecloud/modular/"

# LIB PATH
LD_LIBRARY_PATH="/mnt/nfs/software/lib:/mnt/nfs/user/renqian/bin/lib:$LD_LIBRARY_PATH"
MYLIB=/mnt/nfs/user/renqian/lib
# PERL
export PERL5LIB="/home/renqian/perl5/lib/perl5:$MYLIB/PERL:/mnt/nfs/user/renqian/lib/perl_modules/lib:$LD_LIBRARY_PATH/perl5:/home/yangjie/perl5/lib/perl5:/home/chenly/perl5/lib/perl5:/mnt/nfs/software/package/ascatngs/release/lib/perl5:/mnt/nfs/software/lib/perl5:/mnt/nfs/software/lib/perl/5.18.2"
PERL_LOCAL_LIB_ROOT="/mnt/nfs/user/renqian/lib${PERL_LOCAL_LIB_ROOT:+:${PERL_LOCAL_LIB_ROOT}}"; export PERL_LOCAL_LIB_ROOT;
PERL_MM_OPT="INSTALL_BASE=/mnt/nfs/user/renqian/lib/perl5"; export PERL_MM_OPT;
# R
MYR=~/R/x86_64-pc-linux-gnu-library/3.4
export R_LIBS="$MYLIB/R:$MYR:/mnt/nfs/user/yangjie/bin/R/lib:$R_LIBS"
# java
export JAVA_HOME=/mnt/nfs/software/share/jre1.8.0_91
export PATH=$JAVA_HOME/bin:/mnt/nfs/user/renqian/bin/novocraft:/mnt/nfs/user/renqian/bin/bin:$PATH
export CLASSPATH=$CLASSPATH:$JAVA_HOME/lib/dt.jar:$JAVA_HOME/lib/tools.jar
export JAVA_OPTS="-Xms256m -Xmx512m -Xss1024K -XX:PermSize=128m -XX:MaxPermSize=256m" 
export export FLUX_MEM="8G"


## PATH
export PATH="/mnt/nfs/software/bin:/mnt/nfs/user/renqian/bin:$PATH"
# add cytoscape
export PATH="/mnt/nfs/user/yangjie/bin/cytoscape/Cytoscape_v3.4.0:$PATH"
# add myscript
#export PATH="/mnt/nfs/user/renqian/pipline:$PATH"
# add RNA simulation
export PATH="/mnt/nfs/user/renqian/bin/RNASeqReadSimulator/src:$PATH"

# added by Anaconda3 4.4.0 installer
export PATH="/mnt/nfs/user/renqian/bin/anaconda3/bin:$PATH"
export PATH="/mnt/nfs/user/renqian/bin:$PATH"
