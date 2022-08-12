function opponentNoteHit()
    health = getProperty('health')
    if getProperty('health') > 0.02 then
        setProperty('health', health- 0.02);
    end
end

function onStartCountdown()
    setProperty('health', 2)
end