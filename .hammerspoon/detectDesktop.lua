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
    end)
end
