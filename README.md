# My Vimrc
This is a instruction for using my vimrc.

## Plugin Manager
### Installation
For Vundle:

```shell
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
```

For vim-plug:
```shell
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
```
### HOWTO

For Vundle:
```
:PluginInstall
```

For vim-plug:
```
:PlugInstall
```

## Some Plugin Compilation
### YouCompleteMe

## Colors and Theme
The `.vimrc` in this repo uses airline, the most popular theme and hint-line format plugin.
```
let g:airline_theme='bubblegum'  " my fovarite theme
let g:airline_powerline_fonts=1
let g:airline#extensions#branch#enabled=1
let g:airline#extensions#tabline#enabled=1
let g:airline#extensions#tabline#buffer_nr_show=1
```

Some explanation for air-line format.
```
10%     - 10 percent down the top of the file
☰ 10    - current line 10
/100 ln - of 100 lines
: 20    - current column 20
```

END

