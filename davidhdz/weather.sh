#!/usr/bin/env bash
#
curl wttr.in/Berlin 2>&1 | grep -A 6 "Weather report" | sed '1,3d' |sed "s,\x1B\[[0-9;]*[a-zA-Z],,g" | sed -E 's/^.{15}//' | paste -sd "|" - | sed "s/ \+//g" | sed 's/|/${color2} wind${color} / ; s/|/${color2} view${color} / ; s/|/${color2} rain${color} / ; s/^/${color2}Weather: T${color} /'
