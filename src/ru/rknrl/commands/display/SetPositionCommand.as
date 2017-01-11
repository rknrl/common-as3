package ru.rknrl.commands.display {
import flash.display.DisplayObject;
import flash.geom.Point;

import ru.rknrl.commands.Command;

public class SetPositionCommand extends Command {
    private var target:DisplayObject;
    private var x:Number;
    private var y:Number;

    public function SetPositionCommand(target:DisplayObject, x:Number, y:Number) {
        this.target = target;
        this.x = x;
        this.y = y;
    }

    override public function run():void {
        target.x = x;
        target.y = y;
        complete();
    }

    public static function fromPoint(target:DisplayObject, point:Point):SetPositionCommand {
        return new SetPositionCommand(target, point.x, point.y);
    }
}
}
