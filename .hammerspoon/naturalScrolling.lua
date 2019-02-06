log = hs.logger.new('naturalScrolling', 'debug')

-- Set trackpad scrolling to natural or unnatural
function useNaturalScrolling(be_natural)
    if be_natural then
        click_when = "false"
    else
        click_when = "true"
    end
    -- TODO: refactor outer shell and use both here and in mouseAccelFix?
    -- Have to use AppleScript for actual window UI manipulation, HS can only
    -- do window movement/resizing/etc.
    -- (Could use hs.application to launch/focus/quit, but what's the point
    -- really?)
    result = hs.applescript([[
        tell application "System Preferences"
	        activate
	        set current pane to pane "com.apple.preference.trackpad"
            delay 0.3
        end tell
        tell application "System Events"
	        tell application process "System Preferences"
		        tell window "Trackpad"
			        click radio button "Scroll & Zoom" of tab group 1
                    set scrollCheckbox to checkbox 1 of tab group 1
                    if value of scrollCheckbox as boolean is ]]
                    .. click_when ..
                    [[ then
                        click scrollCheckbox
                    end if
		        end tell
	        end tell
        end tell
        -- tell application "System Preferences" to quit
    ]])
end
