package ru.rknrl.commands.tweens {
import flash.display.DisplayObject;

public class AlphaTween extends TweenCommand {
    private var target:DisplayObject;
    private var fromAlpha:Number;
    private var toAlpha:Number;

    public function AlphaTween(target:DisplayObject, fromAlpha:Number, toAlpha:Number, duration:int) {
        super(target, duration);
        this.target = target;
        this.fromAlpha = fromAlpha;
        this.toAlpha = toAlpha;
    }

    override public function enterFrame(progress:Number):void {
        target.alpha = fromAlpha + (toAlpha - fromAlpha) * progress;
    }
}
}
