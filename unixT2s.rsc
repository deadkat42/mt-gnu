:global unixT2S do={
    :local time2parse [:timestamp]
    :local w [:find $time2parse "w"]
    :local d [:find $time2parse "d"]
    :local c [:find $time2parse ":"]
    :local p [:find $time2parse "."]
    :local weeks [:pick $time2parse 0 [$w]]
    :set $weeks ($weeks * 604800) 
    :local days [:pick $time2parse ($w + 1) $d]
    :set days ($days * 86400)
    :local hours [:pick $time2parse ($d + 1) $c]
    :set hours ($hours * 3600)
    :local minutes [:pick $time2parse ($c + 1) [:find $time2parse ($c + 3)]]
    :set minutes ($minutes * 60)
    :local seconds [:pick $time2parse ($c + 4) $p]
    :local nanoseconds [:pick $time2parse ($p + 1) [:len $time2parse]]

   # rawtime returns a number but is only accurate to the second
   # precisetime returns a string but gives full nanosecond accuracy
   # uncomment which one you would like returned
    :local rawtime ($weeks+$days+$hours+$minutes+$seconds)
    :return $rawtime
    :local precisetime ("$rawtime"."."."$nanoseconds")
    #:return $precisetime
}