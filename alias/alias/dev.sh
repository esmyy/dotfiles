# development

DEV_HOST="http://localhost" # set as your local dev host, such as local.mayueyue.com
alias 80="chrome $DEV_HOST"
# shellcheck disable=SC2139
alias ip="ifconfig -a|grep inet|grep -v 127.0.0.1|grep -v inet6|awk '{print $2}'"
alias smp="ssh ubuntu@192.168.0.199"
alias conf="nginx -V 2>&1 | awk -F ': ' '{print $2}' | awk -F '--' '{for(i=1;i<=NF;i++) print $i}'  | grep 'conf-path' | cut -d'=' -f2"
alias i-cnpm="npm install -g cnpm --registry=https://registry.npmmirror.com"

# git config
alias lg="git config user.email fengpeng213@gmail.com && git config user.name fengpeng"
alias name="git config user.name"
alias email="git config user.email"
