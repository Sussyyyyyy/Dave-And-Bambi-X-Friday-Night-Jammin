function onCreate()
	-- background shit
	makeLuaSprite('welcometohellpartner', 'welcometohellpartner', -600, -300);
	setScrollFactor('welcometohellpartner', 0.9, 0.9);

	addLuaSprite('welcometohellpartner', false);
	
	close(true); --For performance reasons, close this script once the stage is fully loaded, as this script won't be used anymore after loading the stage
end