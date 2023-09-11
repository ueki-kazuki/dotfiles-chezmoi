## peco
function peco-select-history() {
    BUFFER=$(history -n -r 1 | peco --layout=bottom-up --query "$LBUFFER")
    CURSOR=$#BUFFER
    zle reset-prompt
}
zle -N peco-select-history
bindkey '^r' peco-select-history
