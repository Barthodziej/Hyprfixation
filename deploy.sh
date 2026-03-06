#!/bin/bash

config_subdirs=(.config/*)
for dir in "${config_subdirs[@]}"
do
    cp -r $dir ~/Documents/.config --update=all
done

wallpapers=(wallpapers/*)
for file in "${wallpapers[@]}"
do
    cp -r $file ~/Pictures/Wallpapers --update=all
done
