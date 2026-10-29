import Lake
open Lake DSL

package «template-lean-project» where
  version := v!"0.1.0"
  keywords := #["lean4", "template", "mathlib"]
  leanOptions := #[
    ⟨`pp.unicode.fun, true⟩,
    ⟨`autoImplicit, false⟩,
    ⟨`relaxedAutoImplicit, false⟩
  ]

require "leanprover-community" / "mathlib" @ "git#v4.35.0"

@[default_target]
lean_lib «TemplateLeanProject» where
  -- Add library configuration options here

@[test_driver]
lean_lib «Tests» where
  -- Test suite module

lean_exe «template-lean-project» where
  root := `Main
