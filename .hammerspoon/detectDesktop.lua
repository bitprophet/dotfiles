log = hs.logger.new('detectDesktop', 'debug')

-- Takes explicit callback name/identifier because lua metaprogramming is bluh
function callWhenMouseConnected(identifier, callback)
    return hs.usb.watcher.new(function(data)
        mouse = "Evoluent VerticalMouse 4"
        -- Need to scan prod/vendor IDs too now, getting 2x connect events for
        -- some bizarro reason :(
        prodID = 401
        vendorID = 6780
        if data['eventType'] == "added" and data['productName'] == mouse
        and data['productID'] == prodID and data['vendorID'] == vendorID
        then
            log.d("Received new EVM4 event: \n" .. hs.inspect(data))
            log.d("Invoking callback '" .. identifier .. "'")
            callback()
        end
    end)
end

-- When only one screen attached, returns its name. In any other situation,
-- returns nil.
function getSingularScreenName()
    log.d("screen.allScreens():")
    log.d(hs.inspect(hs.screen.allScreens()))
    -- Above seems to be a dict/array as expected, when on LG it's "LG
    -- ULTRAWIDE", when on internal it is "Color LCD". Whee.
    -- Wow, why the hell is Lua so fucking popular again? This crappy
    -- version of "if x in y" is some dumb bullshit.
    current_screen = nil
    count = 0
    for k, v in pairs(hs.screen.allScreens()) do
        current_screen = v
        count = count + 1
    end
    screen_name = current_screen:name()
    log.d("Screen count: " .. count .. ", first is: " .. hs.inspect(screen_name))
    if count == 1 then
        return screen_name
    end
    return nil
end

function updateNaturalScrolling()
    name = getSingularScreenName()
    log.d("Screen was changed to " .. hs.inspect(name))
    if name then
        if name == "Color LCD" then
            log.d("Requesting natural scrolling")
            useNaturalScrolling(true)
        else
            log.d("Requesting UNnatural scrolling")
            useNaturalScrolling(false)
        end
    end
end


function callWhenScreenChanges()
    -- These often get spawned a bunch in a row (at least 2, the 2nd after
    -- ~4-5s; sometimes as many as 5 or more within that time!) and the early
    -- one(s) is often 'wrong', only holding the internal LCD display name.
    -- The later (correct) ones seem to get overwritten or are otherwise unable
    -- to do their job correctly because of the earlier ones.
    -- Was unable to get an atomic, race condition proof lock to work (argh) so
    -- settling for "all events must wait long enough to be relatively sure the
    -- state of the observed world is correct" - so that even if all, say, 5
    -- events spawn an action, they're all trying to do the same thing, and
    -- collisions won't matter.
    return hs.screen.watcher.new(function()
        wait = 5 --
        log.d("Waiting " .. wait .. "s to make sure we get the real screen name...")
        hs.timer.doAfter(wait, updateNaturalScrolling)
    end)
end
