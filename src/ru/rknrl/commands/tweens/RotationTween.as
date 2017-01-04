package ru.rknrl.commands.tweens {
import flash.display.DisplayObject;

import ru.rknrl.easers.IEaser;

public class RotationTween extends TweenCommand {
    private var target:DisplayObject;
    private var fromRotation:Number;
    private var toRotation:Number;

    public function RotationTween(target:DisplayObject, fromRotation:Number, toRotation:Number, duration:int, easer:IEaser = null) {
        super(target, duration, easer);
        this.target = target;
        this.fromRotation = fromRotation;
        this.toRotation = toRotation;
    }

    override public function enterFrame(progress:Number):void {
        target.rotation = fromRotation + (toRotation - fromRotation) * progress;
    }
}
}
