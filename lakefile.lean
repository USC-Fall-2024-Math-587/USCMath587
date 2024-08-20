import Lake
open Lake DSL

package "USCMath587" where

require "leanprover-community" / "batteries" @ git "main"

@[default_target]
lean_lib «USCMath587» where

