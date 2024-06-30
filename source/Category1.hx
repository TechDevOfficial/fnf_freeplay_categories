package categories;

import flixel.input.gamepad.FlxGamepad;
import flash.text.TextField;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.addons.display.FlxGridOverlay;
import flixel.tweens.FlxTween;
import flixel.tweens.FlxEase;
import flixel.group.FlxGroup.FlxTypedGroup;
import flixel.math.FlxMath;
import flixel.text.FlxText;
import flixel.input.mouse.FlxMouseButton;
import flixel.util.FlxColor;
import lime.utils.Assets;
import categories.CategorySelect;


class Category1 extends MusicBeatState
{
    public static var category1:FlxSprite;
    public static var category2:FlxSprite;
    public static var category3:FlxSprite;
    var bg:FlxSprite;
   
    override function create()
    {
        FlxG.mouse.visible = true;

        FlxG.mouse.visible = true;
        bg = new FlxSprite().loadGraphic(Paths.image('categories/bg', 'preload'));
        bg.antialiasing = true;
        bg.updateHitbox();
        bg.screenCenter();
        bg.visible = true;
        bg.scrollFactor.set();
        add(bg);

        category1 = new FlxSprite(427, 1090);
        category1.loadGraphic(Paths.image('categories/category1', 'preload'));
        category1.antialiasing = false;
		category1.screenCenter();
        add(category1);

        super.create();
    }

    override function update(elapsed:Float)
    {
        FlxG.mouse.visible = true;
 
        if (controls.BACK)
        {
            FlxG.switchState(new CategorySelect());
        }

        if (FlxG.mouse.justPressed && category1.overlapsPoint(FlxG.mouse.getScreenPosition())) {
            runSong('1');
        }

        super.update(elapsed);
    }

    private function runSong(song:String)
    {
        switch(song)
        {
            case '1':
				PlayState.SONG = Song.loadFromJson('tutorial', 'tutorial');
				PlayState.isStoryMode = false;
				PlayState.storyDifficulty = 2;
				PlayState.storyWeek = 1;
				FlxG.camera.fade(FlxColor.WHITE, 0.5, false);
				FlxG.sound.play(Paths.sound('confirmMenu'));
				LoadingState.loadAndSwitchState(new PlayState());
        }
    }
}