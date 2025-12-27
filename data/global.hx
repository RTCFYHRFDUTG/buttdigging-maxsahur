import funkin.backend.utils.NativeAPI;
import lime.graphics.Image;
import funkin.backend.system.Main;
import funkin.backend.utils.ShaderResizeFix;
import funkin.editors.charter.Charter;
import funkin.editors.character.CharacterEditor;
import Sys;
import funkin.backend.utils.WindowUtils;
import hxvlc.util.Handle;
import openfl.Lib;
import openfl.system.Capabilities;
import flixel.system.scaleModes.RatioScaleMode;
import funkin.editors.ui.UIState;

var redirectStates:Map<FlxState, String> = [
    TitleState => 'Menu',
    MainMenuState => 'Menu',
    FreeplayState => 'Menu',
];

function preStateSwitch() {
    for (redirectState in redirectStates.keys()) 
        if (Std.isOfType(FlxG.game._requestedState, redirectState)) 
            FlxG.game._requestedState = new ModState(redirectStates.get(redirectState));
    window.setIcon(Image.fromBytes(Assets.getBytes(Paths.image('game/icon'))));
    WindowUtils.title = "buttdiggin";
}

function postStateSwitch(){
    if(FlxG.state != PlayState && !Std.isOfType(FlxG.state, Charter) && !Std.isOfType(FlxG.state, CharacterEditor))
        windowShit(960, 720);
    else if (Std.isOfType(FlxG.state, Charter) || Std.isOfType(FlxG.state, CharacterEditor))
        windowShit(1280, 720);
}