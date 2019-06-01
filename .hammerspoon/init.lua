require('detectDesktop')
require('mouseAccelFix')
require('naturalScrolling')


-- Mouse acceleration reset bug fix. Wasn't fixed in El Cap :(
accelWatcher = callWhenMouseConnected("tickle mouse accel", tickleMouseAccel)
accelWatcher:start()


-- Set unnatural scrolling for VerticalMouse
-- Also tweak window layouts on same event
-- TODO: means updating callWhenMouseConnected to take >1 callback
disableScrolling = callWhenMouseConnected("disable natural scrolling", function() useNaturalScrolling(false) end)
disableScrolling:start()


-- TODO: how to determine trackpad, besides VerticalMouse disappearing? (Which
-- can sometimes just mean KVM...)
-- TODO: check out hs.screen.watcher, see how it behaves in "just opened laptop
-- after post-unplug-from-desktop sleep" situation as that is the key here.
-- TODO: anyway, mirror above re: tweaking scroll type & window movement

screenChanges = callWhenScreenChanges()
screenChanges:start()


-- Easy config reloading, how meta! Taken directly from HS's tutorial.
reloader = hs.pathwatcher.new(os.getenv("HOME") .. "/.hammerspoon/", function(files)
    doReload = false
    for _, file in pairs(files) do
        if file:sub(-4) == ".lua" then
            doReload = true
        end
    end
    if doReload then
        hs.reload()
    end
end)
reloader:start()
