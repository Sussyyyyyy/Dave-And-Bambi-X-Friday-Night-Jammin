function onCreate()
	-- background shit
	makeLuaSprite('scarybg', 'scarybg', -600, -300);
	setScrollFactor('scarybg', 0.9, 0.9);

	addLuaSprite('scarybg', false);
	
	close(true); --For performance reasons, close this script once the stage is fully loaded, as this script won't be used anymore after loading the stage
end