#will create files with the name specified if it does not already exist, similar to linux touch
#this will set the file to have contents of " "
#if the file already exists this will do nothing

#add a user that can only ftp, the password for this user will be stored as a global and can be viewed by anyone with sensitive permission
:global touch do={
    :local c "Created by the touch function"
    :if ([:len[/user print as-value where name=FTPOnly]]=0) do={
        :put "creating FTPOnly group and user with only r/w and ftp permissions"
        :local passwgen do={
            #create a cert and use first 20 characters of cert fingerprint as random string for password
            /certificate add name=rndstr common-name=rndstr
            /certificate sign rndstr
            :while ([:len [/certificate get rndstr fingerprint]]=0) do={
                :delay 500ms
            }
            :global FTPPass [:pick [/certificate get rndstr fingerprint] 0 20]
            /certificate remove rndstr
        }
        $passwgen
        /user group add name=FTPOnly comment=$c policy=!api,!dude,ftp,!local,!password,!policy,read,!reboot,!romon,!sensitive,!sniff,!ssh,!telnet,!test,!tikapp,!web,!winbox,write
        /user add name-FTPOnly group=FTPOnly comment=$c
    }
            
}