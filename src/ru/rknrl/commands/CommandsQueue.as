package ru.rknrl.commands {
import flash.events.Event;

public class CommandsQueue {
    private const commands:Vector.<Command> = new <Command>[];
    private var currentCommand:Command;

    public function add(command:Command):void {
        commands.push(command);
        if (!currentCommand) runNext();
    }

    private function runNext():void {
        currentCommand = commands.shift();
        currentCommand.addEventListener(Command.COMPLETE, onComplete);
        currentCommand.run();
    }

    private function onComplete(event:Event):void {
        currentCommand.removeEventListener(Command.COMPLETE, onComplete);
        currentCommand = null;
        if (commands.length > 0) runNext();
    }

    public function destroy():void {
        commands.length = 0;
    }
}
}
