" Vim syntax file
" Language:     Original memo text

syn match   ttSeparator		"^--\+$"
syn match   ttSeparator		"^──\+$"
syn match   ttSeparator		"^━━\+$"
syn match   ttSeparator		"^==\+$"
syn match   ttTime			"^[ \t　]*\d\{2}:\d\{2}:\d\{2}"
syn match   ttTime			"\d\{2}:\d\{2}:\d\{2}" contained
syn match   ttDate			"^[ \t　]*\d\{4}/\d\{2}/\d\{2}"
syn match   ttDate			"^[ \t　]*\d\{4}/\d\{2}/\d\{2}[ \t　]\+\d\{2}:\d\{2}:\d\{2}" contains=ttTime
syn match   ttKey			"[ \t　]#\?[0-9A-Z]\{8}$" contained
syn match   ttLink			"\(->\|→\).*[0-9A-Z]\{8}$"
syn match   ttHeader1		"^□.\+" contains=ttKey
syn match   ttHeader2		"[^→]\+[ \t　]#\?[0-9A-Z]\{8}$" contains=ttKey

hi def link ttSeparator		Comment
hi def link ttHeader1		Type
hi def link ttHeader2		Type
hi def link ttDate			Keyword
hi def link ttTime			String
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
