#!/bin/bash

pacman -Qq | grep -E "(hypr|aqua)" | grep -- -git | paru -Syu --rebuild --noconfirm -
