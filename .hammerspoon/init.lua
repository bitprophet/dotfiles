-- Mouse acceleration reset bug fix.
-- NOTE: Currently disabled as El Cap seems to have fixed it?
-- require('mouseAccelFix')

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
