//       ___       ___       ___       ___       ___
//      /\  \     /\__\     /\__\     /\  \     /\__\
//     /::\  \   /:/ _/_   /:| _|_   /::\  \   /:/  /
//    /::\:\__\ /::-"\__\ /::|/\__\ /::\:\__\ /:/__/
//    \;:::/  / \;:;-",-" \/|::/  / \;:::/  / \:\  \
//     |:\/__/   |:|  |     |:/  /   |:\/__/   \:\__\
//      \|__|     \|__|     \/__/     \|__|     \/__/

package ru.rknrl.common {
import flash.events.Event;
import flash.text.TextField;
import flash.text.TextFieldAutoSize;
import flash.utils.getTimer;

public class FpsTextField extends TextField {
    public function FpsTextField() {
        autoSize = TextFieldAutoSize.LEFT;
        background = true;
        mouseEnabled = selectable = false;
        addEventListener(Event.ENTER_FRAME, onEnterFrame);
    }

    private var fps:int;
    private var lastTime:int;

    private function onEnterFrame(event:Event):void {
        const time:int = getTimer();
        if (time - lastTime > 1000) {
            text = "fps:" + fps;
            fps = 0;
            lastTime = time;
        }
        fps++;
    }
}
}
