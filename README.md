vim-monokai
===========

Refined monokai color scheme for vim. 

* The colour palette from [sickill/vim-monokai](https://github.com/sickill/vim-monokai). 

Install
-------

### [Vundle](https://github.com/gmarik/Vundle.vim) (recommend)

    Plugin 'crusoexia/vim-monokai'

### Manually

Download the syntax/monokai.vim file and copy it into your __~/.vim/syntax/__ folder.

Usage
-----

Type below command in your vim or save it in your vimrc:

    syntax on
    colorscheme monokai

Configuration
-------------

### Terminal Italic
    
If you are using a font in terminal which support italic, use below configuration to turn on terminal italic:

    let g:monokai_term_italic = 1

Javascript
----------

For javascript development, it is recommend to install below plugins:

1. [vim-javascript](https://github.com/pangloss/vim-javascript), which provide features such as param syntax highlight, function assignment identifier highlight ( just as the screenshots ).

2. [vim-javascript-lib](https://github.com/crusoexia/vim-javascript-lib), which is the companion of _vim-javascript_, provide the popular javascript libraries key word highlight, such as [underscore](http://underscorejs.org/) and [Backbone](http://backbonejs.org/).

Screenshots
-----------

![javascript](screenshots/javascript.png)

![html](screenshots/html.png)
