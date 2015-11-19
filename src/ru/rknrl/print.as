//       ___       ___       ___       ___       ___
//      /\  \     /\__\     /\__\     /\  \     /\__\
//     /::\  \   /:/ _/_   /:| _|_   /::\  \   /:/  /
//    /::\:\__\ /::-"\__\ /::|/\__\ /::\:\__\ /:/__/
//    \;:::/  / \;:;-",-" \/|::/  / \;:::/  / \:\  \
//     |:\/__/   |:|  |     |:/  /   |:\/__/   \:\__\
//      \|__|     \|__|     \/__/     \|__|     \/__/

package ru.rknrl {
import flash.utils.Dictionary;
import flash.utils.getQualifiedClassName;

public function print(hash:Object, space:String = "", printed:Dictionary = null):String {
    if (hash == null) return "null";

    const className:String = getQualifiedClassName(hash);
    const isHash:Boolean = className == "Object" || className == "flash.utils::Dictionary";
    const VECTOR:String = "__AS3__.vec::Vector";
    const isArray:Boolean = className == "Array" || className.substr(0, VECTOR.length) == VECTOR;

    if (isHash || isArray) {
        if (!printed) printed = new Dictionary();
        if (printed[hash]) return "@link";
        printed[hash] = true;

        var s:String = "";

        const newSpace:String = space + "  ";

        for (var key:String in hash) {
            const value:Object = hash[key];
            s += newSpace + key + "=" + print(value, newSpace, printed) + "\n";
        }

        if (s.length) {
            return isArray ? "[\n" + s + space + "]" : "{\n" + s + space + "}";
        } else {
            return isArray ? "[]" : "{}";
        }
    } else if (hash is String) {
        return '"' + hash + '"';
    } else {
        return hash.toString();
    }
}
}
