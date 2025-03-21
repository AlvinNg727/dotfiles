#!/bin/bash

copy() {
    grim -g "$(slurp)" - | wl-copy
    # dunstify -a "SCREENSHOT" "Screenshot saved to clipboard" -u normal
}

copy_full() {
    grim -o "$(hyprctl activeworkspace | awk '/^workspace/{print $7}' | tr -d :)" - | wl-copy
    # dunstify -a "SCREENSHOT" "Screenshot saved to clipboard" -u normal
}

save() {
    grim -g "$(slurp)" $(xdg-user-dir PICTURES)/$(date +'%s_screenshot.png')
    # dunstify -a "SCREENSHOT" "Screenshot saved to ~/Pictures" -u normal
}

save_full() {
    grim -o "$(hyprctl activeworkspace | awk '/^workspace/{print $7}' | tr -d :)" $(xdg-user-dir PICTURES)/$(date + '%s_screenshot.png')
    # dunstify -a "SCREENSHOT" "Screenshot saved to ~/Pictures" -u normal
}

case "$1" in
    copy) copy;;
    copy_full) copy_full;;
    save) save;;
    save_full) save_full;;
esac
