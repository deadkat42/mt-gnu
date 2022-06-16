#deletes directory or file specified, always recursive and will not ask for confirmation
#deleting a directory will always delete all files and subdirecti=ories it contains
#similar to linux rm

:global rm do={
    /file remove numbers=[find name~"$1"]
    :put "$1 has been deleted"
}