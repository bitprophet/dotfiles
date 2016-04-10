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

-- Run mouse accel fix when VerticalMouse is plugged in.
-- Bug is usually only triggered via KVM switch but no real harm in doing it
-- all the time, probably.
-- TODO: check for the KVM switch (USB hub) too, maybe
hs.usb.watcher.new(function(data)
    mouse = "Evoluent VerticalMouse 4"
    -- Need to scan prod/vendor IDs too now, getting 2x connect events for some
    -- bizarro reason :(
    prodID = 401
    vendorID = 6780
    if data['eventType'] == "added" and data['productName'] == mouse
    and data['productID'] == prodID and data['vendorID'] == vendorID
    then
        print("Received new EVM4 event: ")
        print(hs.inspect(data))
        print("")
        -- Tickle mouse acceleration up, then down
        tickleMouseAccel()
    end
end):start()


-- Set unnatural scrolling for VerticalMouse, natural for trackpad
-- TODO: how to determine trackpad, besides VerticalMouse disappearing? (Which
-- can sometimes just mean KVM) Is there another "plugged into Thunderbolt"
-- trigger?


-- Easy config reloading, how meta! Taken directly from HS's tutorial.
hs.pathwatcher.new(os.getenv("HOME") .. "/.hammerspoon/", function(files)
    doReload = false
    for _, file in pairs(files) do
        if file:sub(-4) == ".lua" then
            doReload = true
        end
    end
    if doReload then
        hs.reload()
    end
end):start()
