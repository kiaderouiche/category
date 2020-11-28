/^[^:]\{1,\}:.*\\$/{
    h
    s/\([^:]\{1,\}:\).*/\1/
    x
    s/[^:]\{1,\}://
}
/\\$/,/^$/bgen
/\\$/,/[^\\]$/{
:gen
    s/[[:blank:]]*\\$//
    s/^[[:blank:]]*//
    G
    s/\(.*\)\n\(.*\)/\2 \1/
}
/^[^:]\{1,\}:[[:blank:]]*$/d
/^[^:]\{1,\}\.o:/{
    s/[[:blank:]]*[^[:blank:]]\{1,\}\.[cC][[:blank:]]*/ /g
    s/[[:blank:]]*[^[:blank:]]\{1,\}\.[cC]$//g
    s/[[:blank:]]*[^[:blank:]]\{1,\}\.cc[[:blank:]]*/ /g
    s/[[:blank:]]*[^[:blank:]]\{1,\}\.cc$//g
    s/[[:blank:]]*[^[:blank:]]\{1,\}\.cpp[[:blank:]]*/ /g
    s/[[:blank:]]*[^[:blank:]]\{1,\}\.cpp$//g
    /^[^:]\{1,\}:[[:blank:]]*$/d
    s/^\([^:]\{1,\}\)\.o[[:blank:]]*:[[:blank:]]*\(.*\)/\1.d: $(wildcard \2)\
&/
}