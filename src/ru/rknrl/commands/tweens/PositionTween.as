package ru.rknrl.commands.tweens {
import flash.display.DisplayObject;
import flash.geom.Point;

public class PositionTween extends TweenCommand {
    private var target:DisplayObject;
    private var fromPoint:Point;
    private var toPoint:Point;

    public function PositionTween(target:DisplayObject, fromPoint:Point, toPoint:Point, duration:int) {
        super(target, duration);
        this.target = target;
        this.fromPoint = fromPoint;
        this.toPoint = toPoint;
    }

    override public function enterFrame(progress:Number):void {
        const x:Number = fromPoint.x + (toPoint.x - fromPoint.x) * progress;
        const y:Number = fromPoint.y + (toPoint.y - fromPoint.y) * progress;
        target.x = x;
        target.y = y;
    }
}
}