#written by Donovan Greene
local num2hex do={
    local s ""
    while ($1>0) do={
        local i ($1%16)
        set s ([pick "0123456789ABCDEF" $i ($i+1)].$s)
        set $1 ($1/16)
    }
    return $s
}