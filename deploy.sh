#!/bin/bash

config_subdirs=(.config/*)
for dir in "${config_subdirs[@]}"
do
    cp -r $dir ~/.config --update=all
done

backgrounds_source=backgrounds
backgrounds_target=/usr/share/backgrounds
sudo mkdir -p $backgrounds_target 
sudo cp -r $backgrounds_source/* $backgrounds_target --update=all

lightdm_config_source=lightdm
lightdm_config_target=/etc/lightdm
sudo mkdir -p $lightdm_config_target 
sudo cp -r $lightdm_config_source/* $lightdm_config_target --update=all

lightdm_gtk_greeter_theme_source=lightdm-gtk-greeter-theme
lightdm_gtk_greeter_theme_target=/usr/share/themes/lightdm-gtk-greeter/gtk-3.0
sudo mkdir -p $lightdm_gtk_greeter_theme_target 
sudo cp -r $lightdm_gtk_greeter_theme_source/* $lightdm_gtk_greeter_theme_target --update=all
