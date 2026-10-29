import Lake
open Lake DSL

package «template-lean-project» where
  version := v!"0.1.0"
  keywords := #["lean4", "template", "theorem-proving"]
  leanOptions := #[
    ⟨`autoImplicit, false⟩,
    ⟨`relaxedAutoImplicit, false⟩
  ]

lean_lib «TemplateLeanProject» where
  -- Add library configuration options here

@[default_target]
lean_exe «template-lean-project» where
  root := `Main

@[test_driver]
lean_exe «test» where
  root := `Tests
