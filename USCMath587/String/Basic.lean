import Batteries.Data.List.Basic

/--
`s.toChunks n` splits the string into strings of size at most `n`,
such that `String.join (s.toChunks n) = s`.
-/
def String.chunks (n : Nat) (s : String) : List String :=
  s.data.toChunks n |>.map (fun l => ⟨l⟩)

theorem Char.toUpper_isUpper_of_isLower (c : Char) (h : c.isLower) : c.toUpper.isUpper := by
  simp only [isLower, ge_iff_le, Bool.and_eq_true, decide_eq_true_eq] at h
  have bounds : 97 ≤ c.toNat ∧ c.toNat ≤ 122 := h
  have bounds' : (c.toNat - 32).isValidChar := by omega
  simp only [isUpper, toUpper, ge_iff_le, bounds, and_self, ↓reduceIte, ofNat, bounds', ↓reduceDIte,
    ofNatAux, Bool.and_eq_true, decide_eq_true_eq]
  change 65 ≤ c.toNat - 32 ∧ c.toNat - 32 ≤ 90
  omega

theorem Char.toLower_isLower_of_isUpper (c : Char) (h : c.isUpper) : c.toLower.isLower := by
  simp only [isUpper, ge_iff_le, Bool.and_eq_true, decide_eq_true_eq] at h
  have bounds : 65 ≤ c.toNat ∧ c.toNat ≤ 90 := h
  have bounds' : (c.toNat + 32).isValidChar := by omega
  simp only [isLower, toLower, ge_iff_le, bounds, and_self, ↓reduceIte, ofNat, bounds', ↓reduceDIte,
    ofNatAux, Bool.and_eq_true, decide_eq_true_eq]
  change 97 ≤ c.toNat + 32 ∧ c.toNat + 32 ≤ 122
  omega
