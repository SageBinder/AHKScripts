SetKeyDelay, -1

sequences := {"not": "¬"
    , "negate": "¬"
    , "negation": "¬"

    , "and": "∧"
    , "conjunction": "∧"

    , "or": "∨"
    , "idisjunction": "∨"
    , "idisjunct": "∨"

    , "xor": "⊕"
    , "xdisjunction": "⊕"
    , "xdisjunct": "⊕"

    , "therefore": "∴"

    , "if": "⇒"
    , "then": "⇒"
    , "implication": "⇒"
    , "implies": "⇒"

    , "iff": "⇔"
    , "equivalence": "⇔"
    , "equals": "⇔"
    , "equal": "⇔"

    , "nequals": "≠"
    , "nequal": "≠"
    , "notequals": "≠"
    , "notequal": "≠"
    , "unequal": "≠"

    , "all": "∀"
    , "forall": "∀"
    , "universal": "∀"

    , "exists": "∃"
    , "existential": "∃"

    , "define": "≔"
    , "defined": "≔"
    , "def": "≔"

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

    , "minus": "−"
    , "subtract": "−"
    , "min": "−"

    , "in": "∈"

    , "notin": "∉"

    , "union": "∪"

    , "subset": "⊆"
    , "subsetof": "⊆"

    , "propersubset": "⊂"
    , "psubset": "⊂"
    , "strictsubset": "⊂"

    , "intersection": "∩"
    , "intersect": "∩"
    , "intersects": "∩"

    , "sdiff": "⊕"
    , "symdiff": "⊕"
    , "symdifference": "⊕"
    , "symmetricdifference": "⊕"

    , "emptyset": "∅"
    , "empty": "∅"
    , "eset": "∅"

    , "leq": "≤"

    , "geq": "≥"

    , "natural": "ℕ"
    , "naturals": "ℕ"
    , "naturalnums": "ℕ"
    , "naturalnumbers": "ℕ"

    , "integers": "ℤ"
    , "integer": "ℤ"
    , "ints": "ℤ"

    , "rational": "ℚ"
    , "rationals": "ℚ"
    , "rationalnums": "ℚ"
    , "rationalnumbers": "ℚ"

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

    , "real": "ℝ"
    , "reals": "ℝ"
    , "realnums": "ℝ"
    , "realnumbers": "ℝ"

    , "imaginary": "𝕀"
    , "imaginaries": "𝕀"
    , "imaginarynums": "𝕀"
    , "imaginarynumbers": "𝕀"

    , "complex": "ℂ"
    , "complexnums": "ℂ"
    , "complexnumbers": "ℂ"

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


~0::
~1::
~a::
~b::
~c::
~d::
~e::
~f::
~g::
~h::
~i::
~j::
~k::
~l::
~m::
~n::
~o::
~p::
~q::
~r::
~s::
~t::
~u::
~v::
~w::
~x::
~y::
~z::
    substring := SubStr(A_ThisHotkey, 2)
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