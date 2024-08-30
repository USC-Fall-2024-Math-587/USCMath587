import Batteries

#check Nat

#check Int

#check Dvd

#print Int.instDvd

#print Nat.instDvd

#print Nat.div

#print Int.div

#check Div

#eval 3 ∣ 5

#eval 5 ∣ 20

#eval 20 / 5

#eval 20 / 6

#check Int.dvd_trans

#check Int.dvd_antisymm

#check Int.dvd_add

#check Int.dvd_neg

#check Int.dvd_sub

set_option trace.Meta.synthInstance true in
example (n : Nat) : Int := n

#check Nat.gcd
