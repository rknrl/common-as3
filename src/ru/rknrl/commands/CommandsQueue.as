package ru.rknrl.commands {
import flash.events.Event;

public class CommandsQueue {
    private const commands:Vector.<ICommand> = new <ICommand>[];
    private var currentCommand:ICommand;

    public function add(command:ICommand):void {
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
