#set editing-mode vi
alias telnet='/C/Windows/System32/telnet.exe'
alias ll='ls -al'
alias dir='ls'
alias ps=powershell
PROMPT_COMMAND='history -a ~/.bash_history'

function gf(){
    powershell -command "gf $@"
}

function gfc(){
    powershell -command "gfc $@"
}

function bs(){
    powershell -command "bs $@"
}

function c7(){
    cd /f/Projects/ecs7
}

function p(){
    powershell -command "p"
}

function vim(){
    powershell -command "vim $@"
}

function msbuild(){
    powershell -command "msbuild $@"
}

function bd(){
    powershell -command "bd $@"
}

function br(){
    powershell -command "br $@"
}

function np(){
    powershell -command "np $@"
}

alias vi=vim
