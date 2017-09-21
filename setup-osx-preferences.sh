#!/usr/local/env bash

echo "make home/end behave correctly..."
mkdir -p "$HOME/Library/KeyBindings"
if ! [ -e "$HOME/Library/KeyBindings/DefaultKeyBinding.dict" ]; then
    cp "$DOTHOME/DefaultKeyBinding.dict" "$HOME/Library/KeyBindings/"
fi

# show hidden files in finder
echo "show hidden files in finder..."
defaults write com.apple.finder AppleShowAllFiles YES

# remap CapsLock to Escape
echo "remap CapsLock to Escape..."
hidutil property --set '{"UserKeyMapping": [{"HIDKeyboardModifierMappingSrc":0x700000039,"HIDKeyboardModifierMappingDst":0x700000029}]}'


