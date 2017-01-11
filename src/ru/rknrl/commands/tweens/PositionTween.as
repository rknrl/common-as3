package ru.rknrl.commands.tweens {
import flash.display.DisplayObject;
import flash.geom.Point;

import ru.rknrl.easers.IEaser;

public class PositionTween extends TweenCommand {
    private var target:DisplayObject;
    private var fromX:Number;
    private var fromY:Number;
    private var toX:Number;
    private var toY:Number;

    public function PositionTween(target:DisplayObject, fromX:Number, fromY:Number, toX:Number, toY:Number, duration:int, easer:IEaser = null) {
        super(target, duration, easer);
        this.target = target;
        this.fromX = fromX;
        this.fromY = fromY;
        this.toX = toX;
        this.toY = toY;
    }

    override public function run():void {
        if (isNaN(fromX)) fromX = target.x;
        if (isNaN(fromY)) fromY = target.y;
        super.run();
    }

    override public function enterFrame(progress:Number):void {
        const x:Number = fromX + (toX - fromX) * progress;
        const y:Number = fromY + (toY - fromY) * progress;
        target.x = x;
        target.y = y;
    }

    public static function fromPoints(target:DisplayObject, fromPoint:Point, toPoint:Point, duration:int, easer:IEaser = null):PositionTween {
        return new PositionTween(target, fromPoint.x, fromPoint.y, toPoint.x, toPoint.y, duration, easer);
    }
}
}
