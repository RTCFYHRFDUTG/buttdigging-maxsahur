import funkin.options.OptionsMenu;
import funkin.menus.credits.CreditsMain;
import funkin.menus.ModSwitchMenu;
import funkin.editors.EditorPicker;
import funkin.backend.utils.WindowUtils;
import flixel.group.FlxGroup.FlxTypedGroup;
import flixel.text.FlxText.FlxTextAlign;
import funkin.savedata.FunkinSave;
import flixel.text.FlxTextBorderStyle;

var play:FlxSprite;
var options:FlxSprite;
var credits:FlxSprite;
var smile:FlxSprite;

function postCreate(){
    FlxG.camera.bgColor = FlxColor.WHITE;
    CoolUtil.playMusic(Paths.music('freakyMenu'));
    FlxG.sound.music.persist = true;

    FlxG.mouse.visible = true;

    max = new FlxSprite(0, 0).loadGraphic(Paths.image("game/max"));
    max.scale.set(2, 2);
    max.screenCenter(FlxAxes.XY);
    max.x += 100;
    max.y += 0;
    add(max);

    play = new FlxSprite(0, 0).loadGraphic(Paths.image("game/play"));
    play.scale.set(2, 2);
    play.screenCenter(FlxAxes.XY);
    play.x += -480;
    play.y += -300;
    play.updateHitbox();
    add(play);

    options = new FlxSprite(0, 0).loadGraphic(Paths.image("game/options"));
    options.scale.set(2, 2);
    options.screenCenter(FlxAxes.XY);
    options.x += -480;
    options.y += -60;
    options.updateHitbox();
    add(options);

    credits = new FlxSprite(0, 0).loadGraphic(Paths.image("game/credits"));
    credits.scale.set(2, 2);
    credits.screenCenter(FlxAxes.XY);
    credits.x += -480;
    credits.y += 180;
    credits.updateHitbox();
    add(credits);

    smile = new FlxSprite(0, 0).loadGraphic(Paths.image("game/smile"));
    smile.scale.set(2, 2);
    smile.screenCenter(FlxAxes.XY);
    smile.x += 480;
    smile.y += 240;
    smile.updateHitbox();
    add(smile);
}

function postUpdate(elapsed){
    if (FlxG.keys.justPressed.SEVEN) {
        persistentUpdate = true;
        persistentDraw = true;
        openSubState(new EditorPicker());
    }
    if (controls.SWITCHMOD) {
        openSubState(new ModSwitchMenu());
        persistentUpdate = true;
        persistentDraw = true;
    }
    if (FlxG.mouse.overlaps(play)) {
        play.scale.set(2.1, 2.1);
        play.alpha = 1;
        if (FlxG.mouse.justPressed) {
            PlayState.loadSong('bebobap', 'hard');
		    FlxG.switchState(new PlayState());
        }
    } else {
        play.scale.set(2, 2);
        play.alpha = 1;
    }
    if (FlxG.mouse.overlaps(options)) {
        options.scale.set(2.1, 2.1);
        options.alpha = 1;
        if (FlxG.mouse.justPressed) {
            FlxG.switchState(new OptionsMenu());
        }
    } else {
        options.scale.set(2, 2);
        options.alpha = 1;
    }
    if (FlxG.mouse.overlaps(credits)) {
        credits.scale.set(2.1, 2.1);
        credits.alpha = 1;
        if (FlxG.mouse.justPressed) {
            FlxG.switchState(new CreditsMain());
        }
    } else {
        credits.scale.set(2, 2);
        credits.alpha = 1;
    }
    if (FlxG.mouse.overlaps(smile)) {
        smile.scale.set(2.1, 2.1);
        smile.alpha = 1;
        if (FlxG.mouse.justPressed) {
            CoolUtil.openURL("https://www.youtube.com/watch?v=FMYzPBn63Ic");
        }
    } else {
        smile.scale.set(2, 2);
        smile.alpha = 1;
    }
}

function renameWindow(title:String, ?icon) WindowUtils.winTitle = window.title = title;