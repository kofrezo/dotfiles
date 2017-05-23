if !has('python3')
    finish
endif

let s:path = expand('<sfile>:p:h') . '/puppet_autocomplete.py'

function! puppet_autocomplete#Complete(findstart, base)
    exec 'py3file ' . s:path
endfunc

setlocal completefunc=puppet_autocomplete#Complete
command! PuppetAutocomplete call puppet_autocomplete#Complete()
