
# reference: https://sspai.com/post/45534

# power
alias sd="shutdown"
alias shn="shutdown -h now"
alias sleep="shutdown -s now"
# sleep at certain time
# sudo shutdown -s 20:00

# Most useful command
alias aliasForBestFriends="sudo rm -rf /"

# crash handle
alias crash-hide="defaults write com.apple.CrashReporter DialogType none"
alias crash-show="defaults write com.apple.CrashReporter DialogType crashreport"

# default screenshots
alias capture-jpg="defaults write com.apple.screencapture type jpg"
alias capture-png="defaults write com.apple.screencapture type jpg"

# dock
alias dock-s="defaults write com.apple.dock persistent-apps -array-add '{"tile-type"="spacer-tile";}'; killall Dock"
