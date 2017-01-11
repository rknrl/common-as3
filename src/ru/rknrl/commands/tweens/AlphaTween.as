package ru.rknrl.commands.tweens {
import flash.display.DisplayObject;

import ru.rknrl.easers.IEaser;

public class AlphaTween extends TweenCommand {
    private var target:DisplayObject;
    private var fromAlpha:Number;
    private var toAlpha:Number;

    public function AlphaTween(target:DisplayObject, fromAlpha:Number, toAlpha:Number, duration:int, easer:IEaser = null) {
        super(target, duration, easer);
        this.target = target;
        this.fromAlpha = fromAlpha;
        this.toAlpha = toAlpha;
    }

    override public function run():void {
        if (isNaN(fromAlpha)) fromAlpha = target.alpha;
        super.run();
    }

    override public function enterFrame(progress:Number):void {
        target.alpha = fromAlpha + (toAlpha - fromAlpha) * progress;
    }
}
}
