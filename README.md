vim-monokai
===========

Refined monokai color scheme for vim. 

* The colour palette from [sickill/vim-monokai](https://github.com/sickill/vim-monokai). 

Install
-------

### [Vundle](https://github.com/gmarik/Vundle.vim) (recommend)

    Plugin 'crusoexia/vim-monokai'

### No plugin manager way

Download the syntax/monokai.vim file and copy it into your __~/.vim/syntax/__ folder.

__Note:__

If you previously use [sickill/vim-monokai](https://github.com/sickill/vim-monokai), you need to remove it first to install this one, because the two have the same name which could cause conflicts.

Usage
-----

Type below command in your vim or save it in your vimrc:

    colorscheme monokai

Configuration
-------------

### Italic
    
If you are using a font which support italic, you can use below config to enable the italic form:

    let g:monokai_italic = 1

### Thick window border

The default window border is narrow dotted line, use below config to turn on the thick one:

    let g:monokai_thick_border = 1

Javascript
----------

For javascript development, it is recommend to install below plugins:

1. [vim-javascript](https://github.com/pangloss/vim-javascript), which provide features such as param syntax highlight, function assignment identifier highlight ( just as the screenshots ).

2. [vim-javascript-lib](https://github.com/crusoexia/vim-javascript-lib), which is the companion of _vim-javascript_, provide the popular javascript libraries key word highlight, such as [underscore](http://underscorejs.org/) and [Backbone](http://backbonejs.org/).

Screenshots
-----------

![javascript](screenshots/javascript.png)

![html](screenshots/html.png)
