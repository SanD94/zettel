setlocal suffixesadd=.md
setlocal conceallevel=2
setlocal spell spelllang=tr,en_us


call deoplete#custom#source('wiki_files', 'matchers', ['matcher_full_fuzzy'])
call deoplete#custom#option('ignore_sources', {'zettel' : ['tabnine']})

