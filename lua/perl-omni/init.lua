vim.cmd([[
setlocal omnifunc=Ocf_devel_intelliperl
function! Ocf_devel_intelliperl(findstart, base)
" This function is called twice, once with a:findstart and immediately
" thereafter without a:findstart
" With a:findstart, return the col where the prefix starts
" Without a:findstart, return the method options
" We run Devel::IntelliPerl only once and cache the results
if a:findstart

" Get some info for the command
let line = line('.')
let column = col('.') - 1
let filename = expand("%")

" Defined the Devel::IntelliPerl command
let command = "perl -MDevel::IntelliPerl::Editor::Vim -e 'run' " . line . ' ' . column . ' ' . filename

" Get the current contents of the buffer (we don't want to have to write the file)
let buffer_contents = join( getline(1,"$"), "\n" )

" Run the command and munge the results into a list
let result_str = system(command, buffer_contents )
let s:ofc_results = split( result_str, " *\n" )
let prefix_len = s:ofc_results[0]

return col('.') - prefix_len - 1
endif

return s:ofc_results[1:-1]
endfunction
]]);
