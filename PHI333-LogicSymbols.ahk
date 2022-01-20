#MaxHotkeysPerInterval, 10000
SetKeyDelay, -1

; These symbols match the symbols used in Logic & Philosophy: A Modern Introduction, 13th Edition, by Hasuman, Boardman, and Kahane

sequences := {"neg": "~"
    , "not": "~"

    , "and": "·"

    , "or": "∨"

    , "implies": "⊃"
    , "then": "⊃"
    , "if": "⊃"

    , "iff": "≡"

    , "to": "→"

    , "iffa": "⟷"

    , "therefore": "∴"
    , "thus": "∴"

    , "all": "∀"
    , "forall": "∀"
    , "universal": "∀"
    , "a": "∀"

    , "exists": "∃"
    , "existential": "∃"
    , "e": "∃"

    , "xor": "⊕"

    , "provable": "⊢"

    , "entails": "⊨"

    , "true": "⊤"

    , "false": "⊥"

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

queueLength = maxNameLength * 2

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
    if StrLen(inputQueue) > queueLength
        inputQueue := SubStr(inputQueue, (queueLength - 1) * -1)
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