# MacOS Setup 

  <p align="center">
    This is my development environment working on MACOS M1
    <br>
    <a href="https://reponame/issues/new?template=bug.md">Report bug</a>
  </p>
</p>

## Table of contents

- [Quick start](#quick-start)
  - [Installing and managing packages via Homebrew](###Installing-and-managing-packages-via-Homebrew)
    - [Install packages with HomeBrew](###Install-packages-with-Homebrew)
  - [Basic Configuration](###Basic-configuration)
  - [Cloning My Configuration](###Cloning-my-configuration)
- [What's included](#whats-included)
  - [Kitty](#Kitty-conf)
  - [Starship](#Starship-conf)
  - [Fish](#whats-included)
  - [LunarVim](#whats-included)
  - [What's included](#whats-included)
  - [What's included](#whats-included)



## Quick start

### A. Installing and managing packages via Homebrew 
Using [Homebrew](https://brew.sh/) to install/cask packages: 

```bash 
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```
#### Install packages with Homebrew:
   * install [npm](https://docs.npmjs.com/downloading-and-installing-node-js-and-npm) - Js runtime environment Nodejs
   * install [neovim]() - My favorite editor 
   * install [git]() - If you know, you know
   * install [kitty](https://sw.kovidgoyal.net/kitty/quickstart/) - My current favorite terminal beside of Alacritty
   * install [fish shell](https://fishshell.com/docs/current/) - My Love <3
   * install [tree]() - listing directory as hierachy
   * install [stow]() - Create symbolic links from .dotfiles 
   * install [tmux]() - If you know, you know
   * install [openshh]() - ssh-key api(s)
```bash 
brew install npm neovim kitty git fish tree stow startship tmux openssh
```
### B. Basic configuration  
1. Set fish shell as default
```bash 
echo /opt/homebrew/bin/fish | sudo tee -a /etc/shells
chsh -s /opt/homebrew/bin/fish 
```

2. Do magic for the "source" command working on fishshell with "bass"
```bash 
# install fisher plugin's manager
curl -sL 
https://raw.githubusercontent.com/jorgebucaran/fisher/main/functions/fisher.fish | source && fisher install jorgebucaran/fisher

#install bass via fisher 
fisher install edc/bass
```

2. [Resolving eaccess permission](https://docs.npmjs.com/resolving-eacces-permissions-errors-when-installing-packages-globally)
```npm install -g npm neovim ```

3. Install [Rustup](https://www.rust-lang.org/tools/install)
```bash 
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
```
4. Install font: 
[Nerdfont](https://www.nerdfonts.com/font-downloads)

To get full list of supported fonts on kitty terminal \
@hint: load fonts by font Book app 
```bash 
kitty +list-fonts
```

5. Install [LunarVim](https://www.lunarvim.org/docs/installation/post-install)
```bash
LV_BRANCH='release-1.3/neovim-0.9' bash <(curl -s https://raw.githubusercontent.com/LunarVim/LunarVim/release-1.3/neovim-0.9/utils/installer/install.sh)
```

### C. Cloning my configuration:
```bash
git clone https://touphung@bitbucket.org/dev-sandbox101/.dotfiles-macos.git
```

- Create symbolic links with [Stow](https://alexpearce.me/2016/02/managing-dotfiles-with-stow/)
```bash 
cd ~/.dotfiles-macos
stow .
```

### D. What's included in my configuration: 

Some text

```text
.dotfiles-macos/
└── .config/        
    ├── kitty/
    │   ├── kitty.conf
    │   └── mocha.conf - theme
    ├── lvim/
    │   ├── lsp-settings/
    │   │   └── clangd.json
    │   ├── lua/
    │   │   ├── user/
    │   │   │   ├── alpha.lua
    │   │   │   ├── cmp.lua
    │   │   │   ├── formatters.lua
    │   │   │   ├── linters.lua
    │   │   │   ├── lspsaga.lua
    │   │   │   ├── notify.lua
    │   │   │   ├── options.lua
    │   │   │   └── treesistter.lua 
    │   │   └── README.md #update soon
    │   ├── config.lua 
    │   └── README.md #update soon
    ├── fish/
    │   ├── ...
    │   └── config.fish
    ├── Alacritty/
    │   └── alacritty.yml
    ├── skhd/skhdrc
    ├── yabai/yabairc
    ├── scripts/autosave.lua
    └── starship.toml
        
```
## Create the Env for ROS2-Humble 

Install package management system and environment management system
  ```bash 
  https://github.com/conda-forge/miniforge
  ```

Instal ROS2-desktop and Packages via Conda
```bash
conda install -c conda-forge  compilers cmake pkg-config make ninja colcon-common-extensions rosdep
```

```bash
conda install -c ros-humble-xacro ros-humble-joint-state-publisher-gui ros-humble-joint-state-publisher
```
```bash
conda install -c conda-forge gazebo
conda install -c robostack-staging ros-humble-gazebo-ros

find . -type d | grep DIRNAME
Always Control + C
```
## Noticed Errors
rosdep permissions to run rosdep init: 
https://github.com/RoboStack/ros-galactic/issues/13
https://docs.ros.org/en/independent/api/rosdep/html/sources_list.html
locate into rosdep2 insid ethe /Users/"username"/miniconda3/envs/ros_humble/lib/python3.10/site-packages/rosdep2/ 
edit file: sources_list.py 

? Change the ROS_ETC_DIR doesn't take affect! 
WORKED: set -gx ROS_ETC_DIR /Users/"touphung"/"mambaforge"/envs/"ros_env"/lib/python3.10/site-packages/rosdep2
## Bugs and feature requests

Have a bug or a feature request? Please first read the [issue guidelines](https://reponame/blob/master/CONTRIBUTING.md) and search for existing and closed issues. If your problem or idea is not addressed yet, [please open a new issue](https://reponame/issues/new).

rosdep permissions to run rosdep init: 
https://github.com/RoboStack/ros-galactic/issues/13
https://docs.ros.org/en/independent/api/rosdep/html/sources_list.html
locate into rosdep2 insid ethe /Users/"username"/miniconda3/envs/ros_humble/lib/python3.10/site-packages/rosdep2/ 
edit file: sources_list.py 

## References
https://github.com/RoboStack/ros-humble

https://conda-forge.org/
https://robostack.github.io/GettingStarted.html

https://www.oreilly.com/library/view/ros-robotics-projects/9781838649326/2108ea9b-9ddd-496d-9da2-a0efd8945f37.xhtml

https://github.com/RoboStack/ros-galactic/issues/13
https://docs.ros.org/en/independent/api/rosdep/html/sources_list.html
