package ru.rknrl.commands.display {
import flash.events.Event;
import flash.events.IEventDispatcher;

import ru.rknrl.commands.Command;

public class DispatchEventCommand extends Command {
    private var target:IEventDispatcher;
    private var event:Event;

    public function DispatchEventCommand(target:IEventDispatcher, event:Event) {
        this.target = target;
        this.event = event;
    }

    override public function run():void {
        target.dispatchEvent(event);
        complete();
    }
}
}
