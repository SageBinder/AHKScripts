SetKeyDelay, -1

sequences := {"not": "¬"
    , "negate": "¬"
    , "negation": "¬"

    , "and": "∧"
    , "conjunction": "∧"

    , "or": "∨"
    , "idisjunction": "∨"

    , "xor": "⊕"
    , "xdisjunction": "⊕"

    , "if": "⇒"
    , "then": "⇒"
    , "implication": "⇒"

    , "iff": "⇔"
    , "equivalence": "⇔"
    , "equals": "⇔"
    , "equal": "⇔"

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
    , "0": "⊥"}

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