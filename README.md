## Nvim Lua Config

- [CheatSheet](~/.config/nvim/docs/cheat_sheet.md)

### TODO

- [ ] PIN PACKAGES!!!! TO COMMITS! TO Keep ide constent!
- [ ] add the table of content plugin
- [ ] Add md paste image https://github.com/ekickx/clipboard-image.nvim
- [ ] Setup debbuger : https://alpha2phi.medium.com/neovim-for-beginners-angular-d202f3ea2f52
- [ ] Awesome tut for snipets https://alpha2phi.medium.com/learn-neovim-the-practical-way-8818fcf4830f#545a
- [ ] Learn to jump between args in snippets and functions
- [ ] How does he jump between https://github.com/rafamadriz/friendly-snippets ???
- [-] Add surround vim https://github.com/kylechui/nvim-surround
- Check ts lsp https://github.com/jose-elias-alvarez/typescript.nvim actions!

- [ ] CMP addons configs https://github.com/hrsh7th/nvim-cmp/wiki/List-of-sources#snippets
- [ ] Research https://github.com/pwntester/octo.nvim github integration
- update and customise startup https://github.com/startup-nvim/startup.nvim
### Fix autosave and related issues

- curently there is issue when using startup error when accessing files
- err with to quick save and format we need to split it
- error same as above with undo 

Possible resolutions (attach before save hooks or other)
- https://github.com/Pocco81/auto-save.nvim/issues/12#issuecomment-1179462485
- https://github.com/Pocco81/auto-save.nvim/issues/14

### TERMINAL

- not really working
  Ctrl + A: go to the beginning of line
  Ctrl + E: go to the end of line
  Alt + B: skip one word backward
  Alt + F: skip one word forward
  Ctrl + U: delete to the beginning of line
  Ctrl + K: delete to the end of line
  Alt + D: delete to the end of word

### IDE MUST HAVE LIST

- [ ] Easy traverse project structure
- [ ] Tree side bar
- [ ] Ctr+P Find in project
- [ ] Language server
- [ ] Error higlighting
- [ ] Lint higliting
- [ ] Git highliting
- [ ] Check whats under highlight
- [ ] Goto deff
- [ ] View deff implementation
- [ ] Enter snippet from the list
- [ ] Automaticly add import
- [ ] Format on save
- [ ] Prettier
- [ ] Auto close tags
- [ ] Emmet
- [ ] Auto add brackets text inside " { } []

Wish list:

- [ ] Code actions extract to function (general refactor)

## Nice Links

- Chris@mashine setup good https://github.com/ChristianChiarulli/nvim/blob/aa0efdf595e2ebc0b603fad25d95fda2a006bd20/lua/user/plugins.lua
- LSP configs https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#cssls
- TERMINAL CUTOM https://github.com/egel/tmux-gruvbox color
- LSP -configs https://github.com/neovim/nvim-lspconfig/blob/master/lua/lspconfig.lua
- https://vonheikemen.github.io/devlog/tools/setup-nvim-lspconfig-plus-nvim-cmp/ good article
