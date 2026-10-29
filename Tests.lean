import TemplateLeanProject

/-- Helper function to assert a test condition. -/
def runTest (name : String) (cond : Bool) : IO Unit := do
  if cond then
    IO.println s!"[PASS] {name}"
  else
    throw (IO.userError s!"[FAIL] {name}")

/-- Main test runner. -/
def main : IO Unit := do
  IO.println "Running test suite..."
  runTest "factorial 0 is 1" (TemplateLeanProject.factorial 0 == 1)
  runTest "factorial 1 is 1" (TemplateLeanProject.factorial 1 == 1)
  runTest "factorial 5 is 120" (TemplateLeanProject.factorial 5 == 120)
  runTest "hello greeting" (TemplateLeanProject.hello == "Lean 4")
  IO.println "All tests passed successfully!"
