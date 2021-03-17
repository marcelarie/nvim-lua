vim.cmd([["Auto Pairs:"
     let g:AutoPairsFlyMode = 0
     let g:AutoPairsMultilineClose = 0
     au FileType html let b:AutoPairs = AutoPairsDefine({'<!--' : '-->'})
     au FileType css  let b:AutoPairs = AutoPairsDefine({'/*' : '*/'})
     au FileType javascript let b:AutoPairs = AutoPairsDefine({'/*' : '*/'})
]])
