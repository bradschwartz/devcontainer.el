# devcontainer.el

A wrapper around [DevContainers](https//containers.dev). Currently just wraps the
literal CLI tool.

Depends on:

- `devcontainer` in PATH
- `docker` in PATH - no other assumptions made on daemon, although its probably 
   best to have it local
- Emacs compiled with [JSON support](https://www.gnu.org/software/emacs/manual/html_node/elisp/Parsing-JSON.html)
- Emacs packages:
  - shell
  - json
