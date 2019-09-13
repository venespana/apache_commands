#/usr/bin/env bash

# Copyright 2019 Alejandro de Tovar
# 
# Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:
# 
# The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.
# 
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

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