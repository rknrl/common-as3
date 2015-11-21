//       ___       ___       ___       ___       ___
//      /\  \     /\__\     /\__\     /\  \     /\__\
//     /::\  \   /:/ _/_   /:| _|_   /::\  \   /:/  /
//    /::\:\__\ /::-"\__\ /::|/\__\ /::\:\__\ /:/__/
//    \;:::/  / \;:;-",-" \/|::/  / \;:::/  / \:\  \
//     |:\/__/   |:|  |     |:/  /   |:\/__/   \:\__\
//      \|__|     \|__|     \/__/     \|__|     \/__/

package ru.rknrl.common {
import flash.events.Event;
import flash.system.System;
import flash.text.TextField;
import flash.text.TextFieldAutoSize;
import flash.text.TextFormat;
import flash.utils.getTimer;

public class MemTextField extends TextField {
    public function MemTextField() {
        autoSize = TextFieldAutoSize.LEFT;
        background = true;
        multiline = true;
        mouseEnabled = selectable = false;
        defaultTextFormat = new TextFormat(null, 12);
        addEventListener(Event.ENTER_FRAME, onEnterFrame);
    }

    private var lastTime:int;

    private function onEnterFrame(event:Event):void {
        const time:int = getTimer();
        if (time - lastTime > 1000) {
            text = "totalmem=" + toMb(System.totalMemory) +
                    "\nfreemem=" + toMb(System.freeMemory) +
                    "\nprivmem=" + toMb(System.privateMemory);
            lastTime = time;
        }
    }

    private static function toMb(number:Number):String {
        return (number / 1024 / 1024).toFixed(2) + "mb";
    }
}
}
