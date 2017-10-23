" Key remap
noremap <Leader>n :NERDTreeToggle<cr>

" Files to ignore
" Array of regular expressions to match ommisions by
let NERDTreeIgnore = [
      \'\.class$',
      \'\.pyc$',
      \'\.egg-info[[dir]]',
      \'__pycache__[[dir]]',
      \'^bower_components[[dir]]',
      \'^node_modules[[dir]]',
      \'^tmp[[dir]]',
      \'^deps[[dir]]'
      \]
