#! /bin/bash

PATH="$(pwd)"
HTTP_PATH="/etc/httpd"
INSTALLATION="$HTTP_PATH/commands"
COMPLETIONS_PATH="/usr/share/bash-completion/completions"

binPath="/usr/bin"
verbose=

[ "$(/bin/whoami)" != "root" ] && exec /bin/sudo -- "$0" "$@"

while [ $# -gt 0 ] ; do
  case $1 in
    -v) verbose="-v" ;;
    --bin-path) binPath=$2 ;;
  esac
  shift
done

function _create_folder {
    /bin/mkdir $INSTALLATION

    if [ ! -d "$INSTALLATION" ]; then
        echo "Folder cannot be created"
        exit 2
    fi
}

function _create_vhost_folder {
    vhost=( "sites-enabled" "sites-available" )
    for vhost_folder in ${vhost[@]}; do
        local folder="$HTTP_PATH/$vhost_folder"

        if [ ! -d $folder ]; then
            /bin/mkdir $verbose "$folder"
        else
            if [ -z "$verbose" ]; then
                echo "The folder \"$folder\" already exists skipping"
            fi
        fi
    done
}

function _install_commands {
    # Install commands
    for file in $(/bin/ls -1 "$PATH/commands/"); do
        /bin/cp $verbose "$PATH/commands/$file" "$INSTALLATION/$file"
        
        if [ ! -f "$INSTALLATION/$file" ]; then
            echo "Failed to install $file command"
        else 
            /bin/chmod $verbose +x "$INSTALLATION/$file"
            /bin/install $verbose "$INSTALLATION/$file" "$binPath/$file"
        fi
    done

    _create_vhost_folder
}

function _set_autocomplete {
    for file in $(/bin/ls -1 "$PATH/profile/"); do
        /bin/chmod $verbose +x "$PATH/profile/$file"
        /bin/cp $verbose "$PATH/profile/$file" "$COMPLETIONS_PATH/$file"
    done
}

if [ ! -d $INSTALLATION ]; then 
    _create_folder
fi

_install_commands
_set_autocomplete