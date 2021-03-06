# ~/.profile: executed by the command interpreter for login shells.
# This file is not read by bash(1), if ~/.bash_profile or ~/.bash_login
# exists.
# see /usr/share/doc/bash/examples/startup-files for examples.
# the files are located in the bash-doc package.

# the default umask is set in /etc/profile; for setting the umask
# for ssh logins, install and configure the libpam-umask package.
#umask 022

# if running bash
if [ -n "$BASH_VERSION" ]; then
    # include .bashrc if it exists
    if [ -f "$HOME/.bashrc" ]; then
	. "$HOME/.bashrc"
    fi
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ] ; then
    PATH="$HOME/bin:$PATH"
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/.local/bin" ] ; then
    PATH="$HOME/.local/bin:$PATH"
fi

# Go
# export GOROOT
export GO111MODULE=auto
export GOPATH=$HOME/.go
export PATH=$GOPATH/bin:$PATH

# Rust  
export PATH="$HOME/.cargo/bin:$PATH"

# CUDA
export PATH=/usr/local/cuda/bin:$PATH

. $HOME/.asdf/asdf.sh
. $HOME/.asdf/completions/asdf.bash

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# FFMPEG
alias ffmpeg='${HOME}/build/encoder/ffmpeg/ffmpeg'

## INFOSEC
# Metasploit msfvenum Docker
alias msfvenom='echo remember to save to -o /data/something ; docker run --rm -it -v "${HOME}/.msf:/home/msf/" -v "${PWD}:/data" metasploitframework/metasploit-framework ./msfvenom'
# URL encode/decode
alias urldecode='python -c "import sys, urllib.parse as ul; \
	print(ul.unquote_plus(sys.argv[1]))"'
alias urlencode='python -c "import sys, urllib.parse as ul; \
	print(ul.quote_plus(sys.argv[1]))"'

if [ -d "$HOME/.local/bin" ] ; then
    PATH="$HOME/.local/bin:$PATH"
fi

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$SDKMAN_DIR/bin/sdkman-init.sh" ]] && source "$SDKMAN_DIR/bin/sdkman-init.sh"

# Wasmer
export WASMER_DIR="$HOME/.wasmer"
[ -s "$WASMER_DIR/wasmer.sh" ] && source "$WASMER_DIR/wasmer.sh"
