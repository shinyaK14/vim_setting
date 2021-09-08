export PATH=~/.local/bin:$PATH


alias ssh='sshrc'
alias gitm='git mergetool -t vimdiff'
alias datastore='gcloud beta emulators datastore start --host-port localhost:8444'
alias rm_orig="find ./ -name '*.orig' | xargs rm"
alias dc_mongo="docker run -it --rm -p 27017:27017 mongo:4.0.3 mongod --bind_ip 0.0.0.0"
alias cityz_restore="mongorestore -h 127.0.0.1:27017 -d cityz ./dump/cityz"
# alias ssh_prod="ssh ec2-user@ecs-instance1.production"
alias ssh_prod="ssh ec2-user@10.0.150.30"
alias ssh_staging="ssh ec2-user@10.1.132.221"

# added by travis gem
[ -f /Users/shinya/.travis/travis.sh ] && source /Users/shinya/.travis/travis.sh

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
# source /Users/shinya/perl5/perlbrew/etc/bashrc
