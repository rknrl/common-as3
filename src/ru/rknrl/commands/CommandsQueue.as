package ru.rknrl.commands {
import flash.events.Event;
import flash.utils.getTimer;

public class CommandsQueue {
    private const commands:Vector.<Command> = new <Command>[];
    private var currentCommand:Command;
    private var startTime:int;

    public function add(command:Command):void {
        commands.push(command);
        if (!currentCommand) runNext();
    }

    private function runNext():void {
        startTime = getTimer();
        currentCommand = commands.shift();
        currentCommand.addEventListener(Command.COMPLETE, onComplete);
        currentCommand.run();
    }

    private function onComplete(event:Event):void {
        currentCommand.removeEventListener(Command.COMPLETE, onComplete);
        currentCommand = null;
        if (commands.length > 0) runNext();
    }
}
}
