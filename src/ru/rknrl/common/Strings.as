//       ___       ___       ___       ___       ___
//      /\  \     /\__\     /\__\     /\  \     /\__\
//     /::\  \   /:/ _/_   /:| _|_   /::\  \   /:/  /
//    /::\:\__\ /::-"\__\ /::|/\__\ /::\:\__\ /:/__/
//    \;:::/  / \;:;-",-" \/|::/  / \;:::/  / \:\  \
//     |:\/__/   |:|  |     |:/  /   |:\/__/   \:\__\
//      \|__|     \|__|     \/__/     \|__|     \/__/

package ru.rknrl.common {
public class Strings {
    /**
     * Convert first character to upper case
     * "word" => "Word"
     */
    public static function capitalize(s:String):String {
        if (s == null) return null;
        if (s.length == 0) return s;
        return s.charAt(0).toUpperCase() + s.substr(1, s.length);
    }

    /**
     * Convert first character to lower case
     * "Word" => "word"
     */
    public static function uncapitalize(s:String):String {
        if (s == null) return null;
        if (s.length == 0) return s;
        return s.charAt(0).toLocaleLowerCase() + s.substr(1, s.length);
    }

    private static const NUMBERS:Vector.<String> = new <String>["0", "1", "2", "3", "4", "5", "6", "7", "8", "9"];

    /**
     * Return true if char in "0"-"9" range
     */
    public static function isNumber(char:String):Boolean {
        return NUMBERS.indexOf(char) > -1;
    }


    public static function getCharIndices(text:String, char:String):Vector.<int> {
        const indices:Vector.<int> = new <int>[];
        if (text == null) return indices;

        var i:int = -1;

        while ((i = text.indexOf(char, i + 1)) > -1) {
            indices.push(i);
        }

        return indices;
    }
}
}
