#!/bin/sh

case "$1" in
    *.7z) 7z l "$1";;
    *.md) glow -s dark "$1";;
    *.pdf) pdftotext "$1" -;;
    *.rar) unrar l "$1";;
    *.tar*) tar tf "$1";;
    *.zip) unzip -l "$1";;
    *rc|*bash*) highlight "$1" -O ansi --syntax sh;;
    *) highlight -O ansi "$1" --force || true;;
esac
