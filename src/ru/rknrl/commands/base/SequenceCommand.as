package ru.rknrl.commands.base {
import flash.events.Event;

import ru.rknrl.commands.Command;

public class SequenceCommand extends Command {
    private var commands:Vector.<Command>;
    private var currentIndex:int = 0;

    public function SequenceCommand(commands:Vector.<Command>) {
        this.commands = commands;
    }

    override public function run():void {
        start();
        runNext();
    }

    public function runNext():void {
        if (currentIndex < commands.length) {
            commands[currentIndex].addEventListener(COMPLETE, onComplete);
            commands[currentIndex].run();
        } else {
            complete();
        }
    }

    private function onComplete(event:Event):void {
        commands[currentIndex].removeEventListener(COMPLETE, onComplete);
        currentIndex++;
        runNext();
    }
}
}
