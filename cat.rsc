#written by Andrew Capps
#returns the contents of a file, similar to linux cat command
:global cat do={
    :local t [/file get $1 contents]
    :return $t
}
