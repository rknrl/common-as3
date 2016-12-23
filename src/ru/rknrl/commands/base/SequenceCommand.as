package ru.rknrl.commands.base {
import flash.events.Event;

import ru.rknrl.commands.Command;
import ru.rknrl.commands.ICommand;

public class SequenceCommand extends Command {
    private var _commands:Vector.<ICommand>;

    public function get commands():Vector.<ICommand> {
        return _commands;
    }

    private var currentIndex:int = 0;

    public function SequenceCommand(commands:Vector.<ICommand>) {
        _commands = commands;
    }

    override public function run():void {
        start();
        runNext();
    }

    public function runNext():void {
        if (currentIndex < _commands.length) {
            _commands[currentIndex].addEventListener(COMPLETE, onComplete);
            _commands[currentIndex].run();
        } else {
            complete();
        }
    }

    private function onComplete(event:Event):void {
        _commands[currentIndex].removeEventListener(COMPLETE, onComplete);
        currentIndex++;
        runNext();
    }
}
}
