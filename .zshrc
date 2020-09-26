# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

ZSH=$HOME/.oh-my-zsh

# You can change the theme with another one:
#   https://github.com/robbyrussell/oh-my-zsh/wiki/themes
ZSH_THEME="powerlevel10k/powerlevel10k"
SPACESHIP_DIR_TRUNC=2

# Useful plugins for Rails development with Sublime Text
plugins=(git gitfast last-working-dir common-aliases zsh-syntax-highlighting history-substring-search zsh-autosuggestions fzf)

# Prevent Homebrew from reporting - https://github.com/Homebrew/brew/blob/master/share/doc/homebrew/Analytics.md
export HOMEBREW_NO_ANALYTICS=1

# Actually load Oh-My-Zsh
source "${ZSH}/oh-my-zsh.sh"
unalias rm # No interactive rm by default (brought by plugins/common-aliases)

# Load rbenv if installed
export PATH="${HOME}/.rbenv/bin:${PATH}"
type -a rbenv > /dev/null && eval "$(rbenv init -)"

# Rails and Ruby uses the local `bin` folder to store binstubs.
# So instead of running `bin/rails` like the doc says, just run `rails`
# Same for `./node_modules/.bin` and nodejs
export PATH="./bin:./node_modules/.bin:${PATH}:/usr/local/sbin"

# Store your own aliases in the ~/.aliases file and load the here.
[[ -f "$HOME/.aliases" ]] && source "$HOME/.aliases"

export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8
fpath=($fpath "/home/sensanaty/.zfunctions")
export LD_LIBRARY_PATH=:/usr/local/lib:/user/local/lib

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

export PROJECTS="/home/sensanaty/Code/Projects"
source ${HOME}/.zplug/init.zsh
zplug "wfxr/forgit"
zplug load
alias lc='colorls -A --sd'
alias peek='peek -b ffmpeg & disown'
alias prjct='cd $PROJECTS'

svelte() {
    npx degit sensanaty/svelte-scss-template "$1"
}

alias setup-tb='gh repo clone TableVibe/tablevibes-backend && gh repo clone TableVibe/client-ui && gh repo clone TableVibe/admin-ui && gh repo clone TableVibe/review-ui'
