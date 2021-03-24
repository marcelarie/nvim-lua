vim.g.completion_chain_complete_list = {
    default = {
        {complete_items = {'lsp', 'snippet', 'buffers', 'tags'}},
        {mode = {'<c-p>'}}, {mode = {'<c-n>'}}
    }
}
