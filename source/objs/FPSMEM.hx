
package objs;

import haxe.Timer;
import openfl.events.Event;
import openfl.system.System;
import openfl.text.TextField;
import openfl.text.TextFormat;
import openfl.Assets;

class FPSMEM extends TextField
{
    private var times:Array<Float>;
    private var memPeak:Float = 0;

    public function new(inX:Float = 10, inY:Float = 10, inCol:Int = 0xFFFFFF)
    {
        super();

        x = inX;
        y = inY;

        selectable = false;
        mouseEnabled = false;

        var fontPixel = Assets.getFont("assets/fonts/vcr.ttf");

        defaultTextFormat = new TextFormat(fontPixel.fontName, 20, inCol);

        text = "FPS: ";
        times = [];

        width = 500;
        height = 70;

        addEventListener(Event.ENTER_FRAME, onEnter);
    }

    private function onEnter(_)
    {
        var now = Timer.stamp();

        times.push(now);

        while (times.length > 0 && times[0] < now - 1)
            times.shift();

        var mem:Float = Math.round(System.totalMemory / 1024 / 1024 * 100) / 100;

        if (mem > memPeak)
            memPeak = mem;

        if (visible)
        {
            text = "FPS: " + times.length
                + "\nMEM: " + mem + "/" + memPeak + " MB";
        }
    }
}
