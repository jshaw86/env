export PATH="\$HOME/.local/bin:\$HOME/miniconda3/bin:\$HOME/tools/lua-language-server/bin/macOS:\$GOPATH/bin:/usr/local/bin:\$PATH:\$HOME/bin:\$HOME/pear/bin:node_modules/.bin:\$HOME/node_modules/.bin:\$HOME/gradle/bin:\$HOME/terraform:\$HOME/workspace/go/bin:\$HOME/.rvm/bin"

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
