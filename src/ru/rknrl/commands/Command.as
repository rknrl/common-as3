package ru.rknrl.commands {
import flash.events.Event;
import flash.events.EventDispatcher;

public class Command extends EventDispatcher implements ICommand {
    public static const COMPLETE:String = "commandComplete";

    public function Command() {
    }

    public function run():void {

    }

    protected function start():void {

    }

    protected function end():void {

    }

    public final function complete():void {
        end();
        dispatchEvent(new Event(COMPLETE));
    }
}
}
