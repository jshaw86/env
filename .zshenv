export PATH=$GOPATH/bin:/usr/local/Cellar/gcc/5.2.0/bin:/usr/local/opt/openssl/bin:/usr/local/opt/curl/bin:/usr/local/opt/openssl/bin:/usr/local/bin:$PATH:/usr/local/Cellar/mysql/5.5.24/bin:/usr/local/sbin:/usr/share:/var/lib/gems/1.8/bin:$HOME/bin:$HOME/pear/bin:node_modules/.bin:$HOME/node_modules/.bin:/Developer/usr/bin:$PORTAL_PATH/bin:$HOME/.venvburrito/bin:$HOME/node_modules/bin:$HOME/gradle/bin:$HOME/terraform:$HOME/workspace/go/bin:$HOME/.rvm/bin

export GOOGLE_APPLICATION_CREDENTIALS="/Users/jordan/.gcp/terraform-credentials.json"
export IGNITE_HOME="$HOME/ignite"

# travis ci access token
export DOCKER_USERNAME=''
export DOCKER_PASSWORD=''

# Terraform Creds/Vars here, prefix with TF_VAR

# PIP Creds here
export PIP_USERNAME=''
export PIP_PASSWORD=''
export PIP_INSTALL_CREDENTIALS='<username>:<password>'
export PIP_UPLOAD_CREDENTIALS='<username>:<password>'

# NPM Creds here
export NPM_INSTALL_CREDENTIALS='<username>:<password>'

export PROD_K8S=""
export DEVEL_K8S=""
export QA_K8S=""
