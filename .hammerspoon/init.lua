require('detectDesktop')
require('mouseAccelFix')
require('naturalScrolling')
require('windowLayouts')


-- Mouse acceleration reset bug fix.
-- NOTE: Currently disabled as El Cap seems to have fixed it?
-- callWhenMouseConnected(tickleMouseAccel)


-- Set unnatural scrolling for VerticalMouse
-- Also tweak window layouts on same event
-- TODO: means updating callWhenMouseConnected to take >1 callback
callWhenMouseConnected(function() useNaturalScrolling(false) end)


-- TODO: how to determine trackpad, besides VerticalMouse disappearing? (Which
-- can sometimes just mean KVM) Is there another "plugged into Thunderbolt"
-- trigger? (EDIT: probably just use "thunderbolt display exists"...duh)
-- TODO: anyway, mirror above re: tweaking scroll type & window movement


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
