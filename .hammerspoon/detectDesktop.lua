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
        -- Above seems to be a dict/array as expected, when on TB it is just TB
        -- display, when on internal it is "Color LCD". Whee
        -- TODO: useNaturalScrolling(true) when screen has changed to be just
        -- internal display
        -- Wow, why the hell is Lua so fucking popular again? This is some dumb
        -- bullshit.
        current_screen = nil
        count = 0
        for k, v in pairs(hs.screen.allScreens()) do
            current_screen = v
            count = count + 1
        end
        if count == 1 and current_screen:name() == "Color LCD" then
            useNaturalScrolling(true)
        end
    end)
end
