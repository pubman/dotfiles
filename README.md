# pubman's dotfiles

*Modern zsh configuration with Tokyo Night theme and Starship prompt*

## What's Included

### Core Shell Configuration
- `.zshrc` - Modern Zsh configuration with plugins and Tokyo Night theme
- `starship.toml` - Starship prompt configuration (Tokyo Night colors)
- `.aliases` - 100+ shortcuts including modern eza file listing
- `.functions` - Custom shell functions (`mkd`, `targz`, `server`, etc.)
- `.exports` - Environment variables (EDITOR=nvim, history, locale)
- `.extra` - Personal development tools (Node, Go, Ruby, Python, etc.)

### Development Tools
- `.gitconfig` - Comprehensive Git aliases and workflow settings
- `.inputrc` - Enhanced readline completion and history search
- `.editorconfig` - Cross-editor coding standards
- **nvim/** - Complete Neovim configuration with plugins and LSP

### Modern Tools Integration
- **eza** - Modern replacement for ls with colors, icons, and Git integration
- **starship** - Cross-shell prompt with Git status and language detection
- **zsh plugins** - Auto-suggestions, syntax highlighting, and completions
- **Tokyo Night theme** - Consistent theming across terminal and prompt

### Network & System
- `.curlrc`, `.wgetrc` - Optimized download tool configurations
- `.tmux.conf`, `.screenrc` - Terminal multiplexer setups
- `.macos` - 1000+ macOS system preference optimizations
- `brew.sh` - Homebrew package installer for development tools

### Usage Commands
```bash
source bootstrap.sh  # Install/update dotfiles to home directory
./brew.sh           # Install development tools via Homebrew
./.macos            # Apply macOS system preferences

# After installation, switch to zsh (if not already default)
chsh -s $(which zsh)
```

## Installation

**Warning:** These are my personal dotfiles. If you want to use them, you should fork this repository, review the code, and customize it to your needs. Don't blindly use these settings unless you understand what they do!

### Using Git and the bootstrap script

You can clone the repository wherever you want. (I like to keep it in `~/Projects/dotfiles`, with `~/dotfiles` as a symlink.) The bootstrapper script will pull in the latest version and copy the files to your home folder.

```bash
git clone https://github.com/pubman/dotfiles.git && cd dotfiles && source bootstrap.sh
```

To update, `cd` into your local `dotfiles` repository and then:

```bash
source bootstrap.sh
```

Alternatively, to update while avoiding the confirmation prompt:

```bash
set -- -f; source bootstrap.sh
```

### Git-free install

To install these dotfiles without Git:

```bash
cd; curl -#L https://github.com/pubman/dotfiles/tarball/main | tar -xzv --strip-components 1 --exclude={README.md,bootstrap.sh,.osx,LICENSE-MIT.txt}
```

To update later on, just run that command again.

### Specify the `$PATH`

If `~/.path` exists, it will be sourced along with the other files, before any feature testing (such as [detecting which version of `ls` is being used](https://github.com/pubman/dotfiles/blob/main/.aliases#L21-L26)) takes place.

Here’s an example `~/.path` file that adds `/usr/local/bin` to the `$PATH`:

```bash
export PATH="/usr/local/bin:$PATH"
```

### Add custom commands without creating a new fork

If `~/.extra` exists, it will be sourced along with the other files. You can use this to add a few custom commands without the need to fork this entire repository, or to add commands you don’t want to commit to a public repository.

My `~/.extra` looks something like this:

```bash
# Git credentials
# Not in the repository, to prevent people from accidentally committing under my name
GIT_AUTHOR_NAME="Pubman"
GIT_COMMITTER_NAME="$GIT_AUTHOR_NAME"
git config --global user.name "$GIT_AUTHOR_NAME"
GIT_AUTHOR_EMAIL="0xpubman@gmail.com"
GIT_COMMITTER_EMAIL="$GIT_AUTHOR_EMAIL"
git config --global user.email "$GIT_AUTHOR_EMAIL"
```

You could also use `~/.extra` to override settings, functions and aliases from this dotfiles repository. It's probably better to [fork this repository](https://github.com/pubman/dotfiles/fork) instead, though.

### Sensible macOS defaults

When setting up a new Mac, you may want to set some sensible macOS defaults:

```bash
./.macos
```

### Install Homebrew formulae

When setting up a new Mac, you may want to install some common [Homebrew](https://brew.sh/) formulae (after installing Homebrew, of course):

```bash
./brew.sh
```

Some of the functionality of these dotfiles depends on formulae installed by `brew.sh`. If you don't plan to run `brew.sh`, you should look carefully through the script and manually install any particularly important ones. Key dependencies include:

- **eza** - Modern file listing (falls back to ls if unavailable)
- **starship** - Cross-shell prompt
- **zsh** plugins for auto-suggestions and syntax highlighting
- **Git** completion and enhanced features from Homebrew

## Feedback

Suggestions/improvements
[welcome](https://github.com/pubman/dotfiles/issues)!

## Author

| [pubman](https://github.com/pubman) |

## Thanks to…

* @ptb and [his _macOS Setup_ repository](https://github.com/ptb/mac-setup)
* [Ben Alman](http://benalman.com/) and his [dotfiles repository](https://github.com/cowboy/dotfiles)
* [Cătălin Mariș](https://github.com/alrra) and his [dotfiles repository](https://github.com/alrra/dotfiles)
* [Gianni Chiappetta](https://butt.zone/) for sharing his [amazing collection of dotfiles](https://github.com/gf3/dotfiles)
* [Jan Moesen](http://jan.moesen.nu/) and his [ancient `.bash_profile`](https://gist.github.com/1156154) + [shiny _tilde_ repository](https://github.com/janmoesen/tilde)
* Lauri ‘Lri’ Ranta for sharing [loads of hidden preferences](https://web.archive.org/web/20161104144204/http://osxnotes.net/defaults.html)
* [Matijs Brinkhuis](https://matijs.brinkhu.is/) and his [dotfiles repository](https://github.com/matijs/dotfiles)
* [Nicolas Gallagher](http://nicolasgallagher.com/) and his [dotfiles repository](https://github.com/necolas/dotfiles)
* [Sindre Sorhus](https://sindresorhus.com/)
* [Tom Ryder](https://sanctum.geek.nz/) and his [dotfiles repository](https://sanctum.geek.nz/cgit/dotfiles.git/about)
* [Kevin Suttle](http://kevinsuttle.com/) and his [dotfiles repository](https://github.com/kevinSuttle/dotfiles) and [macOS-Defaults project](https://github.com/kevinSuttle/macOS-Defaults), which aims to provide better documentation for [`~/.macos`](https://mths.be/macos)
* [Haralan Dobrev](https://hkdobrev.com/)
* Anyone who [contributed a patch](https://github.com/pubman/dotfiles/contributors) or [made a helpful suggestion](https://github.com/pubman/dotfiles/issues)
