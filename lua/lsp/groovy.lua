require("lspconfig").groovyls.setup {
	cmd = { "java", "-jar", "../../groovy-lsp/build/groovy-language-server-all.jar" },
	...,
}
