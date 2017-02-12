" set path for filename suggestions
" ** means "in any subfolder"
set path+=~/git/**

" where should vim look for the tags?
" tags are generated by ctags utility
" multiple paths should be separated by comma
set tags+=~/tags,~/tags-once

" build 1
map <Leader>m :call VimuxRunCommand("cd ~/ros_workspace; catkin build")<CR>
"map <Leader>m :call VimuxRunCommand("cd ~/timepix_workspace; catkin build")<CR>
" build2
map <Leader>j :call VimuxRunCommand("cd ~/ros_workspace; catkin build mbzirc_trackers")<CR>
"map <Leader>j :call VimuxRunCommand("cd ~/timepix_workspace; catkin build rospix")<CR>
" close the vimmux window
map <Leader>l :VimuxCloseRunner<CR>
" building ctags
command! MakeTags :call VimuxRunCommand("generateTags; :q")<CR>
"
"""""""""""""""""""""""""""""""

" customize bookmarks in startify
let g:startify_bookmarks = [
      \ { 'b': '~/.bashrc' },
      \ { 't': '~/.tmux.conf' },
      \ { 'v': '~/.vimrc' },
      \ { 'm': '~/.my.vimrc' },
      \ { 's': '~/git/linux-setup/appconfig/vim/dotvim/after/snippets/_.snippets' },
      \ { 'p': '~/git/linux-setup/appconfig/vim/startify_quotes.txt' },
      \ ]

" because of latex
filetype plugin on
set grepprg=grep\ -nH\ $*
filetype indent on
let g:tex_flavor='latex'

nnoremap <a-j> <c-d>
nnoremap <a-k> <c-u>

" remap right and left in normal mode to juping back and forth on f,t
" nnoremap <left> ,
" nnoremap <right> ;

" Useful bubble text normal mapping for arrow keys.                                                                                        
" nnoremap <UP> ddkP 
" nnoremap <DOWN> ddp
" vnoremap <DOWN> xp`[V`]
" vnoremap <UP> xkP`[V`]
