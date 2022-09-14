//coded by Furret

package;

import flixel.util.FlxColor;
import flixel.util.FlxTimer;
import flixel.tweens.FlxTween;
import flixel.tweens.FlxEase;
import flixel.FlxSprite;
import flixel.text.FlxText;
import flixel.FlxG;
import flixel.FlxState;

class FreeplayCategorySelector extends MusicBeatState 
{
    var bg:FlxSprite;
    var collectionText:Alphabet;
    var category:FlxSprite;
    var selectedCategory:FlxText;
    var goBack:FlxText;
    var leftArrow:FlxText;
    var rightArrow:FlxText;
    public static var currentCategory:String = 'Main Weeks';
    var categories:Array<String> = ['Main Weeks', 'Covers', 'Joke', 'Extras', 'OC', 'Secret'];
    var currentInt:Int = 0;
    var showed:Bool = true;
    var moving:Bool = false;

    function showItems(action:String):Void
    {
        if (action == 'show')
        {
            FlxTween.tween(selectedCategory, {alpha: 1}, 0.4, {ease: FlxEase.expoInOut});
            FlxTween.tween(leftArrow, {alpha: 1}, 0.4, {ease: FlxEase.expoInOut});
            FlxTween.tween(rightArrow, {alpha: 1}, 0.4, {ease: FlxEase.expoInOut});
            FlxTween.tween(goBack, {alpha: 1}, 0.4, {ease: FlxEase.expoInOut});
            showed = true;
        }
        else if (action == 'hide')
        {
            FlxTween.tween(selectedCategory, {alpha: 0}, 0.4, {ease: FlxEase.expoInOut});
            FlxTween.tween(leftArrow, {alpha: 0}, 0.4, {ease: FlxEase.expoInOut});
            FlxTween.tween(rightArrow, {alpha: 0}, 0.4, {ease: FlxEase.expoInOut});
            FlxTween.tween(goBack, {alpha: 0}, 0.4, {ease: FlxEase.expoInOut});
            showed = false;
        }
    }

    function changeCategory(direction:String)
    {
        if (direction == 'left')
        {   
            moving = true;
            showItems('hide');
            FlxTween.tween(category, {x: -600}, 0.6, {ease: FlxEase.expoInOut});
            var daTimer = new FlxTimer().start(0.6, function(tmr)
            {
                if (currentCategory == 'Secret')
                {
                    currentCategory = 'Main Weeks';
                    currentInt = 0;
                }
                else
                {
                    currentInt++;
                }
                switch (currentInt)
                {
                    case 0:
                    currentCategory = 'Main Weeks';
                    case 1:
                    currentCategory = 'Covers';
                    case 2:
                    currentCategory = 'Joke';
                    case 3:
                    currentCategory = 'Extras';
                    case 4:
                    currentCategory = 'OC';
                    case 5:
                    currentCategory = 'Secret';
                }
                remove(category);
                category = new FlxSprite(2000, category.y); //ok so, x parameter is set to 2000, flxtween changes it to 325 ! !
                switch(currentCategory)
                {
                    case 'Main Weeks':
                    category.loadGraphic(Paths.image('Main Weeks'));
                    case 'Covers':
                    category.loadGraphic(Paths.image('Covers'));
                    case 'Joke':
                    category.loadGraphic(Paths.image('JokeMoment'));
                    case 'Extras':
                    category.loadGraphic(Paths.image('Extras'));
                    case 'OC':
                    category.loadGraphic(Paths.image('OCsV2'));
                    case 'Secret':
                    category.loadGraphic(Paths.image('Secret'));
                }
                category.antialiasing = ClientPrefs.globalAntialiasing;
                category.scrollFactor.set(0, 0);
                category.scale.set(0.8, 0.8);
                add(category);
                FlxTween.tween(category, {x: 325}, 0.6, {ease: FlxEase.expoInOut});
                showItems('show');
                moving = false;
            });
        }
        else if (direction == 'right')
        {
            moving = true;
            showItems('hide');
            FlxTween.tween(category, {x: 1200}, 0.6, {ease: FlxEase.expoInOut});
            var daTimer = new FlxTimer().start(0.6, function(tmr)
            {
                if (currentCategory == 'Main Weeks')
                {
                    currentCategory = 'Secret';
                    currentInt = 5;
                }
                else
                {
                    currentInt--;
                }
                switch (currentInt)
                {
                    case 0:
                    currentCategory = 'Main Weeks';
                    case 1:
                    currentCategory = 'Covers';
                    case 2:
                    currentCategory = 'Joke';
                    case 3:
                    currentCategory = 'Extras';
                    case 4:
                    currentCategory = 'OC';
                    case 5:
                    currentCategory = 'Secret';
                }
                remove(category);
                category = new FlxSprite(-1000, category.y); //ok so, x parameter is set to 1000, flxtween changes it to 325 ! !
                switch(currentCategory)
                {
                    case 'Main Weeks':
                    category.loadGraphic(Paths.image('Main Weeks'));
                    case 'Covers':
                    category.loadGraphic(Paths.image('Covers'));
                    case 'Joke':
                    category.loadGraphic(Paths.image('JokeMoment'));
                    case 'Extras':
                    category.loadGraphic(Paths.image('Extras'));
                    case 'OC':
                    category.loadGraphic(Paths.image('OCsV2'));
                    case 'Secret':
                    category.loadGraphic(Paths.image('Secret'));
                }
                category.antialiasing = ClientPrefs.globalAntialiasing;
                category.scrollFactor.set(0, 0);
                category.scale.set(0.8, 0.8);
                add(category);
                FlxTween.tween(category, {x: 325}, 0.6, {ease: FlxEase.expoInOut});
                showItems('show');
                moving = false;
            });
        }
    }
    override public function create()
    {
        if (Main.freeplaything != '')
        {
            Main.freeplaything = '';
        }
        moving = true;
        FlxG.mouse.visible = true;
        bg = new FlxSprite(0, 0);
        bg.loadGraphic(Paths.image('menuDesat'));
        bg.color = 0x3d87ff;
        bg.scrollFactor.set(0, 0);
        bg.updateHitbox();
        add(bg);

        selectedCategory = new FlxText(0, 0, FlxG.width);
        selectedCategory.text = "Selected category: " + currentCategory;
        selectedCategory.setFormat("assets/fonts/comic.ttf", 64, FlxColor.WHITE, CENTER, FlxTextBorderStyle.OUTLINE, FlxColor.BLACK);
        selectedCategory.antialiasing = ClientPrefs.globalAntialiasing;
        selectedCategory.y = 50;
        selectedCategory.alpha = 0;
        add(selectedCategory);

        goBack = new FlxText(0, 0);
        goBack.text = 'GO BACK';
        goBack.setFormat("assets/fonts/comic.ttf", 64, FlxColor.GRAY, CENTER, FlxTextBorderStyle.OUTLINE, FlxColor.BLACK);
        goBack.antialiasing = ClientPrefs.globalAntialiasing;
        goBack.scale.set(0.7, 0.7);
        goBack.alpha = 0;
        add(goBack);

        leftArrow = new FlxText(300, 300);
        leftArrow.text = '<';
        leftArrow.setFormat("assets/fonts/comic.ttf", 64, FlxColor.GRAY, CENTER, FlxTextBorderStyle.OUTLINE, FlxColor.BLACK);
        leftArrow.antialiasing = ClientPrefs.globalAntialiasing;
        leftArrow.scale.set(1.3, 1.3);
        leftArrow.alpha = 0;
        add(leftArrow);

        rightArrow = new FlxText(900, 300);
        rightArrow.text = '>';
        rightArrow.setFormat("assets/fonts/comic.ttf", 64, FlxColor.GRAY, CENTER, FlxTextBorderStyle.OUTLINE, FlxColor.BLACK);
        rightArrow.antialiasing = ClientPrefs.globalAntialiasing;
        rightArrow.scale.set(1.3, 1.3);
        rightArrow.alpha = 0;
        add(rightArrow);

        category = new FlxSprite(325, 1000); //ok so, y parameter is set to 1000, flxtween changes it to 75 ! !
        category.loadGraphic(Paths.image('Main Weeks'));
        category.antialiasing = ClientPrefs.globalAntialiasing;
        category.scrollFactor.set(0, 0);
        category.scale.set(0.8, 0.8);
        add(category);

        FlxTween.tween(category, {y: 75}, 0.6, {ease: FlxEase.expoInOut});

        var daTimer = new FlxTimer().start(0.1, function(tmr)
        {
            showItems('show');
        });
        var daTimer = new FlxTimer().start(0.6, function(tmr)
        {
            moving = false;
        });
    }

    override public function update(elapsed:Float)
    {
        if (controls.BACK || FlxG.keys.justPressed.ESCAPE)
        {
            LoadingState.loadAndSwitchState(new MainMenuState());
            FlxG.mouse.visible = false;
        }

        selectedCategory.text = "Selected category: " + currentCategory;
        
        if (!moving)
        {
            if (controls.UI_LEFT_P)
            {
                changeCategory('left');
            }
            
            if (controls.UI_RIGHT_P)
            {
                changeCategory('right');
            }
        }

        if (!moving)
        {
            if (controls.ACCEPT)
            {
                Main.freeplaything = currentCategory;
                trace(FlxG.save.data.freeplayCategory);
                LoadingState.loadAndSwitchState(new FreeplayState());
            }
        }

        if (showed)
        {
            if (!moving)
            {
                if (FlxG.mouse.overlaps(leftArrow))
                {
                    leftArrow.color = FlxColor.WHITE;
                    if (FlxG.mouse.justPressed)
                    {
                        trace("pressed");
                        changeCategory('left');
                    }
                }
                else
                {
                    leftArrow.color = FlxColor.GRAY;
                }
        
                if (FlxG.mouse.overlaps(goBack))
                {
                    goBack.color = FlxColor.WHITE;
                    if (FlxG.mouse.justPressed)
                    {
                        LoadingState.loadAndSwitchState(new MainMenuState());
                    }
                }
                else
                {
                    goBack.color = FlxColor.GRAY;
                }
        
                if (FlxG.mouse.overlaps(rightArrow))
                {
                    rightArrow.color = FlxColor.WHITE;
                    if (FlxG.mouse.justPressed)
                    {
                        trace("pressed");
                        changeCategory('right');
                    }
                }
                else
                {
                    rightArrow.color = FlxColor.GRAY;
                }
            }
        }
    }
}