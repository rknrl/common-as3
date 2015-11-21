//       ___       ___       ___       ___       ___
//      /\  \     /\__\     /\__\     /\  \     /\__\
//     /::\  \   /:/ _/_   /:| _|_   /::\  \   /:/  /
//    /::\:\__\ /::-"\__\ /::|/\__\ /::\:\__\ /:/__/
//    \;:::/  / \;:;-",-" \/|::/  / \;:::/  / \:\  \
//     |:\/__/   |:|  |     |:/  /   |:\/__/   \:\__\
//      \|__|     \|__|     \/__/     \|__|     \/__/

package ru.rknrl.log {
import flash.events.Event;

public class LogEvent extends Event {
    public static const LOG:String = "ru.rknrl.Log";

    private var _text:String;

    public function get text():String {
        return _text;
    }

    public function LogEvent(text:String) {
        super(LOG);
        _text = text;
    }

    override public function clone():Event {
        return new LogEvent(text);
    }
}
}
