//       ___       ___       ___       ___       ___
//      /\  \     /\__\     /\__\     /\  \     /\__\
//     /::\  \   /:/ _/_   /:| _|_   /::\  \   /:/  /
//    /::\:\__\ /::-"\__\ /::|/\__\ /::\:\__\ /:/__/
//    \;:::/  / \;:;-",-" \/|::/  / \;:::/  / \:\  \
//     |:\/__/   |:|  |     |:/  /   |:\/__/   \:\__\
//      \|__|     \|__|     \/__/     \|__|     \/__/

package ru.rknrl.common {
import flash.system.Capabilities;

public class Platform {
    public static function get isIOS(): Boolean {
        return Capabilities.os.match(/iphone/i);
    }

    public static function get isAndroid(): Boolean {
        return Capabilities.manufacturer.match(/android/i);
    }

    public static function get isMobile():Boolean {
        if (isIOS) return true;
        if (isAndroid) return true;
        return false;
    }
}
}
