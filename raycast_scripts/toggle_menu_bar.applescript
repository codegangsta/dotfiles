#!/usr/bin/osascript

# Required parameters:
# @raycast.schemaVersion 1
# @raycast.title Toggle Menu Bar
# @raycast.mode compact

# Documentation:
# @raycast.description Toggle menu bar visibility
# @raycast.author codegangsta
# @raycast.authorURL https://raycast.com/codegangsta

tell application "System Events"
	tell dock preferences to set autohide menu bar to not autohide menu bar
end tell
