package ru.rknrl.commands.tweens {
import flash.display.DisplayObject;

import ru.rknrl.easers.IEaser;

public class ScaleTween extends TweenCommand {
    private var target:DisplayObject;
    private var fromScaleX:Number;
    private var fromScaleY:Number;
    private var toScaleX:Number;
    private var toScaleY:Number;

    public function ScaleTween(target:DisplayObject, fromScaleX:Number, fromScaleY:Number, toScaleX:Number, toScaleY:Number, duration:int, easer:IEaser = null) {
        super(target, duration, easer);
        this.target = target;
        this.fromScaleX = fromScaleX;
        this.fromScaleY = fromScaleY;
        this.toScaleX = toScaleX;
        this.toScaleY = toScaleY;
    }

    override public function enterFrame(progress:Number):void {
        const x:Number = fromScaleX + (toScaleX - fromScaleX) * progress;
        const y:Number = fromScaleY + (toScaleY - fromScaleY) * progress;
        target.scaleX = x;
        target.scaleY = y;
    }

    public static function uniform(target:DisplayObject, fromScale:Number, toScale:Number, duration:int, easer:IEaser = null):ScaleTween {
        return new ScaleTween(target, fromScale, fromScale, toScale, toScale, duration, easer);
    }
}
}
