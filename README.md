# JaapieVim

My customized neovim configuration based on lazyvim

## Installation

First install neovim, here is the brew command for it other installs can be found in the [neovim documentation](https://neovim.io/doc/install/)  
For macos or linux with homebrew:

```zsh
brew install neovim
```

Next to use this configuration you can use this command. Watch out it deletes your entire current neovim config if you have one.

```zsh
mkdir -p ~/.config; cd ~/.config; rm -rf nvim; git clone https://github.com/jaapieaapie1/jaapievim.git nvim; cd nvim; rm -rf .git
```

You may also clone it manually into ~/.config/nvim  
After this you can start noevim with ``nvim``.
