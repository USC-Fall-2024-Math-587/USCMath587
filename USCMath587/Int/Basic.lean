import Batteries.Data.Int.Lemmas

namespace Int

theorem natAbs_emod_lt_natAbs (m : Int) {n : Int} (hn : n ≠ 0) :
    (m % n).natAbs < n.natAbs := by
  obtain ⟨n, hn | hn⟩ := eq_nat_or_neg n
  · rw [hn]
    exact natAbs_lt_natAbs_of_nonneg_of_lt (emod_nonneg _ (by omega)) (emod_lt_of_pos _ (by omega))
  · rw [hn, emod_neg, natAbs_neg]
    exact natAbs_lt_natAbs_of_nonneg_of_lt (emod_nonneg _ (by omega)) (emod_lt_of_pos _ (by omega))
