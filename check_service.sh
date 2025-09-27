#!/usr/bin/env bash

check_service() {
    if systemctl is-active --quiet "$1"; then
        echo "$1 is running"
    else
        echo "$1 is not running"
    fi
}

check_service "$1"
