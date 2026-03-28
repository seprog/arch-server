# ls => eza
alias ls  'eza      --color=auto --icons --group-directories-first'               # default
alias la  'eza -a   --color=auto --icons --group-directories-first'               # hidden
alias ll  'eza -l   --color=auto --icons --group-directories-first --total-size'  # long
alias lla 'eza -la  --color=auto --icons --group-directories-first --total-size'  # long, hidden
alias lt  'eza -laT --color=auto --icons --group-directories-first --total-size'  # long, hidden, tree

# cat => bat
alias cat 'bat --style full'

# colorize commands
alias pacman 'pacman --color=auto'
alias paru   'paru   --color=auto'
alias grep   'grep   --color=auto'
alias ip     'ip     --color=auto'
