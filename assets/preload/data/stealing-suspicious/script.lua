function onCreatePost() --script made by impostor (https://www.youtube.com/channel/UCDSC071IJvtCvV2h5CJ9HKw), credit me now or i will do an unfunny
    makeLuaText("message", "  ", 500, 30, 50)
    setTextAlignment("message", "left")
    addLuaText("message")

    makeLuaText("engineText", "Stealing Suspicious - Bambi Engine (PE "..version..")", 500, 30, 30)
    setTextAlignment("engineText", "left")
    addLuaText("engineText")

    if getPropertyFromClass('ClientPrefs', 'downScroll') == false then
        setProperty('message.y', 680)
        setProperty('engineText.y', 660)
    end
end