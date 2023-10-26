#!/bin/bash
NO_FORMAT="\033[0m"
C_GREEN="\033[38;5;2m"
C_TEAL="\033[38;5;6m"
F_BOLD="\033[1m"
echo -e "${F_BOLD}${C_TEAL}Updating DNF:${NO_FORMAT}"
sudo dnf upgrade -y
sudo dnf autoremove -y
echo -e "${F_BOLD}${C_TEAL}\nUpdating Flatpak:${NO_FORMAT}"
flatpak upgrade -y
flatpak uninstall --unused --delete-data
echo -e "${F_BOLD}${C_TEAL}\nUpdating Firmware:${NO_FORMAT}"
fwupdmgr refresh
fwupdmgr upgrade
echo -e "${F_BOLD}${C_TEAL}\nUpdating Neovim:${NO_FORMAT}"
nvim --headless -c "Lazy sync" -c "quit" -c "MasonUpdate" -c "quit"
echo -e "${F_BOLD}${C_GREEN}Done!${NO_FORMAT}"
