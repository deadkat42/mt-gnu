#uses dns to check for internet connectivity
#written by Andrew Capps

:global detectinternet do={   
    /ip dns cache flush
    :do {
      :global internet
      :resolve google.com
      :set $internet true
    } on-error={:set $internet false}
}
