# development

default_domain="http://localhost" # set as your site's domain
alias 80="chrome $default_domain"
alias cra="npx create-react-app"
# shellcheck disable=SC2139
alias ip="ifconfig -a|grep inet|grep -v 127.0.0.1|grep -v inet6|awk '{print $2}'"
alias smp="ssh ubuntu@192.168.0.199"
alias i-cnpm="npm install -g cnpm --registry=https://registry.npmmirror.com"
