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
    public static const ORIENTATION_CHANGING:String = "orientationChanging";
    public static const ORIENTATION_CHANGE:String = "orientationChange";

    public static const PORTRAIT:String = "portrait";
    public static const LANDSCAPE:String = "landscape";

    public static const DEFAULT:String = "default";
    public static const ROTATED_RIGHT:String = "rotatedRight";
    public static const ROTATED_LEFT:String = "rotatedLeft";
    public static const UPSIDE_DOWN:String = "upsideDown";
    public static const UNKNOWN:String = "unknown";

    public static function get isIOS():Boolean {
        return Capabilities.os.match(/iphone/i);
    }

    public static function get isAndroid():Boolean {
        return Capabilities.manufacturer.match(/android/i);
    }

    public static function get isMobile():Boolean {
        if (isIOS) return true;
        if (isAndroid) return true;
        return false;
    }
}
}
