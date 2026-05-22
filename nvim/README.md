## Keymap to remember

### Picker

```
<leader> -> Space
<leader>ff -> Find file ( telescope )
<leader>fg -> File live grep ( telescope )
<leader>w or WW -> save [ normal ]
<leader>q or QQ -> quit [ normal ]
Ctrl+s -> save [ all mode ]
jk -> exit insert mode
esc -> clear highlight
```

### Autocomplete

```
Tab -> next complete
Shift+Tab -> previous complete
Enter -> confirm
```

### Format

```
-----  -----
<leader>f -> format files
```

### LSP

```
K -> hover documentation
<leader>gd -> go definitions
<leader>gr -> references
<leader>rn -> rename symbol
<leader>ca -> code action
<leader>e -> line diagnostics
[d -> prev diagnostic
]d -> next diagnostic
```

### Fold

```
zo -> Open a fold at the cursor.
zc -> Close a fold at the cursor.
za -> Toggle a fold at the cursor.
zR -> Open all folds.
zM -> Close all folds.
```

### Scroll

```
ctrl+e -> scroll down 1 line
ctrl+y -> scroll up 1 line
ctrl+d -> scroll down half screen height
ctrl+u -> scroll up half screen height
ctrl+f -> scroll down full page
ctrl+u -> scroll up full page
zz -> scroll according to cursor into center
zt -> scroll according to cursor into top window
zb -> scroll according to cursor into bottom window
```

### Buffer

> [!NOTE]
> Buffer is file that currently opened

```
<leader>fr or <leader><space> -> navigate all buffer
<leader>x -> delete current buffer [normal]
ctrl + d -> delete buffer [selection]
ctrl + n -> new buffer [selection]
ctrl + x -> hard delete files ( remove from dir )
QQ -> close window
```

### Session

> [!NOTE]
> Session is all the current opened buffer, current working dir, etc. Basically anything you do before nvim closed.

```
<leader>wr -> open session list
<leader>wa -> toggle autosave session
<leader>ws -> save session
ctrl+d -> delete session
ctrl+s -> alternate session ( wtf ?)
ctrl+y -> copy session ( wtf ?)
```

