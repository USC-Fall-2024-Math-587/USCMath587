import Batteries

section Attempt1

/-
With an inductive type, you specify the ways in which you can construct values of that type.
So here we have an inductive type `Alphabet` with six constructors `a`, `b`, `c`, `d`, `e`, and `f`.
-/
inductive Alphabet : Type where
  | a : Alphabet
  | b : Alphabet
  | c : Alphabet
  | d : Alphabet
  | e : Alphabet
  | f : Alphabet

open Alphabet

/-
We can define functions on this type by pattern matching. This is a construction by cases.
-/
def shift : Alphabet → Alphabet
  | a => b
  | b => c
  | c => d
  | d => e
  | e => f
  | f => a

def string : Alphabet → String
  | a => "a"
  | b => "b"
  | c => "c"
  | d => "d"
  | e => "e"
  | f => "f"

/- This register an instance of the `ToString` type class for the `Alphabet` type.
Instances allow Lean to fill in missing data automatically from previously declared data.
-/
instance : ToString Alphabet where
  toString := string

-- Now we can use `#eval` to evaluate expressions of type `Alphabet`.
#eval shift a

/-
Lists are also inductive types. A list is either empty or it is a head element followed by a tail list.
So to build a function on it is to specify what happens in each of these two cases.
-/
def encode : List Alphabet → List Alphabet
  | [] => [] -- we send the empty list to the empty list
  | x :: xs => shift x :: encode xs -- we shift the head of the list and recursively call
  -- encode on the tail of the list

-- Here is a word to encode
def word : List Alphabet := [d, e, f]

#eval encode word

-- We can also define a function to undo the encoding
def unshift : Alphabet → Alphabet
  | a => f
  | b => a
  | c => b
  | d => c
  | e => d
  | f => e

#eval unshift (shift a)

-- We can prove that unshift is the left inverse of shift
theorem unshift_shift (x : Alphabet) : unshift (shift x) = x := by
  cases x <;> rfl -- this is a tactic proof that splits the proofs into its
  -- six cases and proves each one by reflexivity (definitional equality)

def decode : List Alphabet → List Alphabet
  | [] => []
  | x :: xs => unshift x :: decode xs

#eval decode (encode word)

end Attempt1
