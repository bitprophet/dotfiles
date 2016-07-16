-- Tickle mouse acceleration to 'fix' bizarro bug where attaching a USB mouse
-- resets it (but which doesn't reset the slider).
function tickleMouseAccel()
    -- Have to use AppleScript for actual window UI manipulation, HS can only
    -- do window movement/resizing/etc.
    -- (Could use hs.application to launch/focus/quit, but what's the point
    -- really?)
    hs.applescript([[
        tell application "System Preferences"
            activate
            set current pane to pane "com.apple.preference.mouse"
        end tell
        tell application "System Events"
            tell application process "System Preferences"
                tell window "Mouse"
                    set s to slider "Tracking speed"
                    increment s
                    decrement s
                end tell
            end tell
        end tell
        tell application "System Preferences" to quit
    ]])
end
