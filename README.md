# devcontainer.el

A wrapper around [DevContainers](https//containers.dev). Currently just wraps the
literal CLI tool.

The best way to use this package is to clone this repository locally, add it to your
load-path, and modify your init scripts with the following:

```elisp
(add-hook 'dired-before-readin-hook #'devcontainer-dir-open-hook)
```

This `devcontainer-dir-open-hook` will run whenever a directory is opened by Emacs,
but before the directory is actually opened in a buffer. If it finds that it is
a valid Devcontainer-using directory, it will:

1. Prompt asking if it should open in the devcontainer - flow aborts if respond with `n`
1. Start that devcontainer using the CLI
1. Connect to it using TRAMP via `docker-tramp` package
1. Replace dired buffer with the TRAMP session
1. Add a hook to stop the devcontainer when emacs is stopped (`kill-emacs-hook`)


## Caveats

This does not work with Emacs in server mode and opening a new window with `emacsclient [--tty]`.
The window opens, prompted to open in container, and then entire window auto closes itself. No
container is ever started, but you don't get to edit anything either. Tested on Darwin with
Homebrew-installed Emacs. Steps to reproduce:

```bash
brew install emacs
brew services restart emacs
emacsclient .
```


## Dependencies

- `devcontainer` in PATH
- `docker` in PATH - no other assumptions made on daemon, although its probably 
   best to have it local
- Emacs packages:
  - shell
  - json
  - docker-tramp
