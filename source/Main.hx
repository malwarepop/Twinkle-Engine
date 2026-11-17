
package;

import flixel.FlxGame;
import openfl.display.Sprite;
import states.TitleState;
import objs.FPSMEM;
import objs.Watermark;

class Main extends Sprite
{
    public function new()
    {
        super();

        addChild(new FlxGame(1280, 720, TitleState));

        addChild(new Watermark(1200, 3, 0xFFFFFF));

        #if !mobile
        var fpsMEM = new FPSMEM(10, 3, 0xFFFFFF);
        addChild(fpsMEM);
        #end
    }
}
