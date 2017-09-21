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

echo "configure dock preferences..."
defaults write com.apple.dock showhidden -bool TRUE
defaults write com.apple.dock autohide -bool TRUE
defaults write com.apple.dock magnification -bool TRUE
defaults write com.apple.dock tilesize -integer 24

echo "add applications folder to dock..."
defaults write com.apple.dock persistent-others -array-add '<dict><key>tile-data</key><dict><key>file-type</key><integer>2</integer><key>file-label</key><string>Applications</string><key>file-data</key><dict><key>_CFURLString</key><string>file:///Applications/</string><key>_CFURLStringType</key><integer>15</integer></dict><key>showas</key><integer>0</integer></dict><key>tile-type</key><string>directory-tile</string></dict>'

#'<dict><key>tile-data</key><dict><key>bundle-identifier</key><string>com.apple.systempreferences</string><key>dock-extra</key><integer>1</integer>
#<key>file-data</key><dict>
#<key>_CFURLString</key><string>file:///Applications/System%20Preferences.app/</string>
#"_CFURLStringType" = 15;
#};
#"file-label" = "System Preferences";
#"file-mod-date" = 3563919187;
#"file-type" = 41;
#"parent-mod-date" = 3588774225;
#};
#"tile-type" = "file-tile";
#}
