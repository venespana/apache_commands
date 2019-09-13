#! /bin/bash

PATH="$(pwd)"
INSTALLATION="/etc/httpd/commands"
PROFILE_PATH="/etc/profile.d"

binPath="/usr/bin"
verbose=

if [[ $EUID -ne 0 ]]; then
   echo "This script must be run as root" 
   exit 1
fi


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
}

function _set_autocomplete {
    for file in $(/bin/ls -1 "$PATH/profile/"); do
        /bin/chmod $verbose +x "$PATH/profile/$file"
        /bin/cp $verbose +x "$PATH/profile/$file" "$PROFILE_PATH"
    done

    # source /etc/profile
}

if [ ! -d $INSTALLATION ]; then 
    _create_folder
fi

_install_commands
_set_autocomplete