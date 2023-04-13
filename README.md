# devcontainer.el

A wrapper around [DevContainers](https//containers.dev). Currently just wraps the
literal CLI tool.

For a first go, we assume that you've _manually_ configured (e.g. in `.devcontainer/devcontainer.json`)
your devcontainer to have the official sshd feature installed and port 2222 exposed.

```json
{
  "features": {
    "ghcr.io/devcontainers/features/sshd:1": {}
  },
  "appPort": [
    2222
  ]
}
```

Depends on:

- `devcontainer` in PATH
- `docker` in PATH - no other assumptions made on daemon, although its probably 
   best to have it local
- Emacs compiled with [JSON support](https://www.gnu.org/software/emacs/manual/html_node/elisp/Parsing-JSON.html)
- Emacs packages:
  - shell
  - json
