
package objs;

import openfl.events.Event;
import openfl.text.TextField;
import openfl.text.TextFormat;
import openfl.Assets;

class Watermark extends TextField
{
    public function new(inX:Float = 10, inY:Float = 10, inCol:Int = 0xFFFFFF)
    {
        super();

        selectable = false;
        mouseEnabled = false;

        var fontPixel = Assets.getFont("assets/fonts/vcr.ttf");

        defaultTextFormat = new TextFormat(fontPixel.fontName, 20, inCol);

        text = "Malware Engine v0.0.1";

        width = 250;
        height = 30;

        addEventListener(Event.ADDED_TO_STAGE, onAdded);
    }

    private function onAdded(_)
    {
        removeEventListener(Event.ADDED_TO_STAGE, onAdded);

        stage.addEventListener(Event.RESIZE, onResize);

        updatePosition();
    }

    private function onResize(_)
    {
        updatePosition();
    }

    private function updatePosition()
    {
        x = stage.stageWidth - width - 10;
        y = 3;
    }
}
