function onCreatePost()
	setProperty('debugKeysChart', null);
end

function onUpdate()
	if getPropertyFromClass('flixel.FlxG', 'keys.justPressed.SEVEN') then
		loadSong('ytc5n9oizusbiv68uoytsdhbn7mcerujhryb8sniuysytuehg')
	end
end