import Batteries

/-!
# Caeserian ciphers
-/

-- Using a custom enum type
section Attempt1

-- Let's build an alphabet for our cipher
inductive Alphabet : Type where
  | a : Alphabet
  | b : Alphabet
  | c : Alphabet
  | d : Alphabet
  | e : Alphabet
  | f : Alphabet
  | g : Alphabet
  | h : Alphabet
  | i : Alphabet
  | j : Alphabet
  | k : Alphabet
  | l : Alphabet
  | m : Alphabet
  | n : Alphabet
  | o : Alphabet
  | p : Alphabet
  | q : Alphabet
  | r : Alphabet
  | s : Alphabet
  | t : Alphabet
  | u : Alphabet
  | v : Alphabet
  | w : Alphabet
  | x : Alphabet
  | y : Alphabet
  | z : Alphabet
  | space : Alphabet

-- We don't want to have to write out the alphabet every time we want to use it
open Alphabet

/--
error: expression
  a
has type
  Alphabet
but instance
  Lean.MetaEval Alphabet
failed to be synthesized, this instance instructs Lean on how to display the resulting value, recall that any type implementing the `Repr` class also implements the `Lean.MetaEval` class
-/
#guard_msgs in
#eval a

-- We want to be able to print the alphabet so let's build a function that gives
-- a string representation of the alphabet
def Alphabet.toString' : Alphabet → String
  | a => "a"
  | b => "b"
  | c => "c"
  | d => "d"
  | e => "e"
  | f => "f"
  | g => "g"
  | h => "h"
  | i => "i"
  | j => "j"
  | k => "k"
  | l => "l"
  | m => "m"
  | n => "n"
  | o => "o"
  | p => "p"
  | q => "q"
  | r => "r"
  | s => "s"
  | t => "t"
  | u => "u"
  | v => "v"
  | w => "w"
  | x => "x"
  | y => "y"
  | z => "z"
  | space => " "

-- This tells Lean to fill in with the output of `toString` when we have a
-- letter of out alphabet and we need a string
instance : ToString Alphabet where
  toString := toString'

-- Now we can evaluate letters in our alphabet
#eval a

-- Next we need words from our alphabet
abbrev Word := List Alphabet

instance : ToString Word where
  toString w := w.foldl (fun s letter => s ++ toString letter) ""
  -- toString w := Id.run do
  --   let mut s := ""
  --   for letter in w do
  --     s := s ++ toString letter
  --   return s

def hello : Word := [h, e, l, l, o]

#eval hello

-- We should probably build a `fromString` function and also a way to associate letters
-- in our alphabet to their index

-- This is built in
def index (letter : Alphabet) : Nat :=
  Alphabet.toCtorIdx letter

end Attempt1

section Attempt2 -- Using `Fin n`

#print Fin

def Alphabet' := Fin 26

def shift (m : Nat) : Alphabet' → Alphabet'
  | ⟨n, _⟩ => ⟨(n + m) % 26, Nat.mod_lt _ (by omega)⟩

#print String
#print Char

section Attempt3

def shiftChar (m : Nat) (c : Char) : Char :=
  let a := 'a'.toNat
  let c' := c.toNat
  let c'' := (c' - a + m) % 26 + a
  Char.ofNat c''

end Attempt3
