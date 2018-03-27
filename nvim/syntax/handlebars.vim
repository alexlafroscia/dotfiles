" Load additional HTML syntax files
runtime! syntax/html/*.vim

" Add `local-class` to work with `ember-css-modules`
syn match htmlArg contained "\<local-class\>"
