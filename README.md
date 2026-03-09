# NeoVIM coding set up

I like to code in `Neovim` (with lots of bells and whistles) inside of a `tmux` session.

These are the configuration artifacts that allow me to do so with minimal fuss.

There is probably quite a bit of cruft in the individual files so your mileage may vary trying to use these.

I removed the preceding dot '.' which normally would hide many of these and here's a map of where they should go to match the running version:


### .tmux.conf

Mainly I use Ctrl-G instead of the default Ctrl-B and define shortcuts for function keys

```bash
cp tmux.conf ~/.tmux.conf
```

### .editorconfig

This overrides all other configs indenting, tab-spacing, and wrapping behavior.

```bash
cp editorconfig ~/.editorconfig
```

### .nvim

The most important files in here are `nvim/lua/plugins/custom.lua` which defines the plugins I manually install as opposed to using Mason or Lazy to manage.

And `nvim/init.lua` which does some scaffolding config work.

```bash
cp -r nvim ~/.nvim
```

### .vimrc, .vim

As time goes on and nvim and editorconfig become supplant more settings, these become less important however it still defines some UltiSnip interaction and allows for graceful degredation when I need to use basic Vim because Neovim has an issue.

```bash
cp vimrc ~/.vimrc

cp -r vim ~/.vim
```

