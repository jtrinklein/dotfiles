#!/usr/local/env bash

# show hidden files in finder
defaults write com.apple.finder AppleShowAllFiles YES

# remap CapsLock to Escape
hidutil property --set '{"UserKeyMapping": [{"HIDKeyboardModifierMappingSrc":0x700000039,"HIDKeyboardModifierMappingDst":0x700000029}]}'


