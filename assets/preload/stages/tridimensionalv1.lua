function onCreate()
	-- background shit
	makeLuaSprite('shart', 'shart', -600, -300);
	setScrollFactor('shart', 0.9, 0.9);

	addLuaSprite('shart', false);
	
	close(true); --For performance reasons, close this script once the stage is fully loaded, as this script won't be used anymore after loading the stage
end