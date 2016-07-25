function callWhenMouseConnected(callback)
    hs.usb.watcher.new(function(data)
        mouse = "Evoluent VerticalMouse 4"
        -- Need to scan prod/vendor IDs too now, getting 2x connect events for
        -- some bizarro reason :(
        prodID = 401
        vendorID = 6780
        if data['eventType'] == "added" and data['productName'] == mouse
        and data['productID'] == prodID and data['vendorID'] == vendorID
        then
            print("Received new EVM4 event: ")
            print(hs.inspect(data))
            print("")
            print("Invoking " .. hs.inspect(callback))
            callback()
        end
    end):start()
end

function callWhenScreenChanges()
    hs.screen.watcher.new(function()
        print("Received new screen-change event!")
        print("Printing current list o screens:")
        print(hs.inspect(hs.screen.allScreens()))
        -- Above seems to be a dict/array as expected, when on TB it is just TB
        -- display, when on internal it is "Color LCD". Whee
    end):start()
end
