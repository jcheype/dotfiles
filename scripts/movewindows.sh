#!/usr/bin/env bash

hyprctl dispatch movetoworkspacesilent '1,title:.* Microsoft Teams'
hyprctl dispatch movetoworkspacesilent '1, title:.* Google Chrome'
hyprctl dispatch movetoworkspacesilent '1, title:sixense.sh'
hyprctl dispatch focuswindow title:sixense.sh
hyprctl dispatch movewindow r
hyprctl dispatch movewindow r
hyprctl dispatch movewindow r
