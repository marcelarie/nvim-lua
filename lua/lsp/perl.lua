require'lspconfig'.perlls.setup {
    cmd = {
        "perl", "-MPerl::LanguageServer", "-e", "Perl::LanguageServer::run",
        "--", "--port 13603", "--nostdio 0", "--version 2.2.0"
    }

}

