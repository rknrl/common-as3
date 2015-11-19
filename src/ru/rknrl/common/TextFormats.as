//       ___       ___       ___       ___       ___
//      /\  \     /\__\     /\__\     /\  \     /\__\
//     /::\  \   /:/ _/_   /:| _|_   /::\  \   /:/  /
//    /::\:\__\ /::-"\__\ /::|/\__\ /::\:\__\ /:/__/
//    \;:::/  / \;:;-",-" \/|::/  / \;:::/  / \:\  \
//     |:\/__/   |:|  |     |:/  /   |:\/__/   \:\__\
//      \|__|     \|__|     \/__/     \|__|     \/__/

package ru.rknrl.common {
import flash.text.TextField;
import flash.text.TextFormat;

public class TextFormats {
    /**
     * Находит в тексте числа с дробной частью
     * и уменьшает шрифт дробным цифрам
     *
     * "2.00 + 2.00" => "2.oo + 2.oo"
     */
    public static function formatNumbers(textField:TextField, scale:Number = 0.8):void {
        const smallTextFormat:TextFormat = clone(textField.defaultTextFormat);
        smallTextFormat.size = Number(smallTextFormat.size) * scale;

        const text:String = textField.text;

        const indices:Vector.<int> = new <int>[];
        for (var i:int = 0; i < text.length - 2; i++) {
            if (text.charAt(i) == "." &&
                    Strings.isNumber(text.charAt(i + 1)) &&
                    Strings.isNumber(text.charAt(i + 2))) {
                indices.push(i);
            }
        }

        for each (var index:int in indices) {
            textField.setTextFormat(smallTextFormat, index, index + 3);
        }
    }

    public static function clone(textFormat:TextFormat):TextFormat {
        return new TextFormat(
                textFormat.font,
                textFormat.size,
                textFormat.color,
                textFormat.bold,
                textFormat.italic,
                textFormat.underline,
                textFormat.url,
                textFormat.target,
                textFormat.align,
                textFormat.leftMargin,
                textFormat.rightMargin,
                textFormat.indent,
                textFormat.leading
        )
    }
}
}
