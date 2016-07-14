local tbDisplay = "Thunderbolt Display"
local windowLayout = {
    -- HipChat lower left
    {"HipChat", nil, tbDisplay, hs.geometry.rect(0, 0.5, 0.5, 0.5), nil, nil},
    -- Textual lower left (?)
    -- Tweetbot upper left
    -- Chrome tiled across center, vertically maxed
    -- Evernote right half
}
hs.layout.apply(windowLayout)

-- probs in separate module, with intermediate or top level module doing the
-- selection...
-- internalDisplay = "whatever its name is"
-- windowLayout = {
--  -- HipChat maximized, far right desktop
--  -- Textual same
--  -- Tweetbot upper left (or left half?)
--  -- Chrome maximized (each window), far left desktops
--  -- Evernote maximized, between chrome and chat apps maybe?
-- }
