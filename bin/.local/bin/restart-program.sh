#!/bin/bash

pkill -x "$1"
setsid -f "$1" >/dev/null 2>&1 &
