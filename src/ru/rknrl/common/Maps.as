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
        copyImpl(hash, result);
        return result;
    }

    public static function copyDictionary(hash:Dictionary):Dictionary {
        const result:Dictionary = new Dictionary();
        copyImpl(hash, result);
        return result;
    }

    private static function copyImpl(hash:Object, result:Object):void {
        for (var key:* in hash) {
            result[key] = hash[key];
        }
    }

    public static function mergeObject(a:Object, b:Object):Object {
        const result:Object = {};
        mergeImpl(a, b, result);
        return result;
    }

    public static function mergeDictionary(a:Dictionary, b:Dictionary):Dictionary {
        const result:Dictionary = new Dictionary();
        mergeImpl(a, b, result);
        return result;
    }

    private static function mergeImpl(a:Object, b:Object, result:Object):void {
        for (var key:* in a) {
            result[key] = a[key];
        }
        for (key in b) {
            if (result[key] != undefined) throw new Error("Maps.merge: duplicate key " + key);
            result[key] = b[key];
        }
    }

    public static function firstKey(hash:Object):* {
        for (var key:* in hash) {
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

    public static function keys(hash: Object): Array {
        const arr: Array = [];
        for (var key:* in hash) {
            arr.push(key);
        }
        return arr;
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
