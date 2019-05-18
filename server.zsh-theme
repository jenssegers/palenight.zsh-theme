# Oh-my-zsh theme by Jens Segers (jenssegers.com)
# https://github.com/jenssegers/zsh

function get_pwd() {
    print -D $PWD
}

function git_prompt_info() {
    ref=$(git symbolic-ref HEAD 2> /dev/null) || return
    echo "$fg[white] on $(parse_git_dirty)$ZSH_THEME_GIT_PROMPT_PREFIX$(current_branch)$ZSH_THEME_GIT_PROMPT_SUFFIX"
}

function precmd() {
    print -rP '
$fg[cyan]%n@%m: $fg[yellow]$(get_pwd)$(git_prompt_info)'
}

PROMPT='%{$reset_color%}➜  '

ZSH_THEME_GIT_PROMPT_PREFIX=""
ZSH_THEME_GIT_PROMPT_SUFFIX="$reset_color"
ZSH_THEME_GIT_PROMPT_DIRTY="$fg[red]"
ZSH_THEME_GIT_PROMPT_CLEAN="$fg[green]"
