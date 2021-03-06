export PS1="\[\033[31m\]\u\[\033[m\]@\[\033[32m\]\h:\[\033[33;1m\]\w\[\033[m\]\$ "
export CLICOLOR=1
export LSCOLORS=ExFxBxDxCxegedabagacad

# aliases 
alias brm='rm -rf'
alias bls='ls -lhFoa'
alias bsource='source ~/.bash_profile'
alias bnano='nano ~/.bash_profile'
alias home='cd ~'
alias atom='open -a atom'
alias dev='cd ~/Development'
alias shorten='PS1="\[\033[31m\]\u:\[\033[33;1m\]\W\[\033[m\]\$ "'
alias reload='source ~/.bash_profile'
alias fixaudio='sudo killall coreaudiod'
alias bkill='pkill -9'


# Tmux shortcuts
alias treload='tmux source-file ~/.tmux.conf'
alias tinfo="tmux list-keys"
alias tstart='tmux new -s mysession -n default'
alias twindow='tmux new-window'
alias tls='tmux ls'
alias tsplith='tmux split-window -h'
alias tsplitv='tmux split-window -v'
alias tkillsession='tmux kill-session'
alias trenamewindow='tmux rename-window'
alias trenamesession='tmux rename-session'
alias tkillpane='tmux kill-pane'
alias tkillwindow='tmux kill-window'

# functions
function bmkdir(){
    if [[ $# -eq 0 ]]; then
        echo "Failed, please enter an argument for folder name"
        return
    fi

    mkdir -p $1
    cd $1
}


function create_repo {
    echo "git init"
    echo "curl -u 'maikol88' https://api.github.com/user/repos -d '{'name':'projectname','description':'This project is a test'}'"
    echo "git remote add origin git@github.com:maikol88/projectname.git"
    echo "git push origin master"    
}

function bcreate_repo(){
    if [[ $# -eq 0 ]]; then
	dir_name=${PWD##*/}
        echo -e "\033[35mName of local folder $dir_name will be used as repository name since no arguments were provided \033[0m"
        git init 
        git add -A
        git commit -m "Initialize repo"
        curl -u 'maikol88' https://api.github.com/user/repos -d '{"name":"'$dir_name'","description":"This project is a test"}'
	git remote add origin git@github.com:maikol88/$dir_name.git
	git push origin master
        return
    fi
    
    echo -e "\033[35mAttempting Initalizing repo, adding files, commiting and pushing local repository named\033[0m \033[31m$1\033[0m \033[35mto github\033[0m"	
    git init
    git add -A
    git commit -m "Initialize repo"
    curl -u 'maikol88' https://api.github.com/user/repos -d '{"name":"'$1'","description":"This project is a test"}'
    git remote add origin git@github.com:maikol88/$1.git
    git push -u origin master
    return
}

