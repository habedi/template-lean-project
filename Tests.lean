module

import TemplateLeanProject

-- Test evaluations using #guard (elaborator-checked assertions)
#guard TemplateLeanProject.factorial 0 == 1
#guard TemplateLeanProject.factorial 1 == 1
#guard TemplateLeanProject.factorial 5 == 120
#guard TemplateLeanProject.hello == "Lean 4 with Mathlib"

-- Test theorem verification using the library
example (a b c : Nat) : a + b + c = c + b + a :=
  TemplateLeanProject.add_comm_three a b c
