" ARQUIVO DE CONFIGURAÇÃO VIM
" ===========================
" Autor: oTropicalista
" Data de criação: 17/06/2020

set number
set tabstop=4
set shiftwidth=4
map <C-n> :NERDTreeToggle<CR>

" PLUGINS VIM-PLUG
" ================
call plug#begin('~/.vim/plugged') "define que todos plugins vão para esse diretório
Plug 'scrooloose/nerdtree'
Plug 'ntk148v/vim-horizon'
call plug#end()

"EXEMPLOS
"========
"set number: exibe os números das linhas do arquivo em edição.
"set autoindent: utiliza identação automática de acordo com a linguagem usada.
"set tabstop=4: ajusta a largura de tabulação para 4 espaços.
"set shiftwidth=4: ajusta a largura das paradas dos recuos para 4 espaços
"set smarttab: utiliza "tabulação inteligente".
"set textwidth=80: faz com que o texto seja quebrado para uma outra linha na edição quando passar de 80 colunas.
"set backup: diz para o vim criar uma cópia do arquivo editado.
"set backupdir=~/Backup: Indica o local onde será colocada a cópia.
"set columns=90: (em caso de GUI) ajusta a largura da janela para 90 colunas.
"set lines=35: (em caso de GUI) ajusta a altura da janela para 35 linhas.

" COISAS LEGAIS
" Verificação progressiva do horário
" e ajuste do esquema de cores do Vim.
" A adição de 0 para garantir que 
" retorno da função seja numérico.

if strftime("%H") < 6 + 0
        colorscheme darkblue
elseif strftime("%H") < 12 + 0
        colorscheme morning
elseif strftime("%H") < 18 + 0
        colorscheme shine
else
        colorscheme horizon
endif

" MyNext() and MyPrev(): Movement between tabs OR buffers
function! MyNext()
    if exists( '*tabpagenr' ) && tabpagenr('$') != 1
        " Tab support && tabs open
        normal gt
    else
        " No tab support, or no tabs open
        execute ":bnext"
    endif
endfunction
function! MyPrev()
    if exists( '*tabpagenr' ) && tabpagenr('$') != '1'
        " Tab support && tabs open
        normal gT
    else
        " No tab support, or no tabs open
        execute ":bprev"
    endif
endfunction

nnoremap L <ESC>:call MyNext()<CR>
nnoremap H <ESC>:call MyPrev()<CR>
