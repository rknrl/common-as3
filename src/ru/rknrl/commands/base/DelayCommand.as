package ru.rknrl.commands.base {
import flash.display.DisplayObject;
import flash.events.Event;
import flash.utils.getTimer;

import ru.rknrl.commands.Command;

public class DelayCommand extends Command {
    private var target:DisplayObject;
    private var duration:int;
    private var startTime:int;

    public function DelayCommand(target:DisplayObject, duration:int) {
        this.target = target;
        this.duration = duration;
    }

    override public function run():void {
        start();

        startTime = getTimer();

        if (target.stage != null) {
            target.addEventListener(Event.ENTER_FRAME, onEnterFrame);
        } else {
            complete();
        }
    }

    private function onEnterFrame(event:Event):void {
        if (getTimer() - startTime >= duration) {
            target.removeEventListener(Event.ENTER_FRAME, onEnterFrame);
            complete();
        }
    }
}
}
