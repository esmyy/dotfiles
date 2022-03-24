# others alias
alias addr="echo $(ifconfig| grep broadcast | awk -Finet '{print $2}' | awk -Fnetmask '{print $1}' | sed 's/[ ]//g')"
alias pi="echo $(addr)"
alias copyip="echo $(addr) | pbcopy"
alias cip="echo $(addr) | pbcopy"
