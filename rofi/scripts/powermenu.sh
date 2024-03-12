dir="$HOME/.config/rofi/scripts"

lastlogin=$(last $USER | head -n1 | tr -s ' ' | cut -d' ' -f4,5,6)
uptime=$(uptime -p | sed -e "s/up //g")
host=$(hostname)

shutdown=" Shutdown"
reboot="󰃨 Reboot"
donotdisturb=" Do Not Disturb"
lock=" Lock"
yes=" Yes"
no=" No"

confirm_cmd() {
	rofi -theme-str 'window {location: center; anchor: center; fullscreen: false; width: 350px;}' \
		-theme-str 'mainbox {children: [ "message", "listview" ];}' \
		-theme-str 'listview {columns: 2; lines: 1;}' \
		-theme-str 'element-text {horizontal-align: 0.5;}' \
		-theme-str 'textbox {horizontal-align: 0.5;}' \
		-dmenu \
		-p 'Confirmation' \
		-mesg 'Are you Sure?' \
		-theme ${dir}/powermenu.rasi
}

confirm_exit() {
	echo -e "$yes\n$no" | confirm_cmd
}

rofi_cmd() {
    rofi -dmenu \
        -p "󰀓 $USER@$host" \
        -mesg "󰍹 Last Login: $lastlogin |  Uptime: $uptime" \
        -theme ${dir}/powermenu.rasi
}

run_rofi() {
	echo -e "$lock\n$donotdisturb\n$reboot\n$shutdown" | rofi_cmd
}

run_cmd() {
    selected=$(confirm_exit)
    if [[ $selected == $yes ]]; then
        if [[ $1 == "--shutdown" ]]; then
            systemctl poweroff
        elif [[ $1 == "--reboot" ]]; then
            systemctl reboot
        fi
    else
        exit 0
    fi
}

chosen=$(run_rofi)
case $chosen in
    $shutdown)
        run_cmd --shutdown
        ;;
    $reboot)
        run_cmd --reboot
        ;;
    $donotdisturb)
        ~/.config/hypr/scripts/notification
        ;;
    $lock)
        hyprlock
        ;;
esac
