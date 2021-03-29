## On Vim Surround:
    cs"' >> change \" to \'
    cs'<q> >> change it to <q>
    ds" >> delete "
    ysiw] >> surround word with []
    cs]{ >> change [ for {
    yssb >> wrap whole line


## Fix on no modifiable error
change in line 329 of "./lua/nvim-tree/renderer.lua"
```lua
api.nvim_buf_set_option(tree.bufnr, 'modifiable', false)
```
change the false to true ;)
