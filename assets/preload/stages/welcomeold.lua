function onCreate()
	-- background shit
	makeLuaSprite('welcomeold', 'welcomeold', -600, -300);
	setScrollFactor('welcomeold', 0.9, 0.9);

	addLuaSprite('welcomeold', false);
	
	close(true); --For performance reasons, close this script once the stage is fully loaded, as this script won't be used anymore after loading the stage
end