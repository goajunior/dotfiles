"{ Auto commands
" Do not use smart case in command line mode, extracted from https://vi.stackexchange.com/a/16511/15292.
augroup dynamic_smartcase
    autocmd!
    autocmd CmdLineEnter : set nosmartcase
    autocmd CmdLineLeave : set smartcase
augroup END

augroup term_settings
    autocmd!
    " Do not use number and relative number for terminal inside nvim
    autocmd TermOpen * setlocal norelativenumber nonumber
    " Go to insert mode by default to start typing command
    autocmd TermOpen * startinsert
augroup END

" More accurate syntax highlighting? (see `:h syn-sync`)
augroup accurate_syn_highlight
    autocmd!
    autocmd BufEnter * :syntax sync fromstart
augroup END

" Return to last edit position when opening a file
augroup resume_edit_position
    autocmd!
    autocmd BufReadPost *
        \ if line("'\"") > 1 && line("'\"") <= line("$") && &ft !~# 'commit'
        \ | execute "normal! g`\"zvzz"
        \ | endif
augroup END

" Display a message when the current file is not in utf-8 format.
" Note that we need to use `unsilent` command here because of this issue:
" https://github.com/vim/vim/issues/4379
augroup non_utf8_file_warn
    autocmd!
    autocmd BufRead * if &fileencoding != 'utf-8'
                \ | unsilent echomsg 'File not in UTF-8 format!' | endif
augroup END

" Automatically reload the file if it is changed outside of Nvim, see
" https://unix.stackexchange.com/a/383044/221410. It seems that `checktime`
" command does not work in command line. We need to check if we are in command
" line before executing this command. See also
" https://vi.stackexchange.com/a/20397/15292.
augroup auto_read
    autocmd!
    autocmd FocusGained,BufEnter,CursorHold,CursorHoldI *
                \ if mode() == 'n' && getcmdwintype() == '' | checktime | endif
    autocmd FileChangedShellPost * echohl WarningMsg
                \ | echo "File changed on disk. Buffer reloaded!" | echohl None
augroup END

" Sets markdown syntax for *.md files.
autocmd BufRead,BufNewFile *.cl set filetype=c

" Sets gmsh syntax for *.geo files.
autocmd BufRead,BufNewFile *.geo set filetype=gmsh

autocmd BufRead,BufNewFile *.idp set filetype=edp

" " Sets mathematica syntax for *.m files.
" autocmd BufRead,BufNewFile *.m set filetype=mma

" Sets javascript syntax for *.json files.
"
" Sets html syntax for *.ejs files.
autocmd BufRead,BufNewFile *.ejs set filetype=html

au BufNewFile,BufRead *.edp set filetype=edp

" Wrap markdown files.
autocmd BufRead,BufNewFile *.md set wrap
autocmd  BufRead,BufNewFile *.py,*.vim,*.f normal zR
"}
