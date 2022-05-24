# My VIM Stuffs 

## Setup

### Pacman/AUR Package requirements

```
ctags
vim-youcompleteme-git
vim-plug
clang
ncurses5-compat-libs
```

### Copy configs/rcs

The files in this repo need to be copied in the following way

```
cp -r vim ~/.vim  
cp -r vim_runtime ~/.vim_runtime  
cp -r vimrc ~/.vimrc
cp -r ycm_extra_conf.py ~/.ycm_extra_conf.py
```

### Install plugins

Then in vim run `:PlugInstall`

### Compile libraries

Compile YouCompleteMe and Color_coded libraries

#### YouCompleteMe

```
cd ~/.vim/plugged/youcompleteme
./install.py --all
```
#### Color Coded

```
cd ~/.vim/plugged/color_coded
mkdir build && cd build
cmake ..
make && make install
make clean && make clean_clang
```

## VIM Binds

### Leader

leader button is `,`

### Saving

#### Fast save

`,w`

#### Sude save

`:W`

