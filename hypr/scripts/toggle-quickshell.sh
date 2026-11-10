#!/bin/sh

PID=$(pgrep -f 'quickshell.*dynamic-island/shell.qml')

if [ -n "$PID" ]; then
    quickshell kill -p ~/.config/quickshell/dynamic-island/shell.qml
else
    quickshell -p ~/.config/quickshell/dynamic-island/shell.qml
fi
