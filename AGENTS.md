# AGENTS.md

This file provides guidance to coding agents collaborating on this repository.

## Mission

This repository is a template for Lean 4 projects with Mathlib.
It provides a starter project with:

1. A Lake package configuration supporting both library modules and an executable binary.
2. Mathlib integration with precompiled build cache support.
3. A test suite integrated with Lake's test runner.
4. Continuous integration workflows for Linux, macOS, and Windows.
5. Reproducible development environments via Nix and elan.

Priorities, in order:

1. Mathematical soundness, verified proofs without `sorry`, and reliable execution.
2. Compatibility with the pinned Lean 4 toolchain version.
3. Clean separation between library code, executable targets, and tests.
4. Fast and predictable compilation.

## Core Rules

- Use English for code, comments, documentation, tests, and commit messages.
- Do not introduce `sorry` in proofs unless the user explicitly requests an unproven sketch.
- Follow standard Lean 4 naming conventions: `camelCase` for terms and functions, `PascalCase` for types and inductive
  definitions, and `snake_case` or descriptive names for theorems and lemmas.
- Use explicit type signatures on all top-level definitions and theorems.
- Avoid unnecessary package dependencies.
- Keep documentation, comments, and examples aligned with actual codebase behavior.

## Writing Style

- Write in simple, plain English. Use short sentences and everyday words.
- Use Oxford commas in inline lists: "a, b, and c" not "a, b, c".
- Do not use em dashes. Restructure the sentence, or use a colon or semicolon instead.
- Avoid colorful adjectives and adverbs. Write "test driver" not "lightweight test driver".
- Use noun phrases for checklist items, not imperative verbs. Write "theorem verification" not "verify theorems".
- Headings in Markdown files must be in Title Case: "Build from Source" not "Build from source". Minor words (a, an,
  the, and, but, or, for, in, on, at, to, by, of, is, are, was, were, be) stay lowercase unless they are the first word.

## Repository Layout

- `lean-toolchain`: Pinned Lean 4 toolchain version for elan.
- `lakefile.lean`: Lake build configuration describing the package, library, executable, and test driver.
- `TemplateLeanProject.lean`: Root library module file.
- `TemplateLeanProject/Basic.lean`: Example definitions, functions, and verified theorems.
- `Main.lean`: Executable entry point with `def main : IO Unit`.
- `Tests.lean`: Test suite executed by `lake test`.
- `Makefile`: Common development workflows and convenience targets.
- `flake.nix`: Nix flake defining reproducible development shells.
- `.github/workflows/`: GitHub Actions workflows for continuous integration.
  - `tests.yml`: Multi-platform test runner on Ubuntu, macOS, and Windows.
  - `lints.yml`: Warning checks and pre-commit hooks.
- `docs/`: Markdown documentation and project assets.
  - `docs/assets/`: Static project assets, including logos and figures.

## Code Conventions

### Lean Conventions

- Indent Lean code by 2 spaces.
- Place `by` on the same line as `:=` when opening a tactic block: `theorem foo : P := by`.
- Indent tactics under `by` blocks.
- Group related definitions within descriptive `namespace` declarations.
- Add docstrings (`/-- ... -/`) to every exported definition and theorem.

### Git and Development Conventions

- Test all changes locally with `make test` before submitting pull requests.
- Ensure formatting and pre-commit hooks pass with `make test-hooks`.
- Keep commits focused on a single logical change.

## Required Validation

Run the narrowest relevant checks, then expand if the change crosses layers.

| Area                | Command           | Use When                                         |
|---------------------|-------------------|--------------------------------------------------|
| Project compilation | `make build`      | Lean code, library, or executable changed        |
| Test suite          | `make test`       | Any proof, definition, or test logic changed     |
| Config check        | `make check`      | Changes to `lakefile.lean` or build targets      |
| Linter check        | `make lint`       | Warning checks before submitting changes         |
| Git hooks           | `make test-hooks` | Before pushing commits or creating pull requests |

Minimum expectations:

- Lean code changes: `make build` and `make test`.
- Tooling or workflow changes: `make check` and `make test`.
- Pre-submission check: `make test-hooks`.

## Change Design Checklist

Before coding:

1. Identification of target modules and dependencies.
2. Clarification of theorem statements, assumptions, and proof strategy.
3. Verification of toolchain version compatibility.

Before submitting:

1. Clean build via `make build`.
2. Passing test suite via `make test`.
3. Absence of warnings with `make lint`.
4. Passing status for Git hooks via `make test-hooks`.
