## Contribution Guidelines

Thank you for considering contributing to this project!
Contributions are always welcome and appreciated.

### How to Contribute

Please check the [issue tracker](https://github.com/habedi/template-lean-project/issues) to see if there is an issue
you would like to work on or if it has already been resolved.

#### Reporting Bugs

1. Open an issue on the [issue tracker](https://github.com/habedi/template-lean-project/issues).
2. Include information such as steps to reproduce the observed behavior and relevant logs or screenshots.

#### Suggesting Features

1. Open an issue on the [issue tracker](https://github.com/habedi/template-lean-project/issues).
2. Provide details about the feature, its purpose, and potential implementation ideas.

### Submitting Pull Requests

- Make sure all Lean proofs compile and tests pass (`make test`).
- Make sure the Git hooks pass (`make test-hooks`) before submitting a pull request.
- Write a clear description of the changes you made and the reasons behind them.

> [!IMPORTANT]
> It is assumed that by submitting a pull request, you agree to license your contributions under the project's license.

### Development Workflow

> [!IMPORTANT]
> If you are using an AI-assisted coding tool, make sure it follows the instructions in the [AGENTS.md](AGENTS.md) file.

#### Prerequisites

Make sure you have [elan](https://github.com/leanprover/elan) installed on your system or use [Nix](https://nixos.org/download.html)
(with flakes enabled):

```shell
nix develop
```

Or install elan manually:

```shell
make install-deps
```

#### Common Commands

- `make build`: Build the Lean library and executable.
- `make test`: Run the Lean test suite.
- `make run`: Run the compiled binary.
- `make check`: Check build targets and test configuration.
- `make help`: See all available commands.

### Code of Conduct

We adhere to the project's [Code of Conduct](CODE_OF_CONDUCT.md).
