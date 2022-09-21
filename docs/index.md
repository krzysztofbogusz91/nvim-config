# Vim shortcuts

## Movement

## Copy

- `yiw` copy word cursor is on

## Editing

- `ciw` change inner word will change the whole word under the cursor 
- `cw` change world from where cursor stands
- `viwp` replace word (good to folow up from yiw yank inner word)
```
  v    -> start visual mode
  iw   -> select the 'inner word'
  p    -> paste - in visual mode it replaces the visually selected text
```
### Editing Tips

- The "inner" and "a" commands are great in Vim, also try "ci{" inside a {} block, or "ca{" if you also wish to remove the {} characters too. To translate these commands to English to remember them better, try: "change inner { block" and "change a { block".
