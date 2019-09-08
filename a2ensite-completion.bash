#/usr/bin/env bash

HTTP_DIR="/etc/httpd"
HTTP_DIR_AVAILABLE="$HTTP_DIR/sites-available/"
HTTP_DIR_ENABLED="$HTTP_DIR/sites-enabled/"

_available_vhost()
{
    FILES=`ls -1 $HTTP_DIR_AVAILABLE`
    COMPREPLY=($(compgen -W "$FILES" "${COMP_WORDS[1]}"))
}

_enabled_vhost()
{
    FILES=`ls -1 $HTTP_DIR_ENABLED`
    COMPREPLY=($(compgen -W "$FILES" "${COMP_WORDS[1]}"))
}

complete -F _available_vhost a2ensite
complete -F _enabled_vhost a2dissite