#!/bin/bash
pkcon -n refresh
upgradeable=$(sudo apt list --upgradeable | grep -v "Lis\|Done" | wc -l)
notify-send -i system-software-update "$upgradeable new software updates are available."
