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

function callWhenScreenChanges()
    return hs.screen.watcher.new(function()
        log.d("Received new screen-change event!")
        log.d("Printing current list o screens:")
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
        if count == 1 then
            -- TODO: new behavior due to one or more of the following factors:
            -- - MacBook non-Pro 2018
            -- - use of CalDigit Thunderbolt 3 dock
            -- - LG ULTRAWIDE external display
            -- What happens is:
            -- - Docked, display has slept
            -- - Wake up with keyboard/mouse
            -- - Screen change event fires w/ Color LCD present only
            -- - 4-5 seconds later, ANOTHER fires w/ LG present only
            -- For now, just adapted this to say "when not color LCD, go back
            -- to unnatural scrolling" which may result in extraneous prefpane
            -- manipulation, but should prevent the above bug where we were
            -- setting natural scrolling on incorrectly...
            if current_screen:name() == "Color LCD" then
                useNaturalScrolling(true)
            else
                useNaturalScrolling(false)
            end
        end
    end)
end
