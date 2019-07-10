# workspace-config
My workspace configurations.

## Git Hooks

You have tell Git where the hooks directory is located by running one of the two commands below. 

### Global

Use the hooks for all repositories.

```sh
git config --global core.hooksPath /path/to/.hooks
```

### Single Repo

Use the hooks for a single repository.

```sh
git config core.hooksPath /path/to/.hooks
```
