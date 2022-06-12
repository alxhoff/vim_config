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

### Tab selection
`Shift+>`

### Back tab selection
`Shift+<`

### Repeat last action
`.`

### Search
Space

### Commenting

#### Comment out the current line or text selected in visual mode.
`<leader>cc`

#### Same as cc but forces nesting.
`<leader>cn`

#### Toggles the comment state of the selected line(s). If the topmost selected line is commented, all selected lines are uncommented and vice versa.
`<leader>c<space>`

#### Comments out the selected lines with a pretty block formatted layout.
`<leader>cs`

#### Adds comment delimiters to the end of line and goes into insert mode between them.
`<leader>cA`

### Visual Mode

#### Standard binds
##### Character Mode
`v`

##### Line Mode
`V`

##### Block Mode
`Ctrl+v`

### Easy Align
Will allign selected lines based off of a privided character

`ga` then enter the desired character, eg. `=`

### Nerd Tree
File explorer

#### Toggle Nerd Tree
`,nn`

#### Focus in Nerd Tree
`,nf`
#### Open file in split
`s`
#### Open file in vsplit
`i`

### Moving splits
#### Rotate windows up/left
`Ctrl w + R` 
#### Rotate windows down/right
`Ctrl w + r`

### Fuzzy Search

#### Open fuzzy search
`;`

#### Open result in new tab
`Ctrl+t` from fuzzy search window

#### Open result in split
`Ctrl+x`

#### Open result in vsplit
`Ctrl+v`

### Cscope
`l`

### Tagbar
`F8`

### Tabs

#### New tab
`,t`
#### Next tab
`Ctrl+d`
#### Previous tab
`Ctrl+a`

### Resizing
#### Set equal sizing
`Ctrl+w` -> `=`

### Cscope and Ctags
`Ctrl+]`

## YouCompleteMe

### Semantic Completion
`Ctrl+Space`

### GoTo
`,yg`

### GetDoc
`,yd`

### GetType
`,yt`

### FixIt
`,yf`

### GoTo Declaration
`,gl`

### GoTo Definition
`,gf`

### GoTo Definition else Declaration
`,gg`

### Random binds
#### Move to parent/next bracket
`[{`/`]}`

#### Move to partner bracket
`%`
