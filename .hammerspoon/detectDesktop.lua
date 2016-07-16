function callWhenMouseConnected(callback)
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
            print("Invoking " .. callback)
            callback()
        end
    end):start()
end
