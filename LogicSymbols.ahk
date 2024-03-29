﻿#MaxHotkeysPerInterval, 10000
SetKeyDelay, -1

sequences := {"neg": "¬"
    , "not": "¬"
    , "negate": "¬"
    , "negation": "¬"

    , "and": "∧"

    , "or": "∨"

    , "xor": "⊕"

    , "therefore": "∴"
    , "thus": "∴"

    , "to": "→"

    , "if": "⇒"
    , "then": "⇒"    
    , "implication": "⇒"
    , "implies": "⇒"

    , "iff": "⇔"

    , "neq": "≠"

    , "a": "∀"
    , "all": "∀"
    , "forall": "∀"
    , "universal": "∀"

    , "e": "∃"
    , "exists": "∃"
    , "existential": "∃"

    , "define": "≔"
    , "defined": "≔"
    , "def": "≔"

    , "equiv": "≡"

    , "approx": "≈"

    , "provable": "⊢"

    , "entails": "⊨"

    , "true": "⊤"
    , "tautology": "⊤"
    , "top": "⊤"
    , "1": "⊤"

    , "false": "⊥"
    , "contradiction": "⊥"
    , "bottom": "⊥"
    , "0": "⊥"

    , "mult": "×"
    , "product": "×"
    , "times": "×"
    , "cross": "×"

    , "minus": "−"
    , "subtract": "−"
    , "min": "−"

    , "in": "∈"
    , "element": "∈"
    , "elementof": "∈"

    , "notin": "∉"

    , "union": "∪"
    , "cup": "∪"

    , "intersection": "∩"
    , "intersect": "∩"
    , "intersects": "∩"
    , "cap": "∩"

    , "subseteq": "⊆"

    , "subset": "⊂"

    , "supseteq": "⊇"

    , "supset": "⊃"

    , "sdiff": "⊕"
    , "symdiff": "⊕"
    , "symdifference": "⊕"
    , "symmetricdifference": "⊕"

    , "emptyset": "∅"
    , "empty": "∅"
    , "eset": "∅"

    , "leq": "≤"

    , "geq": "≥"

    , "dot": "·"
    , "cdot": "·"

    , "circ": "∘"

    , "ellipsis": "…"
    , "dotdotdot": "…"
    , "dots": "…"

    , "n": "ℕ"
    , "natural": "ℕ"
    , "naturals": "ℕ"
    , "naturalnums": "ℕ"
    , "naturalnumbers": "ℕ"

    , "z": "ℤ"
    , "integers": "ℤ"
    , "integer": "ℤ"
    , "ints": "ℤ"

    , "q": "ℚ"
    , "rational": "ℚ"
    , "rationals": "ℚ"
    , "rationalnums": "ℚ"
    , "rationalnumbers": "ℚ"

    , "p": "ℙ"
    , "irrational": "ℙ"
    , "irrationals": "ℙ"
    , "irrationalnums": "ℙ"
    , "irrationalnumbers": "ℙ"
    , "positivenumbers": "ℙ"
    , "positives": "ℙ"
    ," positive": "ℙ"
    , "positivenums": "ℙ"

    , "algebraic": "𝔸"
    , "algebraics": "𝔸"
    , "algebraicnums": "𝔸"
    , "algebraicnumbers": "𝔸"

    , "r": "ℝ"
    , "real": "ℝ"
    , "reals": "ℝ"
    , "realnums": "ℝ"
    , "realnumbers": "ℝ"

    , "imaginary": "𝕀"
    , "imaginaries": "𝕀"
    , "imaginarynums": "𝕀"
    , "imaginarynumbers": "𝕀"

    , "c": "ℂ"
    , "complex": "ℂ"
    , "complexnums": "ℂ"
    , "complexnumbers": "ℂ"

    , "phi": "φ"

    , "heart": "♡"}

inputQueue =

maxNameLength := 0
for name, _ in sequences
{
    currentLength := StrLen(name)
    if currentLength > %maxNameLength%
    {
        maxNameLength := currentLength
    }
}


~$0::
~$1::
~$a::
~$b::
~$c::
~$d::
~$e::
~$f::
~$g::
~$h::
~$i::
~$j::
~$k::
~$l::
~$m::
~$n::
~$o::
~$p::
~$q::
~$r::
~$s::
~$t::
~$u::
~$v::
~$w::
~$x::
~$y::
~$z::
    substring := SubStr(A_ThisHotkey, 3)
    inputQueue .= substring
    if StrLen(inputQueue) > maxNameLength
        inputQueue := SubStr(inputQueue, (maxNameLength - 1) * -1)
Return


$^enter::
$^'::
    stringLength := StrLen(inputQueue)

    longestMatchedNameLength := 0
    longestMatchedNameSymbol =

    for name, symbol in sequences
    {
        nameLength := StrLen(name)
        substring := SubStr(inputQueue, (nameLength - 1) * -1)

        if (nameLength > longestMatchedNameLength) && (RegExMatch(name, "^" substring "$"))
        {
            longestMatchedNameLength = %nameLength%
            longestMatchedNameSymbol = %symbol%
        }
    }

    if longestMatchedNameLength > 0
    {
        send {BS %longestMatchedNameLength%}
        send %longestMatchedNameSymbol%
    }        
Return

~$BackSpace::
    inputQueue := SubStr(inputQueue, 1, StrLen(inputQueue) - 1)
Return