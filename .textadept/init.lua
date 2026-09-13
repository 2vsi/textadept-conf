if UI ~= 'terminal' then
	view:set_theme('leetch2', {size = 12})
	keys['ctrl+*'] = textadept.menu.menubar['Edit/Preferences'][2]
end

local lsp = require('lsp')
lsp.server_commands.csharp = 'csharp-ls'

require('file_diff')

textadept.editing.highlight_words = textadept.editing.HIGHLIGHT_CURRENT

textadept.session.save_on_quit = false