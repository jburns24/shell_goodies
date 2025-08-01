# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Activate jenv for java runtime managment
# To add a new version of java to jenv run the following command
# brew install <java-formulae>
# jenv add $(brew --prefix <java-formulae>)/libexec/openjdk.jdk/Contents/Home
export PATH="$HOME/.jenv/bin:$PATH"
eval "$(jenv init -)"

# Adding gopath to path
export PATH=$PATH:$(go env GOPATH)/bin

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="robbyrussell"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment one of the following lines to change the auto-update behavior
# zstyle ':omz:update' mode disabled  # disable automatic updates
# zstyle ':omz:update' mode auto      # update automatically without asking
# zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Uncomment the following line to change how often to auto-update (in days).
# zstyle ':omz:update' frequency 13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
    colored-man-pages
    colorize
    history-substring-search
    z
    zsh-autosuggestions
)

source $ZSH/oh-my-zsh.sh

# User configuration

# jump Z configuration START
# https://github.com/agkozak/zsh-z?tab=readme-ov-file#zshz_uncommon
export ZSHZ_UNCOMMON=1
# jump Z configuration END


# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

## fzf history command START
# reads and writes all calls to history file (gives shared terminal history)
setopt share_history

fzf_hostory_exec() {
    local cmd
    # cmd=$(history | fzf | awk '{$1=""; print substr($0,2)}') # Remove the first column (number)
    cmd=$(history | awk '{$1=""; print $0}' | sort | uniq | fzf) # Remove the first column (number)
    if [ -n "$cmd" ]; then
        printf '%s' "$cmd"
    fi
}

fzf_insert_history() {
    LBUFFER+=$(fzf_hostory_exec)
}
zle -N fzf_insert_history
bindkey '^R' fzf_insert_history
## fzf history command END

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
alias zshconfig="code ~/.zshrc"
# alias cat="bat "
alias ohmyzsh="code ~/.oh-my-zsh"
alias av-sandbox="aws-vault exec dev-sandbox -- "
alias av-sandbox-admin="aws-vault exec admin-sandbox -- "
alias av-infosec="aws-vault exec liatrio-infosec -- "
alias av-nonprod="aws-vault exec liatrio-nonprod-admin -- "
alias av-prod="aws-vault exec liatrio-prod-admin -- "
alias av-shrdsvc="aws-vault exec liatrio-shared-svc-admin -- "
alias aws-kubectl="av-sandbox kubectl"
alias lsl="ls -l"
alias tf="terraform "
alias tg="terragrunt "
alias k8="kubectl "
alias amdOverrides="echo -e \"\033[33mWARNING! Path modified to prefer x86 binaries\033[0m\";export PATH='/Users/jburns/amd-bin:$PATH'"
alias k="kubectl "
alias edge="open -a 'Microsoft Edge' "
alias azpersonal="az account set --subscription \"e4a6dc16-366f-4052-948b-5766f542b1ac\""
alias azmpn="az account set --subscription \"2664d1ed-938a-436c-8948-26ec6b3bed62\""
alias az-sandbox="az account set --subscription \"3e16852e-8399-4c16-b246-16bf46bc3747\""
alias homelab-k8s-config="unset KUBECONFIG;export KUBECONFIG=~/.kube/homelab.yaml"
alias cat="bat"

# must call `history 1` b/c the `history` command behaves differently in zsh vs bash
# https://stackoverflow.com/a/26848769
alias history="history 1"

# Homebrew or the Arch Linux package managers makes fabric available as fabric-ai ref:https://github.com/danielmiessler/fabric/blob/50ec02546f7f7590c437c0eea2bbed2d0fc84eae/README.md#using-package-managers
alias fabric='fabric-ai'


# FABRIC AI start 
# Set alias for the youtube tool that ships with fabric-ai
# Loop through all files in the ~/.config/fabric/patterns directory
for pattern_file in $HOME/.config/fabric/patterns/*; do
    # Get the base name of the file (i.e., remove the directory path)
    pattern_name=$(basename "$pattern_file")

    # Create an alias in the form: alias pattern_name="fabric --pattern pattern_name"
    alias_command="alias $pattern_name='fabric --pattern $pattern_name'"

    # Evaluate the alias command to add it to the current shell
    eval "$alias_command"
done

yt() {
    if [ "$#" -eq 0 ] || [ "$#" -gt 2 ]; then
        echo "Usage: yt [-t | --timestamps] youtube-link"
        echo "Use the '-t' flag to get the transcript with timestamps."
        return 1
    fi

    transcript_flag="--transcript"
    if [ "$1" = "-t" ] || [ "$1" = "--timestamps" ]; then
        transcript_flag="--transcript-with-timestamps"
        shift
    fi
    local video_link="$1"
    fabric -y "$video_link" $transcript_flag
}

## FABRIC AI end

# nvm START
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
# nvm END

# history-substring-search START
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down

# bun completions
[ -s "/Users/jburns/.bun/_bun" ] && source "/Users/jburns/.bun/_bun"

# Set history limit
export HISTSIZE=20000

# Enable kubectl tab completion
source <(kubectl completion zsh)

source <(/Users/jburns/.kpv3-cli/bin/kpv3-cli source)
if ! [ -s /Users/jburns/.kpv3-cli/consent.yaml ]; then
    kpv3-cli consent
fi
if ! [ -s /Users/jburns/.kube/k8s-platform-v3 ]; then
    kpv3-cli kubeconfig -w
fi
. "/Users/jburns/.deno/env"

# Added by Windsurf
export PATH="/Users/jburns/.codeium/windsurf/bin:$PATH"

# Function to get the current Kubernetes context
get_k8s_control_plane() {
  if command -v kubectl >/dev/null 2>&1; then
    server=$(kubectl cluster-info 2>/dev/null | \
             grep 'Kubernetes control plane' | \
             awk '{print $NF}')
    if [[ -n $server ]]; then
      echo "CP: ${server}"
    fi
  fi
}

# PROMPT="%(?:%{$fg_bold[green]%}%1{➜%} :%{$fg_bold[red]%}%1{➜%} ) %{$fg[cyan]%}%c%{$reset_color%}"
# PROMPT+=' $(git_prompt_info)'
# PROMPT="%(?:%{$fg_bold[green]%}%1{➜%} :%{$fg_bold[red]%}%1{➜%} ) \
# %{$fg[cyan]%}%c \
# $(git_prompt_info) \
# \$(get_k8s_control_plane) %{$reset_color%}"

. "$HOME/.local/bin/env"

# Task Master aliases added on 7/12/2025
alias tm='task-master'
alias taskmaster='task-master'
