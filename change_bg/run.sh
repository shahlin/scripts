#!/bin/bash

####################################################################
#                       Shahlin Ibrahim                            #
#    NOTE: MAKE SURE TO CHANGE THE LOCATIONS WHEREVER NECESSARY    #
####################################################################

# Set DBUS_SESSION_BUS_ADDRESS
source /home/shahlin/.scripts/change_bg/set_dbus_path.sh gnome

# Path to the wallpapers directory
DIR="/home/shahlin/Pictures/Wallpapers/"

# Array to hold the filenames
declare -a wallpapers=() 

# Get folder contents a.k.a all wallpapers
for wallpaper in "$DIR"*
do
    wallpapers+=(${wallpaper:${#DIR}})
done

# Get number of wallpapers in the folder
wallpapers_count=${#wallpapers[@]}

if [ "$wallpapers_count" -ne 0 ]
then
    # Get a random number from 0 and ending at wallpapers count
    random_num=$(( RANDOM % $wallpapers_count ))
fi

# Random wallpaper
random_wallpaper=${wallpapers[$random_num]}

# Set desktop background
gsettings set org.gnome.desktop.background picture-uri file://${DIR}/${random_wallpaper}
