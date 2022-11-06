function opponentNoteHit()
  windowShake()
end

function windowShake()
  windowX = getPropertyFromClass('openfl.Lib', 'application.window.x')
  windowY = getPropertyFromClass('openfl.Lib', 'application.window.y')
  setPropertyFromClass('openfl.Lib','application.window.x',windowX + math.random(-20,20))
  setPropertyFromClass('openfl.Lib','application.window.y',windowY + math.random(-10,10))
end

function onMoveCamera(focus)
	if focus == 'boyfriend' then
		-- called when the camera focus on boyfriend
	elseif focus == 'dad' then
		setProperty('camFollowPos.y',getProperty('camFollowPos.y') + (math.sin(currentBeat) * 0.6))
	end
	setPropertyFromClass("openfl.Lib", "application.window.title", "53 54 4f 50 53 54 4f 50 53 54 4f 50 53 54 4f 50 53 54 4f 50 53 54 4f 50 53 54 4f 50 53 54 4f 50")
end