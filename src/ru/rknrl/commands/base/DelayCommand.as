package ru.rknrl.commands.base {
import flash.utils.setTimeout;

import ru.rknrl.commands.Command;

public class DelayCommand extends Command {
    private var duration:int;

    public function DelayCommand(duration:int) {
        this.duration = duration;
    }

    override public function run():void {
        start();
        setTimeout(complete, duration);
    }
}
}
