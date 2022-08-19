function onUpdate(elapsed)
	if curStep == 20 then
		started = true
	end
	songPos = getSongPosition()
	local currentBeat = (songPos/5000)*(curBpm/60)
	if wasBot then
		setProperty('botplayTxt.visible', true);
		setProperty('botplayTxt.alpha', true);
		setProperty('botplayTxt.text', "Skill 0")
	end
	if getProperty('cpuControlled') == true then
		wasBot = true
	end
	setProperty('cpuControlled', false);
end
