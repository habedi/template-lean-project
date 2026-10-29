# A Template for Lean Projects

<div align="center">
  <picture>
    <img alt="Lean Logo" src="docs/assets/logos/lean-logo.svg" height="25%" width="25%">
  </picture>
</div>
<br>

[![Tests](https://img.shields.io/github/actions/workflow/status/habedi/template-lean-project/tests.yml?label=tests&style=flat&labelColor=282c34&color=4caf50&logo=github)](https://github.com/habedi/template-lean-project/actions/workflows/tests.yml)
[![Lints](https://img.shields.io/github/actions/workflow/status/habedi/template-lean-project/lints.yml?label=lints&style=flat&labelColor=282c34&color=4caf50&logo=github)](https://github.com/habedi/template-lean-project/actions/workflows/lints.yml)
[![Lean Version](https://img.shields.io/badge/lean-4.16.0-blue.svg?style=flat&labelColor=282c34&logo=lean)](https://github.com/leanprover/lean4)
[![Release](https://img.shields.io/github/release/habedi/template-lean-project.svg?style=flat&labelColor=282c34&color=f46623&logo=github)](https://github.com/habedi/template-lean-project/releases/latest)
[![License](https://img.shields.io/badge/license-MIT%2FApache--2.0-007ec6?style=flat&labelColor=282c34&logo=open-source-initiative)](https://github.com/habedi/template-lean-project)

---

This repository provides a template for starting new [Lean 4](https://lean-lang.org/) projects.
It includes a clean project layout, Lake build configuration, test driver, multi-platform continuous integration, and reproducible development shells.

## Features

- **Lean 4 and Lake Integration**: Configured with `lakefile.lean` supporting both library components and executable targets.
- **Built-in Test Driver**: Automated test runner integrated with `lake test`.
- **Multi-Platform CI**: GitHub Actions workflows testing builds on Ubuntu, macOS, and Windows via `leanprover/lean-action`.
- **Reproducible Environments**: Nix Flake (`flake.nix`) and `elan` configuration for identical toolchain setups.
- **Development Automation**: Comprehensive `Makefile` covering build, test, lint, clean, and hook setup commands.
- **Git Hooks**: Pre-commit hooks for trailing whitespace, file endings, formatting, and test execution.

---

## Quickstart

### Prerequisites

You need [elan](https://github.com/leanprover/elan), the Lean version manager, installed on your system:

```shell
curl -sSf https://raw.githubusercontent.com/leanprover/elan/master/elan-init.sh | sh
```

Alternatively, if you use [Nix](https://nixos.org/) (with flakes enabled), you can enter the development shell directly:

```shell
nix develop
```

### Building the Project

Build the Lean library and executable binary:

```shell
make build
```

### Running Tests

Execute the test suite:

```shell
make test
```

### Running the Executable

Run the compiled executable binary:

```shell
make run
```

### Available Make Targets

Run `make help` to inspect all available workflow targets:

| Command            | Description                                        |
|--------------------|----------------------------------------------------|
| `make build`       | Build the Lean library and default executable      |
| `make test`        | Run the project test suite via Lake                |
| `make run`         | Build and execute the main binary                  |
| `make check`       | Validate Lake build targets and test configuration |
| `make lint`        | Build with warnings treated as errors              |
| `make update`      | Update dependencies in `lake-manifest.json`        |
| `make clean`       | Remove Lake build artifacts and cache              |
| `make setup-hooks` | Install Git pre-commit and pre-push hooks          |
| `make test-hooks`  | Run pre-commit hooks on all tracked files          |
| `make help`        | Display all available targets with explanations    |

## Customizing for Your Project

1. **Rename the Package**: Update the package name, library name, and executable name in `lakefile.lean`.
2. **Rename Library Modules**: Rename `TemplateLeanProject.lean` and the `TemplateLeanProject/` folder to your chosen module name.
3. **Update `lean-toolchain`**: Change the toolchain identifier in `lean-toolchain` if targeting a different Lean 4 release.
4. **Update Configuration**: Update `PACKAGE_NAME` in `Makefile` and repository references in `README.md`.

---

## Contributing

See [CONTRIBUTING.md](CONTRIBUTING.md) for details on submitting issues and pull requests.
AI coding agents should review [AGENTS.md](AGENTS.md) before making modifications.

## License

This project is licensed under either of:

- Apache License, Version 2.0 ([LICENSE-APACHE](LICENSE-APACHE) or http://www.apache.org/licenses/LICENSE-2.0)
- MIT License ([LICENSE-MIT](LICENSE-MIT) or http://opensource.org/licenses/MIT)
