#!/bin/bash

if ! playerctl status >/dev/null 2>&1; then
    echo "{\"text\":\"No active player\", \"alt\":\"No\", \"class\":\"No\"}";
fi

playerctl metadata --format '{{status}}|{{artist}} - {{title}}' -F | while IFS="|" read -r status line; do

    if [[ $status == "" ]]; then
	echo "{\"text\":\"No active player\", \"alt\":\"No\", \"class\":\"No\"}";
    else
	jq -c -n --arg text "$line" --arg class "$status" --arg alt "$status" '{text: $text, alt: $alt, class: $class}' --unbuffered;
    fi

done
