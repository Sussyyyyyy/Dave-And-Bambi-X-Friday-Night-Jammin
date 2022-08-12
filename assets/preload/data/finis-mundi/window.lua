function opponentNoteHit()
  windowShake()
end

function windowShake()
  windowX = getPropertyFromClass('openfl.Lib', 'application.window.x')
  windowY = getPropertyFromClass('openfl.Lib', 'application.window.y')
  setPropertyFromClass('openfl.Lib','application.window.x',windowX + math.random(-10,10))
  setPropertyFromClass('openfl.Lib','application.window.y',windowY + math.random(-5,5))
end

function onMoveCamera(focus)
	if focus == 'boyfriend' then
		-- called when the camera focus on boyfriend
	elseif focus == 'dad' then
		setProperty('camFollowPos.y',getProperty('camFollowPos.y') + (math.sin(currentBeat) * 0.6))
	end
	setPropertyFromClass("openfl.Lib", "application.window.title", "NO HOPE LEFT NO HOPE LEFT NO HOPE LEFT NO HOPE LEFT NO HOPE LEFT NO HOPE LEFT NO HOPE LEFT NO HOPE LEFT NO HOPE LEFT NO HOPE LEFT NO HOPE LEFT NO HOPE LEFT NO HOPE LEFT NO HOPE LEFT NO HOPE LEFT NO HOPE LEFT NO HOPE LEFT NO HOPE LEFT ")
end