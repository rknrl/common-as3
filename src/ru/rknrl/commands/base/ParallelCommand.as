package ru.rknrl.commands.base {
import flash.events.Event;

import ru.rknrl.commands.Command;
import ru.rknrl.commands.ICommand;

public class ParallelCommand extends Command {
    private var _commands:Vector.<ICommand>;

    public function get commands():Vector.<ICommand> {
        return _commands;
    }

    private var completed:int;

    public function ParallelCommand(commands:Vector.<ICommand>) {
        this._commands = commands;
    }

    override public function run():void {
        start();
        if (_commands.length == 0) {
            complete();
        } else {
            for each (var command:Command in _commands) {
                command.addEventListener(COMPLETE, onComplete);
                command.run();
            }
        }
    }

    private function onComplete(event:Event):void {
        event.target.removeEventListener(COMPLETE, onComplete);
        completed++;
        if (completed == _commands.length) {
            complete();
        }
    }
}
}
