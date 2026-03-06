#!/bin/bash

config_subdirs=(.config/*)
for dir in "${config_subdirs[@]}"
do
    cp -r $dir ~/.config --update=all
done

mkdir -p ~/.config/hypr/wallpapers
wallpapers=(wallpapers/*)
for file in "${wallpapers[@]}"
do
    sudo cp $file ~/.config/hypr/wallpapers --update=all
done
