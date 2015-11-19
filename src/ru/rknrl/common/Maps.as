//       ___       ___       ___       ___       ___
//      /\  \     /\__\     /\__\     /\  \     /\__\
//     /::\  \   /:/ _/_   /:| _|_   /::\  \   /:/  /
//    /::\:\__\ /::-"\__\ /::|/\__\ /::\:\__\ /:/__/
//    \;:::/  / \;:;-",-" \/|::/  / \;:::/  / \:\  \
//     |:\/__/   |:|  |     |:/  /   |:\/__/   \:\__\
//      \|__|     \|__|     \/__/     \|__|     \/__/

package ru.rknrl.common {
import flash.utils.Dictionary;

public class Maps {
    public static function copyObject(hash:Object):Object {
        const result:Object = {};
        for (var key:String in hash) {
            result[key] = hash[key];
        }
        return result;
    }

    public static function copyDictionary(hash:Dictionary):Dictionary {
        const result:Dictionary = new Dictionary();
        for (var key:String in hash) {
            result[key] = hash[key];
        }
        return result;
    }

    public static function firstKey(hash:Object):String {
        for (var key:String in hash) {
            return key;
        }
        return null;
    }

    public static function firstValue(hash:Object):* {
        for each(var value:* in hash) {
            return value;
        }
        return null;
    }

    public static function size(hash:Object):int {
        var i:int = 0;
        for each(var value:* in hash) {
            i++;
        }
        return i;
    }

    public static function isEmpty(hash:Object):Boolean {
        return size(hash) == 0;
    }

    public static function notEmpty(hash:Object):Boolean {
        return size(hash) > 0;
    }
}
}
