local status_ok, treesitter = pcall(require, "nvim-treesitter.configs")

if not status_ok 
then 
  return 
end

treesitter.setup({
	ensure_installed = {
		"bash",
		"cpp",
		"css",
		"go",
		"html",
		"lua",
		"make",
		"python",
		"rust",
		"tsx",
		"javascript",
		"typescript",
		"yaml",
	},
	highlight = { enable = true },
})
