# find-and-replace-under-cursor

This package allows you to call search functions on words under the cursor.

This package utilizes the pre-existing find-and-replace package included with
Atom.

### Added Atom commands
* **find-and-replace:search-under-cursor** - Search current file for word under cursor
* **project-find:search-under-cursor** - Search project for word under cursor

### Key Mapping ###
This package does not create any default key mapping to reduce conflicts with other packages.
It is simple to add a binding to call the functions this package contains, simply add
something like the following to your keymap:

```coffee-script
'atom-text-editor':
  'f4': 'project-find:search-under-cursor'
  'f5': 'find-and-replace:search-under-cursor'
```

For more information regarding keymaps visit [Atoms keymap documentation](https://atom.io/docs/latest/advanced/keymaps).

### Demo

![Demo](https://raw.github.com/mertzt89/find-and-replace-under-cursor/master/preview.gif)
