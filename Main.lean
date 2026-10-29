module

import TemplateLeanProject

def main : IO Unit := do
  IO.println s!"Hello from {TemplateLeanProject.hello}!"
  IO.println s!"factorial 5 = {TemplateLeanProject.factorial 5}"
