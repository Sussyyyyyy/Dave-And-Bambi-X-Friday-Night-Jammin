function opponentNoteHit()
	health = getProperty('health')
	if health > 0.01 then
		setProperty('health', health - 0.01);	
	end
end