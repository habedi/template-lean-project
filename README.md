## A Template for Lean Projects

<div align="center">
  <picture>
    <img alt="Lean Logo" src="docs/assets/logos/lean-logo.svg" height="25%" width="25%">
  </picture>
</div>
<br>

[![Tests](https://img.shields.io/github/actions/workflow/status/habedi/template-lean-project/tests.yml?label=tests&style=flat&labelColor=282c34&logo=github)](https://github.com/habedi/template-lean-project/actions/workflows/tests.yml)
[![Lints](https://img.shields.io/github/actions/workflow/status/habedi/template-lean-project/lints.yml?label=lints&style=flat&labelColor=282c34&logo=github)](https://github.com/habedi/template-lean-project/actions/workflows/lints.yml)
[![Lean Version](https://img.shields.io/badge/lean-4.35.0-blue.svg?style=flat&labelColor=282c34&logo=lean)](https://github.com/leanprover/lean4)
[![License](https://img.shields.io/badge/license-MIT%2FApache--2.0-007ec6?style=flat&labelColor=282c34&logo=open-source-initiative)](https://github.com/habedi/template-lean-project)
[![Release](https://img.shields.io/github/release/habedi/template-lean-project.svg?style=flat&labelColor=282c34&color=f46623&logo=github)](https://github.com/habedi/template-lean-project/releases/latest)

---

This repository provides a template for starting new [Lean 4](https://lean-lang.org/) projects.
It includes a clean project layout, Lake build configuration, test driver, multi-platform continuous integration, and reproducible development shells.

---

### Quickstart

#### 1. Prerequisites

You need [elan](https://github.com/leanprover/elan), the Lean version manager, installed on your system:

```shell
curl -sSf https://raw.githubusercontent.com/leanprover/elan/master/elan-init.sh | sh
```

Alternatively, if you use [Nix](https://nixos.org/) (with flakes enabled), you can enter the development shell directly:

```shell
nix develop
```

#### 2. Building the Project

```shell
make build
```

#### 3. Running Tests

```shell
make test
```

#### 4. Running the Executable

```shell
make run
```

> [!TIP]
> Run `make help` to see all available targets in the project's [Makefile](Makefile).

---

### Contributing

See [CONTRIBUTING.md](CONTRIBUTING.md) for details on submitting issues and pull requests.

### License

This project is licensed under either of:

- Apache License, Version 2.0 ([LICENSE-APACHE](LICENSE-APACHE) or http://www.apache.org/licenses/LICENSE-2.0)
- MIT License ([LICENSE-MIT](LICENSE-MIT) or http://opensource.org/licenses/MIT)
