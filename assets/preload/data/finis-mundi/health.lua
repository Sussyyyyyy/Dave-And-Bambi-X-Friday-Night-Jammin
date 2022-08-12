function onStartCountdown()
    setProperty('health', 2)
end

function opponentNoteHit()
	health = getProperty('health')
	if health > 0.02 then
		setProperty('health', health - 0.005);	
	end
end