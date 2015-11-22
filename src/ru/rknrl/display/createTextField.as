//       ___       ___       ___       ___       ___
//      /\  \     /\__\     /\__\     /\  \     /\__\
//     /::\  \   /:/ _/_   /:| _|_   /::\  \   /:/  /
//    /::\:\__\ /::-"\__\ /::|/\__\ /::\:\__\ /:/__/
//    \;:::/  / \;:;-",-" \/|::/  / \;:::/  / \:\  \
//     |:\/__/   |:|  |     |:/  /   |:\/__/   \:\__\
//      \|__|     \|__|     \/__/     \|__|     \/__/

package ru.rknrl.display {
import flash.text.TextField;
import flash.text.TextFieldAutoSize;
import flash.text.TextFormat;

public function createTextField(textFormat:TextFormat):TextField {
    const textField:TextField = new TextField();
    textField.autoSize = TextFieldAutoSize.LEFT;
    textField.selectable = false;
    textField.embedFonts = true;
    textField.defaultTextFormat = textFormat;
    return textField;
}
}
