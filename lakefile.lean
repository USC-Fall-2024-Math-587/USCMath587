import Lake
open Lake DSL

package "USCMath587" where

require "leanprover-community" / "mathlib" @ git "master"

@[default_target]
lean_lib «USCMath587» where

