
#------------------------------------------------------------------------------------------------
# OS”»’è—p‚ÌŠÂ‹«•Ï”Ý’è
#------------------------------------------------------------------------------------------------
export OS_BASH_ON_WINDOWS="BashOnWindows"
export OS_LINUX="Linux"
export OS_WINDOWS="MINGW"

# Bash on Ubuntu on Windows
if [ "$(expr substr $(uname -s) 1 5)" == "${OS_LINUX}" ] && [ -d "/mnt/c/Users" ]; then
  export OS="${OS_BASH_ON_WINDOWS}"
  export WINUSERDIR="/mnt/c/Users"
  export WINHOME="${WINUSERDIR}/${USER}"
elif [ "$(expr substr $(uname -s) 1 5)" == "${OS_LINUX}" ]; then
  export OS="${OS_LINUX}"
elif [ "$(expr substr $(uname -s) 1 5)" == "${OS_WINDOWS}" ]; then
  export OS="${OS_WINDOWS}"
fi
#------------------------------------------------------------------------------------------------


#------------------------------------------------------------------------------------------------
# ŠÂ‹«•Ï”‚ÌÝ’è
#------------------------------------------------------------------------------------------------
if [ "${OS}" == "${OS_BASH_ON_WINDOWS}" ]; then
  export GOOGLE_DRIVE="${WINHOME}/GoogleDrive"
else
  export GOOGLE_DRIVE="${HOME}/GoogleDrive"
fi

export DOTFILES="${GOOGLE_DRIVE}/dotfiles"
export MY_BIN="${GOOGLE_DRIVE}/bin"
export MY_CONF="${GOOGLE_DRIVE}/etc/my_conf"
export PATH=$PATH:${MY_BIN}

#. ${MY_CONF}

[[ -f ${DOTFILES}/.aliases ]] && . ${DOTFILES}/.aliases || echo "Not Found ${DOTFILES}/.aliases"
[[ -f ${DOTFILES}/.bash_aliases ]] && . ${DOTFILES}/.bash_aliases
[[ -f ${DOTFILES}/.zshrc ]] && . ${DOTFILES}/.zshrc
[[ -f /etc/bashrc ]] && . /etc/bashrc

#------------------------------------------------------------------------------------------------


#------------------------------------------------------------------------------------------------
# SSHÝ’è
#------------------------------------------------------------------------------------------------
SSH_ENVIRONMENT="${HOME}/.ssh/environment"

init_ssh_agent(){
  echo "Initiazetion ssh-agent ..."
  eval `ssh-agent -s`
  echo "SSH_AUTH_SOCK='${SSH_AUTH_SOCK}'" > ${SSH_ENVIRONMENT}
  echo "SSH_AGENT_PID=${SSH_AGENT_PID}" >> ${SSH_ENVIRONMENT}
}

kill_ssh_agent(){
  ps axu | grep ssh-agent | awk '{print $1;}' | xargs kill 1>/dev/null 2>/dev/null
}

if [ "$(ps ax | grep ssh-agent | grep -v grep)" = "" ]; then
  init_ssh_agent
else
  if [ ! -f ${SSH_ENVIRONMENT} ]; then
    echo "ssh-agent init failed ... ${SSH_ENVIRONMENT} not found "
    kill_ssh_agent
    init_ssh_agent
  else
    source ${SSH_ENVIRONMENT}
    export SSH_AUTH_SOCK
    export SSH_AGENT_PID
  fi
fi
ls -1d ~/.ssh/* | egrep -v '*.pub|known_hosts|config' | grep rsa | xargs ssh-add 1>/dev/null  2>/dev/null

#------------------------------------------------------------------------------------------------


#------------------------------------------------------------------------------------------------
# RubyÝ’è
#------------------------------------------------------------------------------------------------
export RBENV_ROOT="${HOME}/.rbenv"
if [ -d "${RBENV_ROOT}" ]; then
  export PATH="${RBENV_ROOT}/bin:${PATH}"
  eval "$(rbenv init -)"
fi
#------------------------------------------------------------------------------------------------



u=$(whoami)
o=$(uname -s)
d=$(date "+%Y/%m/%d %H:%M:%S")
echo "Hey! ${u}"
echo "Operating System : ${o}"
echo "Login Time       : ${d}"

function tree () {
cd $1
pwd;find . | sort | sed '1d;s/^\.//;s/\/\([^/]*\)$/|--\1/;s/\/[^/|]*/|  /g' 2>/dev/null
cd -
}
