package ru.rknrl.commands.tweens {
import flash.display.DisplayObject;
import flash.events.Event;
import flash.utils.getTimer;

import ru.rknrl.commands.Command;
import ru.rknrl.easers.IEaser;

public class TweenCommand extends Command {
    private var startTime:int;
    private var duration:int;
    private var target:DisplayObject;
    private var easer:IEaser;

    public function TweenCommand(target:DisplayObject, duration:int, easer:IEaser = null) {
        this.target = target;
        this.duration = duration;
        this.easer = easer;
    }

    override public function run():void {
        startTime = getTimer();

        start();

        if (target.stage != null) {
            target.addEventListener(Event.ENTER_FRAME, onEnterFrame);
            enterFrame(0);
        } else {
            enterFrame(1);
            complete();
        }
    }

    public function onEnterFrame(event:Event):void {
        const time:int = getTimer();
        var progress:Number = (time - startTime) / duration;
        if (progress < 0) progress = 0;
        if (progress > 1) progress = 1;
        const frameProgress:Number = easer != null ? easer.ease(progress) : progress;
        enterFrame(frameProgress);
        if (progress == 1) {
            target.removeEventListener(Event.ENTER_FRAME, onEnterFrame);
            complete();
        }
    }

    public function enterFrame(progress:Number):void {
        // to override
    }
}
}
