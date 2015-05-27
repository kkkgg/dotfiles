" Vim syntax file
" Language:     Original memo text

syn match   ttSeparator		"^--\+$"
syn match   ttSeparator		"^──\+$"
syn match   ttSeparator		"^━━\+$"
syn match   ttSeparator		"^==\+$"
syn match   ttHeader1		"^□.\+"
syn match   ttDate			"^\d\{4}/\d\{2}/\d\{2}"
syn match   ttKey			"[0-9A-Z]\{8}$"
syn match   ttLink			"→.*[0-9A-Z]\{8}$"

hi def link ttSeparator		Comment
hi def link ttHeader1		Type
hi def link ttDate			Keyword
hi def link ttKey			Label
hi def link ttLink			String

" Character
" Comment
" Conditional
" Constant
" Error
" Exception
" Keyword
" Label
" Number
" PreCondit
" Repeat
" SpecialChar
" Statement
" StorageClass
" String
" Todo
" Type
