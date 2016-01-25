-- Tickle mouse acceleration when VerticalMouse appears (since it may be a KVM
-- event triggering that bizarre bug where acceleration disappears).
hs.usb.watcher.new(function(data)
    print("USB event detected: " .. hs.inspect(data))
    mouse = "Evoluent VerticalMouse 4"
    if data['eventType'] == "added" and data['productName'] == mouse then
        print("Totally just got a new mouse")
        -- Tickle mouse acceleration up, then down
    end
end):start()


-- Set unnatural scrolling for VerticalMouse, natural for trackpad
-- TODO: how to determine trackpad, besides VerticalMouse disappearing? (Which
-- can sometimes just mean KVM) Could use keyboard instead as it seems to not
-- disappear w/ KVM for some reason? Is there another "plugged into
-- Thunderbolt" trigger?


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
