package ru.rknrl.commands.display {
import flash.display.DisplayObject;

import ru.rknrl.commands.Command;

public class SetAlphaCommand extends Command {
    private var target:DisplayObject;
    private var alpha:Number;

    public function SetAlphaCommand(target:DisplayObject, alpha:Number) {
        this.target = target;
        this.alpha = alpha;
    }

    override public function run():void {
        target.alpha = alpha;
        complete();
    }
}
}
