require('code_runner').setup({
  filetype = {
	cpp = {
		"cd $dir &&",
		"mkdir -p output &&",
		"clang++ $fileName -g -o output/$fileNameWithoutExt &&",
		"./output/$fileNameWithoutExt"
	}
  },
})
