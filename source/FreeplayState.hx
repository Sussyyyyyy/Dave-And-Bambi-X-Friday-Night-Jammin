//THIS IS UNUSED!
//THIS IS UNUSED!
//THIS IS UNUSED!
//THIS IS UNUSED!
//THIS IS UNUSED!
//THIS IS UNUSED!
//THIS IS UNUSED!
//THIS IS UNUSED!
//THIS IS UNUSED!
//THIS IS UNUSED!
//THIS IS UNUSED!
//THIS IS UNUSED!
//THIS IS UNUSED!
//THIS IS UNUSED!
//THIS IS UNUSED!
//THIS IS UNUSED!
//THIS IS UNUSED!
//THIS IS UNUSED!
//THIS IS UNUSED!
//THIS IS UNUSED!
//THIS IS UNUSED!
//THIS IS UNUSED!
//THIS IS UNUSED!
//THIS IS UNUSED!
//THIS IS UNUSED!
//THIS IS UNUSED!
//THIS IS UNUSED!
//THIS IS UNUSED!
//THIS IS UNUSED!
//THIS IS UNUSED!
//THIS IS UNUSED!
//THIS IS UNUSED!
//THIS IS UNUSED!
//THIS IS UNUSED!
//THIS IS UNUSED!
//THIS IS UNUSED!
//THIS IS UNUSED!
//THIS IS UNUSED!
//THIS IS UNUSED!
//THIS IS UNUSED!
//THIS IS UNUSED!
//THIS IS UNUSED!
//THIS IS UNUSED!
//THIS IS UNUSED!
//THIS IS UNUSED!
//THIS IS UNUSED!
//THIS IS UNUSED!
//THIS IS UNUSED!
//THIS IS UNUSED!
//THIS IS UNUSED!
//THIS IS UNUSED!
//THIS IS UNUSED!
//THIS IS UNUSED!
//THIS IS UNUSED!
//THIS IS UNUSED!
//THIS IS UNUSED!
//THIS IS UNUSED!
//THIS IS UNUSED!
//THIS IS UNUSED!
//THIS IS UNUSED!
//THIS IS UNUSED!
//THIS IS UNUSED!
//THIS IS UNUSED!
//THIS IS UNUSED!
//THIS IS UNUSED!
//THIS IS UNUSED!
//THIS IS UNUSED!
//THIS IS UNUSED!
//THIS IS UNUSED!
//THIS IS UNUSED!
//THIS IS UNUSED!
//THIS IS UNUSED!
//THIS IS UNUSED!
//THIS IS UNUSED!
//THIS IS UNUSED!
//THIS IS UNUSED!
//THIS IS UNUSED!
//THIS IS UNUSED!
//THIS IS UNUSED!
//THIS IS UNUSED!
//THIS IS UNUSED!
//THIS IS UNUSED!
//THIS IS UNUSED!
//THIS IS UNUSED!
//THIS IS UNUSED!
//THIS IS UNUSED!
//THIS IS UNUSED!
//THIS IS UNUSED!
//THIS IS UNUSED!
//THIS IS UNUSED!
//THIS IS UNUSED!
//THIS IS UNUSED!
//THIS IS UNUSED!
//THIS IS UNUSED!
//THIS IS UNUSED!
//THIS IS UNUSED!
//THIS IS UNUSED!
//THIS IS UNUSED!
//THIS IS UNUSED!
//I CRAVE CHEDDAR!

package;

#if desktop
import Discord.DiscordClient;
#end
import editors.ChartingState;
import flash.text.TextField;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.addons.display.FlxGridOverlay;
import flixel.addons.transition.FlxTransitionableState;
import flixel.group.FlxGroup.FlxTypedGroup;
import flixel.math.FlxMath;
import flixel.text.FlxText;
import flixel.util.FlxColor;
import flixel.tweens.FlxTween;
import lime.utils.Assets;
import flixel.system.FlxSound;
import openfl.utils.Assets as OpenFlAssets;
import WeekData;
#if MODS_ALLOWED
import sys.FileSystem;
#end

using StringTools;

class FreeplayState extends MusicBeatState
{
	var songs:Array<SongMetadata> = [];

	var selector:FlxText;
	private static var curSelected:Int = 0;
	var curDifficulty:Int = -1;
	private static var lastDifficultyName:String = '';

	var scoreBG:FlxSprite;
	var scoreText:FlxText;
	var diffText:FlxText;
	var lerpScore:Int = 0;
	var lerpRating:Float = 0;
	var intendedScore:Int = 0;
	var intendedRating:Float = 0;

	public static var category:String = 'actual weeks'; //this was so fucking unnecessary

	private var grpSongs:FlxTypedGroup<Alphabet>;
	private var curPlaying:Bool = false;

	private var iconArray:Array<HealthIcon> = [];

	var bg:FlxSprite;
	var intendedColor:Int;
	var colorTween:FlxTween;

	override function create()
	{
		Paths.clearStoredMemory();
		Paths.clearUnusedMemory();
		
		persistentUpdate = true;
		PlayState.isStoryMode = false;
		WeekData.reloadWeekFiles(false);

		#if desktop
		// Updating Discord Rich Presence
		DiscordClient.changePresence("Menu Moment", null);
		#end

		if (category == '' || category == null)
		{
			trace("tengo sida");
			LoadingState.loadAndSwitchState(new FreeplayCategorySelector());
		}
		WeekData.loadTheFirstEnabledMod();

		/*		//KIND OF BROKEN NOW AND ALSO PRETTY USELESS//

		var initSonglist = CoolUtil.coolTextFile(Paths.txt('freeplaySonglist'));
		for (i in 0...initSonglist.length)
		{
			if(initSonglist[i] != null && initSonglist[i].length > 0) {
				var songArray:Array<String> = initSonglist[i].split(":");
				addSong(songArray[0], 0, songArray[1], Std.parseInt(songArray[2]));
			}
		}*/

		bg = new FlxSprite().loadGraphic(Paths.image('menuDesat'));
		bg.antialiasing = ClientPrefs.globalAntialiasing;
		add(bg);
		bg.screenCenter();

		grpSongs = new FlxTypedGroup<Alphabet>();
		add(grpSongs);
		category = Main.freeplaything;

		if (category == 'Main Weeks')
		{
			addSong('Groovy-House', 0, 'dave', FlxColor.fromRGB(0, 0, 255));
			addSong('Insano', 0, 'dave', FlxColor.fromRGB(0, 0, 255));
			addSong('Tridimensional', 0, 'dave-furiosity', FlxColor.fromRGB(175, 0, 135));
			addSong('Stealing-Suspicious', 1, 'bambi', FlxColor.fromRGB(0, 255, 0));
			addSong('Milho', 1, 'bambi', FlxColor.fromRGB(0, 235, 0));
			addSong('Long-Showdown', 1, 'uhhh', FlxColor.fromRGB(0, 215, 0));
			addSong('Midnight', 2, 'dave', FlxColor.fromRGB(0, 0, 200));
			addSong('Second-Round', 2, 'daventristan', FlxColor.fromRGB(0, 0, 200));
			addSong('Marathon', 2, 'marathon', FlxColor.fromRGB(100, 100, 100));
			addSong('Kabuki', 3, 'exbungo', FlxColor.fromRGB(95, 0, 0));
			addSong('Habunda', 3, 'exbungo', FlxColor.fromRGB(80, 0, 0));
			addSong('sternocleido', 3, 'exbungo', FlxColor.fromRGB(80, 0, 0));
			addSong('gatetrader', 4, '3d', FlxColor.fromRGB(100, 100, 100));
			addSong('injury', 4, '3d', FlxColor.fromRGB(95, 0, 0));
			addSong('resistant', 4, 'unfairbambi', FlxColor.fromRGB(80, 0, 0));
			addSong('harmon', 4, 'expungedlol', FlxColor.fromRGB(80, 0, 0));
			addSong('minion', 4, 'minion', FlxColor.fromRGB(120, 0, 120));
			addSong('multiple', 4, 'minion', FlxColor.fromRGB(100, 0, 100));
			addSong('chaotic', 4, 'minion', FlxColor.fromRGB(80, 0, 80));
			addSong('final-push', 4, 'everyone', FlxColor.fromRGB(0, 0, 0));
			addSong('reconciliation', 4, 'kaiju', FlxColor.fromRGB(0, 0, 190));
		}

		if (category == 'Extras')
		{			
			addSong('Trijam', 0, 'jammer', FlxColor.fromRGB(0, 0, 153));
			addSong('Hablise', 0, 'jammer', FlxColor.fromRGB(0, 0, 153));
			addSong('introvert', 0, 'kaiju', FlxColor.fromRGB(0, 0, 153));
			addSong('hilarious-testing', 0, 'balls', FlxColor.fromRGB(0, 0, 153));
			addSong('Pissed', 0, 'imsomadbro', FlxColor.fromRGB(0, 160, 0));
			addSong('opposed', 0, 'oppoexpunged', FlxColor.fromRGB(180, 180, 180));
			addSong('diamond-armor', 0, 'diamond', FlxColor.fromRGB(0, 255, 255));
			addSong('Tridimensional-V2-B-Side', 0, 'bside3ddave', FlxColor.fromRGB(128, 0, 128));
		}

		if (category == 'Joke')
		{
			addSong('Vs-Dave-Easter', 0, 'bambi-joke', FlxColor.fromRGB(0, 255, 0));
			addSong('Vs-Dave-July', 0, 'sexo', FlxColor.fromRGB(100, 255, 0));
			addSong('Vs-Dave-easter-3', 0, 'sexo', FlxColor.fromRGB(0, 0, 153));
			addSong('Tridimensional-V1-B-Side', 0, 'old3ddavebside', FlxColor.fromRGB(69, 42, 137));
		}

		if (category == 'Covers')
		{
			addSong('Mealie', 0, 'bambi', FlxColor.fromRGB(0, 195, 0));
			addSong('Monarchy', 0, 'unfairbambi', FlxColor.fromRGB(255, 0, 0));
			addSong('Ready-Loud', 0, 'sexo', FlxColor.fromRGB(0, 195, 0));
		}

		if (category == 'Secret')
		{
			addSong('Cheater-Mayhem', 0, 'expungedlol', FlxColor.fromRGB(60, 0, 0));
			addSong('probabilities', 0, 'theoretical', FlxColor.fromRGB(128, 0, 128));
			addSong('Perma-Ban', 0, 'redacted', FlxColor.fromRGB(255, 255, 255));
			addSong('spacial', 0, 'spaci', FlxColor.fromRGB(60, 60, 60));
		}

		if (category == 'OC')
		{
			addSong('Recolored', 0, 'quantumer', FlxColor.fromRGB(140, 0, 140));
			addSong('cyanophobia', 0, 'blandury', FlxColor.fromRGB(0, 0, 255));
			addSong('mustardware', 0, 'mustardware', FlxColor.fromRGB(255, 82, 127));
			addSong('sleepy', 0, 'hrambi', FlxColor.fromRGB(139, 69, 19));
			addSong('epicness', 0, 'epibambi', FlxColor.fromRGB(139, 69, 19));
		}

		Main.freeplaything == '';

		for (i in 0...songs.length)
		{
			var songText:Alphabet = new Alphabet(0, (70 * i) + 30, songs[i].songName, true, false);
			songText.isMenuItem = true;
			songText.targetY = i;
			grpSongs.add(songText);

			if (songText.width > 980)
			{
				var textScale:Float = 980 / songText.width;
				songText.scale.x = textScale;
				for (letter in songText.lettersArray)
				{
					letter.x *= textScale;
					letter.offset.x *= textScale;
				}
				//songText.updateHitbox();
				//trace(songs[i].songName + ' new scale: ' + textScale);
			}

			Paths.currentModDirectory = songs[i].folder;
			var icon:HealthIcon = new HealthIcon(songs[i].songCharacter);
			icon.sprTracker = songText;

			// using a FlxGroup is too much fuss!
			iconArray.push(icon);
			add(icon);

			// songText.x += 40;
			// DONT PUT X IN THE FIRST PARAMETER OF new ALPHABET() !!
			// songText.screenCenter(X);
		}
		WeekData.setDirectoryFromWeek();

		scoreText = new FlxText(FlxG.width * 0.7, 5, 0, "", 32);
		scoreText.setFormat(Paths.font("vcr.ttf"), 32, FlxColor.WHITE, RIGHT);

		scoreBG = new FlxSprite(scoreText.x - 6, 0).makeGraphic(1, 66, 0xFF000000);
		scoreBG.alpha = 0.6;
		add(scoreBG);

		diffText = new FlxText(scoreText.x, scoreText.y + 36, 0, "", 24);
		diffText.font = scoreText.font;
		add(diffText);

		add(scoreText);

		if(curSelected >= songs.length) curSelected = 0;
		bg.color = songs[curSelected].color;
		intendedColor = bg.color;

		if(lastDifficultyName == '')
		{
			lastDifficultyName = CoolUtil.defaultDifficulty;
		}
		curDifficulty = Math.round(Math.max(0, CoolUtil.defaultDifficulties.indexOf(lastDifficultyName)));
		
		changeSelection();
		changeDiff();

		var swag:Alphabet = new Alphabet(1, 0, "swag");

		// JUST DOIN THIS SHIT FOR TESTING!!!
		/* 
			var md:String = Markdown.markdownToHtml(Assets.getText('CHANGELOG.md'));

			var texFel:TextField = new TextField();
			texFel.width = FlxG.width;
			texFel.height = FlxG.height;
			// texFel.
			texFel.htmlText = md;

			FlxG.stage.addChild(texFel);

			// scoreText.textField.htmlText = md;

			trace(md);
		 */

		var textBG:FlxSprite = new FlxSprite(0, FlxG.height - 26).makeGraphic(FlxG.width, 26, 0xFF000000);
		textBG.alpha = 0.6;
		add(textBG);

		#if PRELOAD_ALL
		var leText:String = "Press SPACE to listen to the Song / Press CTRL to enable noob mode / Press RESET to Reset your Score and Accuracy.";
		var size:Int = 16;
		#else
		var leText:String = "Press CTRL to enable noob mode / Press RESET to Reset your Score and Accuracy.";
		var size:Int = 18;
		#end
		var text:FlxText = new FlxText(textBG.x, textBG.y + 4, FlxG.width, leText, size);
		text.setFormat(Paths.font("vcr.ttf"), size, FlxColor.WHITE, RIGHT);
		text.scrollFactor.set();
		add(text);
		super.create();
	}

	override function closeSubState() {
		changeSelection(0, false);
		persistentUpdate = true;
		super.closeSubState();
	}

	public function addSong(songName:String, weekNum:Int, songCharacter:String, color:Int)
	{
		trace(color);
		songs.push(new SongMetadata(songName, weekNum, songCharacter, color));
	}

	function weekIsLocked(name:String):Bool {
		var leWeek:WeekData = WeekData.weeksLoaded.get(name);
		return (!leWeek.startUnlocked && leWeek.weekBefore.length > 0 && (!StoryMenuState.weekCompleted.exists(leWeek.weekBefore) || !StoryMenuState.weekCompleted.get(leWeek.weekBefore)));
	}

	/*public function addWeek(songs:Array<String>, weekNum:Int, weekColor:Int, ?songCharacters:Array<String>)
	{
		if (songCharacters == null)
			songCharacters = ['bf'];

		var num:Int = 0;
		for (song in songs)
		{
			addSong(song, weekNum, songCharacters[num]);
			this.songs[this.songs.length-1].color = weekColor;

			if (songCharacters.length != 1)
				num++;
		}
	}*/

	var instPlaying:Int = -1;
	private static var vocals:FlxSound = null;
	var holdTime:Float = 0;
	override function update(elapsed:Float)
	{
		if (FlxG.sound.music.volume < 0.7)
		{
			FlxG.sound.music.volume += 0.5 * FlxG.elapsed;
		}

		lerpScore = Math.floor(FlxMath.lerp(lerpScore, intendedScore, CoolUtil.boundTo(elapsed * 24, 0, 1)));
		lerpRating = FlxMath.lerp(lerpRating, intendedRating, CoolUtil.boundTo(elapsed * 12, 0, 1));

		if (Math.abs(lerpScore - intendedScore) <= 10)
			lerpScore = intendedScore;
		if (Math.abs(lerpRating - intendedRating) <= 0.01)
			lerpRating = intendedRating;

		var ratingSplit:Array<String> = Std.string(Highscore.floorDecimal(lerpRating * 100, 2)).split('.');
		if(ratingSplit.length < 2) { //No decimals, add an empty space
			ratingSplit.push('');
		}
		
		while(ratingSplit[1].length < 2) { //Less than 2 decimals in it, add decimals then
			ratingSplit[1] += '0';
		}

		scoreText.text = 'PB: ' + lerpScore + ' (' + ratingSplit.join('.') + '/100)';
		positionHighscore();

		var upP = controls.UI_UP_P;
		var downP = controls.UI_DOWN_P;
		var accepted = controls.ACCEPT;
		var space = FlxG.keys.justPressed.SPACE;
		var ctrl = FlxG.keys.justPressed.CONTROL;

		var shiftMult:Int = 1;
		if(FlxG.keys.pressed.SHIFT) shiftMult = 3;

		if(songs.length > 1)
		{
			if (upP)
			{
				changeSelection(-shiftMult);
				holdTime = 0;
			}
			if (downP)
			{
				changeSelection(shiftMult);
				holdTime = 0;
			}

			if(controls.UI_DOWN || controls.UI_UP)
			{
				var checkLastHold:Int = Math.floor((holdTime - 0.5) * 10);
				holdTime += elapsed;
				var checkNewHold:Int = Math.floor((holdTime - 0.5) * 10);

				if(holdTime > 0.5 && checkNewHold - checkLastHold > 0)
				{
					changeSelection((checkNewHold - checkLastHold) * (controls.UI_UP ? -shiftMult : shiftMult));
					changeDiff();
				}
			}
		}

		if (controls.UI_LEFT_P)
			changeDiff(-1);
		else if (controls.UI_RIGHT_P)
			changeDiff(1);
		else if (upP || downP) changeDiff();

		if (controls.BACK)
		{
			persistentUpdate = false;
			if(colorTween != null) {
				colorTween.cancel();
			}
			FlxG.sound.play(Paths.sound('cancelMenu'));
			MusicBeatState.switchState(new MainMenuState());
		}

		if(ctrl)
		{
			persistentUpdate = false;
			openSubState(new GameplayChangersSubstate());
		}
		else if(space)
		{
			if(instPlaying != curSelected)
			{
				#if PRELOAD_ALL
				destroyFreeplayVocals();
				FlxG.sound.music.volume = 0;
				Paths.currentModDirectory = songs[curSelected].folder;
				var poop:String = Highscore.formatSong(songs[curSelected].songName.toLowerCase(), curDifficulty);
				PlayState.SONG = Song.loadFromJson(poop, songs[curSelected].songName.toLowerCase());
				if (PlayState.SONG.needsVoices)
					vocals = new FlxSound().loadEmbedded(Paths.voices(PlayState.SONG.song));
				else
					vocals = new FlxSound();

				FlxG.sound.list.add(vocals);
				FlxG.sound.playMusic(Paths.inst(PlayState.SONG.song), 0.7);
				vocals.play();
				vocals.persist = true;
				vocals.looped = true;
				vocals.volume = 0.7;
				instPlaying = curSelected;
				#end
			}
		}

		else if (accepted)
		{
			persistentUpdate = false;
			var songLowercase:String = Paths.formatToSongPath(songs[curSelected].songName);
			var poop:String = Highscore.formatSong(songLowercase, curDifficulty);
			/*#if MODS_ALLOWED
			if(!sys.FileSystem.exists(Paths.modsJson(songLowercase + '/' + poop)) && !sys.FileSystem.exists(Paths.json(songLowercase + '/' + poop))) {
			#else
			if(!OpenFlAssets.exists(Paths.json(songLowercase + '/' + poop))) {
			#end
				poop = songLowercase;
				curDifficulty = 1;
				trace('Couldnt find file');
			}*/
			trace(poop);

			PlayState.SONG = Song.loadFromJson(poop, songLowercase);
			PlayState.isStoryMode = false;
			PlayState.storyDifficulty = curDifficulty;

			trace('bros playing week ' + WeekData.getWeekFileName() + ':skull:');
			if(colorTween != null) {
				colorTween.cancel();
			}
			
			if (FlxG.keys.pressed.SHIFT){
				LoadingState.loadAndSwitchState(new ChartingState());
			}else{
				LoadingState.loadAndSwitchState(new PlayState());
			}

			FlxG.sound.music.volume = 0;
					
			destroyFreeplayVocals();
		}
		else if(controls.RESET)
		{
			persistentUpdate = false;
			openSubState(new ResetScoreSubState(songs[curSelected].songName, curDifficulty, songs[curSelected].songCharacter));
			FlxG.sound.play(Paths.sound('scrollMenu'));
		}
		super.update(elapsed);
	}

	public static function destroyFreeplayVocals() {
		if(vocals != null) {
			vocals.stop();
			vocals.destroy();
		}
		vocals = null;
	}

	function changeDiff(change:Int = 0)
	{
		curDifficulty += change;

		if (curDifficulty < 0)
			curDifficulty = CoolUtil.difficulties.length-1;
		if (curDifficulty >= CoolUtil.difficulties.length)
			curDifficulty = 0;

		lastDifficultyName = CoolUtil.difficulties[curDifficulty];

		#if !switch
		intendedScore = Highscore.getScore(songs[curSelected].songName, curDifficulty);
		intendedRating = Highscore.getRating(songs[curSelected].songName, curDifficulty);
		#end

		PlayState.storyDifficulty = curDifficulty;
		diffText.text = '< ' + CoolUtil.difficultyString() + ' >';
		positionHighscore();
	}

	function changeSelection(change:Int = 0, playSound:Bool = true)
	{
		if(playSound) FlxG.sound.play(Paths.sound('scrollMenu'), 0.4);

		curSelected += change;

		if (curSelected < 0)
			curSelected = songs.length - 1;
		if (curSelected >= songs.length)
			curSelected = 0;
			
		var newColor:Int = songs[curSelected].color;
		if(newColor != intendedColor) {
			if(colorTween != null) {
				colorTween.cancel();
			}
			intendedColor = newColor;
			colorTween = FlxTween.color(bg, 1, bg.color, intendedColor, {
				onComplete: function(twn:FlxTween) {
					colorTween = null;
				}
			});
		}

		// selector.y = (70 * curSelected) + 30;

		#if !switch
		intendedScore = Highscore.getScore(songs[curSelected].songName, curDifficulty);
		intendedRating = Highscore.getRating(songs[curSelected].songName, curDifficulty);
		#end

		var bullShit:Int = 0;

		for (i in 0...iconArray.length)
		{
			iconArray[i].alpha = 0.6;
		}

		iconArray[curSelected].alpha = 1;

		for (item in grpSongs.members)
		{
			item.targetY = bullShit - curSelected;
			bullShit++;

			item.alpha = 0.6;
			// item.setGraphicSize(Std.int(item.width * 0.8));

			if (item.targetY == 0)
			{
				item.alpha = 1;
				// item.setGraphicSize(Std.int(item.width));
			}
		}
		
		Paths.currentModDirectory = songs[curSelected].folder;
		PlayState.storyWeek = songs[curSelected].week;

		CoolUtil.difficulties = CoolUtil.defaultDifficulties.copy();
		var diffStr:String = WeekData.getCurrentWeek().difficulties;
		if(diffStr != null) diffStr = diffStr.trim(); //Fuck you HTML5

		if(diffStr != null && diffStr.length > 0)
		{
			var diffs:Array<String> = diffStr.split(',');
			var i:Int = diffs.length - 1;
			while (i > 0)
			{
				if(diffs[i] != null)
				{
					diffs[i] = diffs[i].trim();
					if(diffs[i].length < 1) diffs.remove(diffs[i]);
				}
				--i;
			}

			if(diffs.length > 0 && diffs[0].length > 0)
			{
				CoolUtil.difficulties = diffs;
			}
		}
		
		if(CoolUtil.difficulties.contains(CoolUtil.defaultDifficulty))
		{
			curDifficulty = Math.round(Math.max(0, CoolUtil.defaultDifficulties.indexOf(CoolUtil.defaultDifficulty)));
		}
		else
		{
			curDifficulty = 0;
		}

		var newPos:Int = CoolUtil.difficulties.indexOf(lastDifficultyName);
		//trace('Pos of ' + lastDifficultyName + ' is ' + newPos);
		if(newPos > -1)
		{
			curDifficulty = newPos;
		}
	}

	private function positionHighscore() {
		scoreText.x = FlxG.width - scoreText.width - 6;

		scoreBG.scale.x = FlxG.width - scoreText.x + 6;
		scoreBG.x = FlxG.width - (scoreBG.scale.x / 2);
		diffText.x = Std.int(scoreBG.x + (scoreBG.width / 2));
		diffText.x -= diffText.width / 2;
	}
}

class SongMetadata
{
	public var songName:String = "";
	public var week:Int = 0;
	public var songCharacter:String = "";
	public var color:Int = -7179779;
	public var folder:String = "";

	public function new(song:String, week:Int, songCharacter:String, color:Int)
	{
		this.songName = song;
		this.week = week;
		this.songCharacter = songCharacter;
		this.color = color;
		this.folder = Paths.currentModDirectory;
		if(this.folder == null) this.folder = '';
	}
}