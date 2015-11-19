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

import org.flexunit.asserts.assertEquals;

public class TextFormatsTest {

    [Test]
    public function formatNumbersTest():void {
        const textField:TextField = new TextField();
        textField.defaultTextFormat = new TextFormat(null, 48);
        textField.text = ".02+10.04=10.06";

        function charSize(i:int):Number {
            return Number(textField.getTextFormat(i, i + 1).size);
        }

        TextFormats.formatNumbers(textField, 0.5);

        assertEquals(24, charSize(0)); // .
        assertEquals(24, charSize(1)); // 0
        assertEquals(24, charSize(2)); // 2
        assertEquals(48, charSize(3)); // +
        assertEquals(48, charSize(4)); // 1
        assertEquals(48, charSize(5)); // 0
        assertEquals(24, charSize(6)); // .
        assertEquals(24, charSize(7)); // 0
        assertEquals(24, charSize(8)); // 4
        assertEquals(48, charSize(9)); // =
        assertEquals(48, charSize(10)); // 1
        assertEquals(48, charSize(11)); // 0
        assertEquals(24, charSize(12)); // .
        assertEquals(24, charSize(13)); // 0
        assertEquals(24, charSize(14)); // 4
    }

    [Test]
    public function formatNumbersTest2():void {
        assertNoChanges("");
        assertNoChanges("no numbers");
        assertNoChanges("numbers 2.");
        assertNoChanges("numbers 2.0");
        assertNoChanges("2.0");

        format(".");
        format("..");
        format(".............");
        format(".123.213.2.13..as.d.a.213.21.3.21.3..213");
    }

    private function format(text:String):void {
        const textField:TextField = new TextField();
        textField.text = text;
        TextFormats.formatNumbers(textField);
    }

    private function assertNoChanges(text:String):void {
        const textField:TextField = new TextField();
        textField.defaultTextFormat = new TextFormat(null, 48);
        textField.text = text;

        function charSize(i:int):Number {
            return Number(textField.getTextFormat(i, i + 1).size);
        }

        TextFormats.formatNumbers(textField);

        for (var i:int = 0; i < textField.text.length; i++) {
            assertEquals(48, charSize(i));
        }
    }
}
}
