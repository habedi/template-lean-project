module

import Mathlib.Data.Nat.Basic
import Mathlib.Tactic

namespace TemplateLeanProject

/-- A friendly greeting constant. -/
def hello : String := "Lean 4 with Mathlib"

/-- Compute the factorial of a natural number. -/
def factorial : Nat → Nat
  | 0 => 1
  | n + 1 => (n + 1) * factorial n

/-- Factorial of zero is 1. -/
theorem factorial_zero : factorial 0 = 1 := rfl

/-- Factorial is always positive for any natural number. -/
theorem factorial_pos (n : Nat) : factorial n > 0 := by
  induction n with
  | zero =>
    decide
  | succ n ih =>
    simp [factorial]
    exact ih

/-- Example theorem verified using Mathlib tactics. -/
theorem add_comm_three (a b c : Nat) : a + b + c = c + b + a := by
  omega

end TemplateLeanProject
