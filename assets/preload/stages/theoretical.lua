function onCreate()
	-- background shit
	makeLuaSprite('youfuckedupmyboy', 'youfuckedupmyboy', -600, -300);
	setScrollFactor('youfuckedupmyboy', 0.9, 0.9);

	addLuaSprite('youfuckedupmyboy', false);
	
	close(true); --For performance reasons, close this script once the stage is fully loaded, as this script won't be used anymore after loading the stage
end