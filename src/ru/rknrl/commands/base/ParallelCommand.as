package ru.rknrl.commands.base {
import flash.events.Event;

import ru.rknrl.commands.Command;

public class ParallelCommand extends Command {
    private var commands:Vector.<Command>;
    private var completed:int;

    public function ParallelCommand(commands:Vector.<Command>) {
        this.commands = commands;
    }

    override public function run():void {
        start();
        if (commands.length == 0) {
            complete();
        } else {
            for each (var command:Command in commands) {
                command.addEventListener(COMPLETE, onComplete);
                command.run();
            }
        }
    }

    private function onComplete(event:Event):void {
        event.target.removeEventListener(COMPLETE, onComplete);
        completed++;
        if (completed == commands.length) {
            complete();
        }
    }
}
}
