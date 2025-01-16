# Dev Container Features

This repository contains a _collection_ of Features.

- `apt`       - Install apt dependencies defined in an `Aptfile.dev` file.

## Repo and Feature Structure

Similar to the [`devcontainers/features`](https://github.com/devcontainers/features) repo, this repository has a `src` folder.  Each Feature has its own sub-folder, containing at least a `devcontainer-feature.json` and an entrypoint script `install.sh`.

```bash
├── src
│   ├── apt
│   │   ├── devcontainer-feature.json
│   │   └── install.sh
...
```

An [implementing tool](https://containers.dev/supporting#tools) will composite [the documented dev container properties](https://containers.dev/implementors/features/#devcontainer-feature-json-properties) from the feature's `devcontainer-feature.json` file, and execute in the `install.sh` entrypoint script in the container during build time.  Implementing tools are also free to process attributes under the `customizations` property as desired.

## Distributing Features

### Versioning

Features are individually versioned by the `version` attribute in a Feature's `devcontainer-feature.json`.  Features are versioned according to the semver specification. More details can be found in [the dev container Feature specification](https://containers.dev/implementors/features/#versioning).

### Publishing

> NOTE: The Distribution spec can be [found here](https://containers.dev/implementors/features-distribution/).
>
> While any registry [implementing the OCI Distribution spec](https://github.com/opencontainers/distribution-spec) can be used, this template will leverage GHCR (GitHub Container Registry) as the backing registry.

Features are meant to be easily sharable units of dev container configuration and installation code.

This repo contains a **GitHub Action** [workflow](.github/workflows/release.yaml) that will publish each Feature to GHCR.

By default, each Feature will be prefixed with the `<owner/<repo>` namespace.  For example, the Features in this repository can be referenced in a `devcontainer.json` with:

```bash
ghcr.io/viktorianer/devcontainer-features/apt:1
```

The provided GitHub Action will also publish a third "metadata" package with just the namespace, eg: `ghcr.io/viktorianer/devcontainer-features`.  This contains information useful for tools aiding in Feature discovery.

'`viktorianer/devcontainer-features`' is known as the feature collection namespace.

### Adding Features to the Index

If you'd like your Features to appear in our [public index](https://containers.dev/features) so that other community members can find them, you can do the following:

- Go to [github.com/devcontainers/devcontainers.github.io](https://github.com/devcontainers/devcontainers.github.io)
  - This is the GitHub repo backing the [containers.dev](https://containers.dev/) spec site
- Open a PR to modify the [collection-index.yml](https://github.com/devcontainers/devcontainers.github.io/blob/gh-pages/_data/collection-index.yml) file

This index is from where [supporting tools](https://containers.dev/supporting) like [VS Code Dev Containers](https://marketplace.visualstudio.com/items?itemName=ms-vscode-remote.remote-containers) and [GitHub Codespaces](https://github.com/features/codespaces) surface Features for their dev container creation UI.
