package ru.rknrl.commands.display {
import flash.text.TextField;

import ru.rknrl.commands.Command;

public class SetTextCommand extends Command {
    private var textField:TextField;
    private var text:String;

    public function SetTextCommand(textField:TextField, text:String) {
        this.textField = textField;
        this.text = text;
    }

    override public function run():void {
        textField.text = text;
        complete();
    }
}
}
