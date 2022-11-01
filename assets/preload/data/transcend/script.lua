function onUpdate(elapsed)
	if curStep == 0 then
		started = true
	end
songPos = getSongPosition()
local currentBeat = (songPos/5000)*(curBpm/60)
doTweenY('opponentmove', 'dad', 100 - 400*math.sin((currentBeat+12*12)*math.pi), 2)
end 