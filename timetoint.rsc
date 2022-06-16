:global timetoint do={
    :local ct [:timestamp]
    :global unixtime 0
    :local w [:pick $ct 0 [:find $ct w]]
    :set $w ($w*7*24*60*60)
    :local d [:pick $ct ([:find $ct w]+1) [:find $ct d]]
    :set $d ($d*24*60*60)
    :local h [:pick $ct ([:find $ct d]+1) [:find $ct ":"]]
    :set $h ($h*60*60)
    :local m [:pick $ct ([:find $ct ":"]+1) ([:find $ct "."]-3)]
    :set $m ($m*60)
    :local s [:pick $ct ([:find $ct "."]-2) [:find $ct "."] ]
    :local n [:pick $ct ([:find $ct "."]+1)]
    :if ($n<5) do={:nothing} else={:set $s ($s+1)}
    :set $unixtime ($w+$d+$h+$m+$s)
    :put $unixtime
}