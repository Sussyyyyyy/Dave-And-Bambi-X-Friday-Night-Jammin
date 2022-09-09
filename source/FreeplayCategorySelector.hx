package;

import flixel.FlxSprite;
import flixel.text.FlxText;
import flixel.FlxG;
import flixel.FlxState;

class FreeplayCategorySelector extends MusicBeatState 
{
    var bg:FlxSprite;
    var collectionText:Alphabet;
    override public function create()
    {
        bg = new FlxSprite(0, 0);
        bg.loadGraphic(Paths.image('menuDesat'));
        bg.color = 0x3d87ff;
        bg.scrollFactor.set(0, 0);
        bg.updateHitbox();
        add(bg);
    }

    override public function update(elapsed:Float)
    {
        if (controls.BACK || FlxG.keys.justPressed.ESCAPE)
        {
            LoadingState.loadAndSwitchState(new MainMenuState());
        }
    }
}