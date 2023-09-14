# ███████╗██╗███████╗██╗  ██╗
# ██╔════╝██║██╔════╝██║  ██║
# █████╗  ██║███████╗███████║
# ██╔══╝  ██║╚════██║██╔══██║
# ██║     ██║███████║██║  ██║
# ╚═╝     ╚═╝╚══════╝╚═╝  ╚═╝
# A smart and user-friendly command line
# https://fishshell.com/
# https://github.com/joshmedeski/dotfiles/blob/main/.config/fish/config.fish
                           

# >>> setting >>>
set -U fish_greeting # disable fish greeting
set -U fish_key_bindings fish_vi_key_bindings
set -U LANG en_US.UTF-8
set -U LC_ALL en_US.UTF-8

set -gx COLORTERM truecolor
set -Ux EDITOR nvim 

set -g theme_title_display_process yes
set -g theme_title_display_path yes
set -g theme_title_display_user yes
set -g theme_title_use_abbreviated_path yes

set -gx LDFLAGS "-L/opt/homebrew/opt/llvm/lib"
set -gx CPPFLAGS "-I/opt/homebrew/opt/llvm/include"
set -gx GOPATH "/Users/quangtuongphung/myDev/Go_DesignPattern"
# <<< setting <<<

# >>> abbreviation >>>
# https://fishshell.com/docs/current/cmds/abbr.html
abbr bi "brew install"
abbr gt "lvim +GoToFile"

# alias 
alias nvim lvim
alias ls "ls -p -G -al"
alias la "ls -A"
alias lla "ll -A"

# exa shortcut
if type -q exa 
	alias ll "exa -l -g --icons"
	alias lla "ll -a"
end 
# <<< abbreviation <<<

# >>> Start Up >>>
zoxide init fish | source
starship init fish | source

# >>> Add to $PATH >>>
fish_add_path /opt/homebrew/bin # https://brew.sh/
fish_add_path /opt/homebrew/sbin
fish_add_path /usr/local/bin

fish_add_path /Users/quangtuongphung/mambaforge/bin
fish_add_path /Users/quangtuongphung/.local/bin
fish_add_path /Users/quangtuongphung/.config/tmux/plugins/t-smart-tmux-session-manager/bin  

fish_add_path /opt/homebrew/opt/llvm/bin
fish_add_path /usr/local/go/bin

fish_add_path /Applications/Julia-1.9.app/Contents/Resources/julia/bin/julia
fish_add_path ~/.config/bin
# <<< Start Up <<<

eval (/opt/homebrew/bin/brew shellenv)

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
if test -f /Users/quangtuongphung/mambaforge/bin/conda
    eval /Users/quangtuongphung/mambaforge/bin/conda "shell.fish" "hook" $argv | source
end

if test -f "/Users/quangtuongphung/mambaforge/etc/fish/conf.d/mamba.fish"
    source "/Users/quangtuongphung/mambaforge/etc/fish/conf.d/mamba.fish"
end
# <<< conda initialize <<<

