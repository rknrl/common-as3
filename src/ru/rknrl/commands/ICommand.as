package ru.rknrl.commands {
import flash.events.IEventDispatcher;

public interface ICommand extends IEventDispatcher {
    function run():void;
}
}
