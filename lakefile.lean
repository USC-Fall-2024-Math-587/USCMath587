import Lake
open Lake DSL

package "USCMath587" where

require "leanprover-community" / "batteries" @ git "v4.10.0"

@[default_target]
lean_lib «USCMath587» where

