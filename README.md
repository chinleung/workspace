# Workspace Configuration

The configurations of my workspace.

## Dependencies

- [Color LS](https://github.com/athityakumar/colorls#installation)

## Contents

- [Git Alias](#git-alias)
- [Git Hooks](#git-hooks)

## Git Alias

<details>
  <summary>clean-branches</summary>
  
  Remove all branches except `master`.
</details>

## Git Hooks

You have tell Git where the hooks directory is located by running **one** of the two commands below.

<details>
  <summary>Global</summary>

Use the hooks for all repositories.

```sh
git config --global core.hooksPath /path/to/.hooks
```
</details>

<details>
<summary>Single Repository</summary>

Use the hooks for a single repository.

```sh
git config core.hooksPath /path/to/.hooks⃗
```
</details>

### pre-commit

Prevents a commit if there's a PHPUnit test is failing.
