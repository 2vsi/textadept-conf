-- Light theme for Textadept.

local view, colors, styles = view, view.colors, view.styles

-- Palette.
colors.fg1      = 0x282828
colors.fg2      = 0x393939
colors.fg3      = 0x4a4a4a
colors.fg4      = 0x5c5c5c
colors.bg1      = 0xf0f1f2
colors.bg2      = 0xdddedf
colors.bg3      = 0xcacacb
colors.bg4      = 0xb6b7b8
colors.builtin  = 0x707172
colors.keyword  = 0x59b090
colors.const    = 0x99509b
colors.comment  = 0xb3b094
colors.func     = 0xc3b700
colors.str      = 0x5c6f93
colors.type     = 0x4d4b32
colors.var      = 0x632fa8
colors.warning  = 0x438bff
colors.warning2 = 0x002387

-- Default font.
if not font then font = OS == 'windows' and 'Consolas' or OS == 'macos' and 'Monaco' or 'Monospace' end
if not size then size = OS ~= 'macos' and 10 or 12 end

-- Predefined styles.
styles[view.STYLE_DEFAULT]       = {font = font, size = size, fore = colors.fg1, back = colors.bg1}
styles[view.STYLE_LINENUMBER]    = {fore = colors.fg4, back = colors.bg2}
styles[view.STYLE_BRACELIGHT]    = {fore = colors.keyword, bold = true}
styles[view.STYLE_BRACEBAD]      = {fore = colors.warning2}
-- styles[view.STYLE_CONTROLCHAR] = {}
styles[view.STYLE_INDENTGUIDE]   = {fore = colors.bg3}
styles[view.STYLE_CALLTIP]       = {fore = colors.fg2}
styles[view.STYLE_FOLDDISPLAYTEXT] = {fore = colors.fg4, back = colors.bg3}

-- Tag styles.
styles[lexer.ANNOTATION]         = {fore = colors.var}
styles[lexer.ATTRIBUTE]          = {fore = colors.type}
styles[lexer.BOLD]               = {bold = true}
styles[lexer.CLASS]              = {fore = colors.type}
styles[lexer.CODE]               = {fore = colors.fg3, eol_filled = true}
styles[lexer.COMMENT]            = {fore = colors.comment}
-- styles[lexer.CONSTANT]        = {}
styles[lexer.CONSTANT_BUILTIN]   = {fore = colors.const}
styles[lexer.EMBEDDED]           = {fore = colors.var}
styles[lexer.ERROR]              = {fore = colors.warning2}
-- styles[lexer.FUNCTION]        = {}
styles[lexer.FUNCTION_BUILTIN]   = {fore = colors.builtin}
styles[lexer.FUNCTION_METHOD]    = {fore = colors.func}
styles[lexer.HEADING]            = {fore = colors.const, bold = true}
-- styles[lexer.IDENTIFIER]      = {}
styles[lexer.ITALIC]             = {italic = true}
styles[lexer.KEYWORD]            = {fore = colors.keyword}
styles[lexer.LABEL]              = {fore = colors.var}
styles[lexer.LINK]               = {underline = true}
styles[lexer.LIST]               = {fore = colors.type}
styles[lexer.NUMBER]             = {fore = colors.const}
-- styles[lexer.OPERATOR]        = {}
styles[lexer.PREPROCESSOR]       = {fore = colors.var}
styles[lexer.REFERENCE]          = {underline = true}
styles[lexer.REGEX]              = {fore = colors.str}
styles[lexer.STRING]             = {fore = colors.str}
styles[lexer.TAG]                = {fore = colors.keyword}
styles[lexer.TYPE]               = {fore = colors.type}
styles[lexer.UNDERLINE]          = {underline = true}
-- styles[lexer.VARIABLE]        = {}
styles[lexer.VARIABLE_BUILTIN]   = {fore = colors.builtin}
-- styles[lexer.WHITESPACE]      = {}

-- CSS.
styles.property           = styles[lexer.ATTRIBUTE]
-- styles.pseudoclass     = {}
-- styles.pseudoelement   = {}
-- Diff.
styles.addition           = {fore = colors.keyword}
styles.deletion           = {fore = colors.warning2}
styles.change             = {fore = colors.warning}
-- HTML.
styles.tag_unknown        = styles[lexer.TAG] .. {italic = true}
styles.attribute_unknown  = styles[lexer.ATTRIBUTE] .. {italic = true}
-- Latex, TeX, and Texinfo.
styles.command            = styles[lexer.KEYWORD]
styles.command_section    = styles[lexer.HEADING]
styles.environment        = styles[lexer.TYPE]
styles.environment_math   = styles[lexer.NUMBER]
-- Makefile.
-- styles.target          = {}
-- Markdown.
-- styles.hr              = {}
-- Output.
styles.csi                = {visible = false}
local csi_colors = {
	black   = colors.fg1,     red  = colors.warning2, green = colors.keyword,
	yellow  = colors.func,    blue = colors.str,       magenta = colors.const,
	cyan    = colors.type,    white = colors.bg1
}
for k, v in pairs(csi_colors) do styles['csi_' .. k] = {fore = v} end
for k, v in pairs(csi_colors) do styles['csi_' .. k .. '_bright'] = {fore = v, bold = true} end
-- Python.
styles.keyword_soft       = {}
-- XML.
-- styles.cdata           = {}
-- YAML.
styles.error_indent       = {back = colors.warning2}

-- Element colors.
-- view.element_color[view.ELEMENT_SELECTION_TEXT]                    = colors.fg1
view.element_color[view.ELEMENT_SELECTION_BACK]                       = colors.bg3
-- view.element_color[view.ELEMENT_SELECTION_ADDITIONAL_TEXT]         = colors.fg1
view.element_color[view.ELEMENT_SELECTION_ADDITIONAL_BACK]            = colors.bg3
-- view.element_color[view.ELEMENT_SELECTION_SECONDARY_TEXT]          = colors.fg1
view.element_color[view.ELEMENT_SELECTION_SECONDARY_BACK]             = colors.bg3
-- view.element_color[view.ELEMENT_SELECTION_INACTIVE_TEXT]           = colors.fg1
view.element_color[view.ELEMENT_SELECTION_INACTIVE_BACK]              = colors.bg3
-- view.element_color[view.ELEMENT_SELECTION_INACTIVE_ADDITIONAL_TEXT]= colors.fg1
view.element_color[view.ELEMENT_SELECTION_INACTIVE_ADDITIONAL_BACK]   = colors.bg3
view.element_color[view.ELEMENT_CARET]                                = colors.fg1
-- view.element_color[view.ELEMENT_CARET_ADDITIONAL]                  =
if view ~= ui.command_entry then
	view.element_color[view.ELEMENT_CARET_LINE_BACK] = colors.bg2 | 0x60000000
end
view.caret_line_layer = view.LAYER_UNDER_TEXT

-- Fold Margin.
view:set_fold_margin_color(true, colors.bg2)
view:set_fold_margin_hi_color(true, colors.bg1)

-- Markers.
-- view.marker_fore[textadept.bookmarks.MARK_BOOKMARK] = colors.bg1
view.marker_back[textadept.bookmarks.MARK_BOOKMARK]   = colors.str
-- view.marker_fore[textadept.run.MARK_WARNING]        = colors.bg1
view.marker_back[textadept.run.MARK_WARNING]          = colors.warning
-- view.marker_fore[textadept.run.MARK_ERROR]          = colors.bg1
view.marker_back[textadept.run.MARK_ERROR]            = colors.warning2
for i = view.MARKNUM_FOLDEREND, view.MARKNUM_FOLDEROPEN do -- fold margin
	view.marker_fore[i]          = colors.bg1
	view.marker_back[i]          = colors.fg4
	view.marker_back_selected[i] = colors.fg1
end

-- Indicators.
view.indic_fore[ui.find.INDIC_FIND]                   = colors.func
view.indic_alpha[ui.find.INDIC_FIND]                  = 0x80
view.indic_fore[textadept.editing.INDIC_HIGHLIGHT]    = colors.keyword
view.indic_alpha[textadept.editing.INDIC_HIGHLIGHT]   = 0x80
view.indic_fore[textadept.snippets.INDIC_PLACEHOLDER] = colors.fg1
view.indic_fore[textadept.run.INDIC_WARNING]          = colors.warning
view.indic_fore[textadept.run.INDIC_ERROR]            = colors.warning2

-- Call tips.
view.call_tip_fore_hlt = colors.keyword

-- Long Lines.
view.edge_color = colors.bg3

-- Find & replace pane entries.
ui.find.entry_font = font .. ' ' .. size
