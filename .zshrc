autoload -U colors
colors
bindkey -v
setopt PROMPT_SUBST
fpath=(~/.zsh/functions $fpath)
autoload -U ~/.zsh/functions/*(:t)
# Enable auto-execution of functions.
typeset -ga preexec_functions
typeset -ga precmd_functions
typeset -ga chpwd_functions
# Append git functions needed for prompt.
preexec_functions+='preexec_update_git_vars'
precmd_functions+='precmd_update_git_vars'
chpwd_functions+='chpwd_update_git_vars'


export ANDROID_NDK_ROOT=~/Development/sdk/android-ndk/android-ndk-r9
export ANDROID_SDK_ROOT=~/Development/sdk/android-sdk-macosx
#macports path export PATH=$ANDROID_SDK_ROOT:$ANDROID_SDK_ROOT/platform-tools:/opt/local/bin:/opt/local/sbin:$ANDROID_NDK_ROOT:$PATH
export PATH=/usr/local/bin:/usr/local/sbin:$ANDROID_SDK_ROOT:$ANDROID_SDK_ROOT/tools:$ANDROID_SDK_ROOT/platform-tools:$ANDROID_NDK_ROOT:$PATH
export NUMBER_OF_PROCESSORS=8
export LC_COLLATE=C
export GREP_OPTIONS='--color=auto'
export HISTIGNORE="&:ls:[bf]g:exit"

alias lynx='lynx -vikeys'
alias ls='ls -G'
alias mysqlstart='sudo /opt/local/bin/mysqld_safe5 &'
alias mysqlstop='/opt/local/bin/mysqladmin5 -u root -p shutdown'
alias deploystage='fab stage deploy; fab stage sighup_app'
#alias vim='/Applications/MacPorts/MacVim.app/Contents/MacOS/Vim'
alias lolcat='$ANDROID_SDK_ROOT/platform-tools/adb lolcat -c; $ANDROID_SDK_ROOT/platform-tools/adb lolcat' 

if [ -f $(which virtualenvwrapper.sh) ]; then
   source $(which virtualenvwrapper.sh)
fi

PROMPT=$'
┌[%{${fg[white]}%}%B%~%b]$(prompt_git_info)%{${fg[default]}%}
└» '
