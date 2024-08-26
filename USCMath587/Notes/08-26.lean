import Batteries
-- import USCMath587.08-26-Secret

structure Alphabet where
  char : Char
  isLowerCaseLetter : char.isLower
deriving DecidableEq, Repr

theorem Char.toLower_isLower_of_isUpper (c : Char) (h : c.isUpper) : c.toLower.isLower := sorry

def String.toAlphabetList (s : String) : List Alphabet :=
  s.foldl (init := []) fun acc c =>
    if h : c.isLower then
      { char := c, isLowerCaseLetter := h } :: acc
    else if h : c.isUpper then
      { char := c.toLower, isLowerCaseLetter := c.toLower_isLower_of_isUpper h } :: acc
    else acc

def AlphabetList.toString (l : List Alphabet) : String :=
  l.foldl (init := "") fun acc a => acc.push a.char

instance : ToString Alphabet where
  toString a := a.char.toString

instance : ToString (List Alphabet) where
  toString l := l.foldl (init := "") fun acc a => acc ++ toString a

def Alphabet.shift (a : Alphabet) (n : Nat) : Alphabet :=
  let c := a.char.toNat - 'a'.toNat
  let c' := (c + n) % 26
  { char := Char.ofNat ('a'.toNat + c'), isLowerCaseLetter := sorry }

def encode (s : String) (n : Nat) : String :=
  toString (s.toAlphabetList.map fun a => a.shift n)

#eval encode "hello" 3

