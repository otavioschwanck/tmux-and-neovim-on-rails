Config to work with Rails using Neovim and Tmux based on Doom Emacs.

# Dependencies
- Tmux
- Neovim
- Ag
- Lazygit
- Silversearcher (ag)
- Node (for autocomplete)
- Fzf

# Installation (Ubuntu)

Here is the commands used to install this configuration on your system.

### Install dependencies

```
sudo add-apt-repository ppa:lazygit-team/release
sudo apt-get update
sudo apt-get install lazygit silversearcher-ag tmux neovim xclip python-pip

git clone https://github.com/otavioschwanck/tmux-and-neovim-on-rails.git ~/.config/nvim/
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

nvim +PlugInstall

```

# Getting Started

Just go to your project folder, run `tmux` and `nvim`.  Then, press `SPACE ENTER ENTER` to create
3 tmux windows (for console, server and rspec).

After this, have an nice work!

# MUST KNOW COMMANDS

## Basic

| Command | Description |
|-------|-----|
SPC SPC | Find a file |
| SPC s p | Search on project |
| SPC s P | Search on project and edit occurrences |
| SPC r r | Run rails console |
| SPC r R | Run rails server |
| SPC gg | Run lazygit (i really miss magit =C) |
| C-SPC | Switch buffer |
| C-e | Nerdtree find |
| C-Tabv | Nerdtree Toggle |

## Editing

| Command | Description |
|-------|--------|
| C-h | Swap args to left |
| C-l | Swap args to right |
| C-n | Start multiple cursors |
| C-a | Toggle Switch (change from symbols to stgring, do end, etc) |
| gS | Toggle into multiple lines |
| gJ | Toggle into single line (on the first line) |

## Rails Stuff

| Command | Description |
|-------|--------|
| SPC ru | Go to Fixtures  |
| SPC rh | Go to Helper  |
| SPC ri | Go to Initializer  |
| SPC rl | Go to Locale  |
| SPC r | Go to@Emailer  |
| SPC rn | Go to Migration  |
| SPC rm | Go to Model  |
| SPC ra | Go to Admin  |
| SPC re | Go to Cell |
| SPC rt | Go to Spec  |
| SPC ry | Go to Stylesheet  |
| SPC rk | Go to Task  |
| SPC rv | Go to View  |

## Rspec

| Command | Description |
|-------|--------|
| SPC tv | Run Current File |
| SPC ts | Run Nearest test |
| SPC tr | Run Last Test |
| SPC ta | Run All tests |
| SPC a | Go to Test |
| SPC A | Go to Test in split |

## Tmux Navigation

See more: https://www.youtube.com/watch?v=NZO8KjNbwJk

| Command | Description |
|-------|--------|
| C-s (On Vim, in visual mode) | Send selected text to rails console |
| C-a 1,2,3,4 | Switch tmux window |
| C-a w | View and tmux windows |
| C-a c | Create new tmux window |
| pkill -f tmux | Kill all tmux sessions |
| tmux a | Return to a closed tmux session |

