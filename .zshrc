# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

export XDG_CONFIG_HOME="${XDG_CONFIG_HOME:-$HOME/.config}"

##################################################
# Android Setup for React Native                 #
# https://reactnative.dev/docs/environment-setup #
##################################################
export ANDROID_HOME=$HOME/Library/Android/sdk
export ANDROID_SDK_ROOT=$HOME/Library/Android/sdk
export PATH=$PATH:$ANDROID_HOME/emulator
export PATH=$PATH:$ANDROID_HOME/tools
export PATH=$PATH:$ANDROID_HOME/tools/bin
export PATH=$PATH:$ANDROID_HOME/platform-tools
######################################
# END Android Setup for React Native #
######################################

export PATH="/usr/local/opt/openssl@1.1/bin:$PATH"
export PATH="/Users/laptop/Development/self/solana/bin:$PATH"

### bit.dev https://bit.dev/docs/quick-start
export PATH=$HOME/bin:$PATH


# Homebrew setup
export PATH="/usr/local/sbin:$PATH"

# # Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"

setopt no_aliases

setopt aliases

# # Single Character Alias (very used)
# ## Show README (requires brew install bat)
alias b="bat"
### Open Code here
alias c="code ."
# ## Download video (requires brew install yt-dlp/taps/yt-dlp)
alias d="yt-dlp --format mp4"
# ## Open the current path in iterm
alias i="open -a iTerm ."
# why the fuck is everythign the same color
# maybe I should stop doing that but I should also stop cluttering my ~/.zshrc
# Challenge: how many times can you type the different absoulte path to the fucking file you're sitting in jesus christ. Where am I anymore in these things. It used to be so simple just with home and desktop and whatnot and then we learned how to program and all the files we work with got invisible and / or hard to find. What about us old fucks that started with computers when we were first born? Or like, pretty close to it. I know i should end my rant but maybe my compiler should remove any lines over ... IDK how long this line is because Visual Code is so lightweight it doesn't ecen tell me. Webstorm does and that's why I like it better. HMPH. I'm old but fuck you anyway! GET OFF MY YARN

# ## copy output of trailing command to pasteboard
alias m="bat README.md"
alias o="open ."
alias p="bat package.json"
alias v="/usr/local/bin/n"
alias w="webstorm ."
alias z="code ~/.zshrc"

# # Double Character Alias (less very used)
# ## Reload this file in current shell so you can use your changes
alias sz="source ~/.zshrc"
alias ws="webstorm"

# ### itermocil aliases (to easily edit itermocil configuration)
alias iw="code ~/.itermocil/work.yml"

# # Triple Character Alias (meh kinda used)
alias nrs="npm run start"

## Word Aliases
alias work="itermocil work"
alias case="itermocil case"

### Open vscode and run tests on file changes for Rust projects
alias book="code . && cargo watch --clear -x  'test -- --nocapture'"

set -o vi

# #########
# # TODOs git appropriate gitignore at root newPlayground should take project type and project name expo ✅ react
# # Move these functions to a more organized place.
# # nextjs swiftui swiftui + composable architecture organize folders expo
# # |_expo project 1 _expo project 2
# # react
# # |react project 1 react project 2
# #########
# newExpoPlayground <project-name>
newExpoPlayground() {
    readonly projectName=${1:?"Project name must be specified."}
    cd ~/Development/PLAYGROUND
    expo init "$projectName"
    cd "$projectName"
    code .
    yarn ios
}

function pb() {
    eval "$1" | pbcopy
}


# NNN Config
## NNN bookmarks <key>:<path>;
export NNN_BMS='w:/Users/laptop/Development/Work/Code/web-heloc;m:/Users/laptop/Library/Mobile Documents/com~apple~CloudDocs/Media;d:~/Desktop;D:~/Downloads/;i:/Users/laptop/Library/Mobile Documents/com~apple~CloudDocs'
## NNN live preview
export NNN_FIFO=/tmp/nnn.fifo
export NNN_PLUG='t:preview-tui' 

# https://github.com/jarun/nnn/wiki/Basic-use-cases#configure-cd-on-quit
n() {
    # Block nesting of nnn in subshells
    # if [ -n $NNNLVL ] && [ "${NNNLVL:-0}" -ge 1 ]; then
    #     echo "nnn is already running"
    #     return
    # fi

    # The behaviour is set to cd on quit (nnn checks if NNN_TMPFILE is set)
    # To cd on quit only on ^G, either remove the "export" as in:
    #    NNN_TMPFILE="${XDG_CONFIG_HOME:-$HOME/.config}/nnn/.lastd"
    #    (or, to a custom path: NNN_TMPFILE=/tmp/.lastd)
    # or, export NNN_TMPFILE after nnn invocation
    export NNN_TMPFILE="${XDG_CONFIG_HOME:-$HOME/.config}/nnn/.lastd"

    # Unmask ^Q (, ^V etc.) (if required, see `stty -a`) to Quit nnn
    # stty start undef
    # stty stop undef
    # stty lwrap undef
    # stty lnext undef

    nnn "$@"

    if [ -f "$NNN_TMPFILE" ]; then
        . "$NNN_TMPFILE"
        rm -f "$NNN_TMPFILE" >/dev/null
    fi
}
source /usr/local/opt/powerlevel10k/powerlevel10k.zsh-theme

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# https://github.com/TomAnthony/itermocil#zsh-autocompletion
# To get autocompletion when typing itermocil <Tab> in a zsh session, add this line to your ~/.zshrc file:
compctl -g '~/.itermocil/*(:t:r)' itermocil

# from https://enoemos.notion.site/Solana-s-Token-Program-Explained-by-Matt-Lim-Medium-45facb90bca94cef87c95eb9d77409e5

# ## History Preservation
## TAKE 1

# SAVEHIST=10000 # Number of entries
# HISTSIZE=10000
# HISTFILE=~/.zsh/history # File
# setopt APPEND_HISTORY # Don't erase history
# setopt EXTENDED_HISTORY # Add additional data to history like timestamp
# setopt INC_APPEND_HISTORY # Add immediately
# setopt HIST_FIND_NO_DUPS # Don't show duplicates in search
# setopt HIST_IGNORE_SPACE # Don't preserve spaces. You may want to turn it off
# setopt NO_HIST_BEEP # Don't beep
# setopt SHARE_HISTORY # Share history between session/terminals
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# fd - cd to selected directory
f() {
    local dir
    dir=$(find ${1:-.} -path '*/\.*' -prune \
        -o -type d -print 2> /dev/null | fzf +m) &&
    cd "$dir"
}

# fh - search in your command history and execute selected command
h() {
    eval $( ([ -n "$ZSH_NAME" ] && fc -l 1 || history) | fzf +s --tac | sed 's/ *[0-9]* *//')
}
