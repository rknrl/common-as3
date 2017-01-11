package ru.rknrl.commands.display {
import flash.display.DisplayObject;

import ru.rknrl.commands.Command;

public class SetVisibleCommand extends Command {
    private var target:DisplayObject;
    private var visible:Boolean;

    public function SetVisibleCommand(target:DisplayObject, visible:Boolean) {
        this.target = target;
        this.visible = visible;
    }

    override public function run():void {
        target.visible = visible;
        complete();
    }
}
}
