#written by Donovan Greene
local hex2num do={
# strip colons out of mac addresses
    local p [find $1 ":"]
    while ($p) do={
        set $1 ([pick $1 0 $p].[pick $1 ($p+1) [len $1]])
        set p [find $1 ":"]
    }
# calculate the number
    local n 0
    for i from=0 to=([len $1]-1) do={
        local c [pick $1 $i ($i+1)]
        set n (($n*16)+[find "0123456789ABCDEF" $c])
    }
# return the number
    return $n
}