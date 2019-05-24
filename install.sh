#!/usr/bin/env bash
rm -rf ./pkg ./src ./menu-**
makepkg -sif --skipinteg --noconfirm

