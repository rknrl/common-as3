//       ___       ___       ___       ___       ___
//      /\  \     /\__\     /\__\     /\  \     /\__\
//     /::\  \   /:/ _/_   /:| _|_   /::\  \   /:/  /
//    /::\:\__\ /::-"\__\ /::|/\__\ /::\:\__\ /:/__/
//    \;:::/  / \;:;-",-" \/|::/  / \;:::/  / \:\  \
//     |:\/__/   |:|  |     |:/  /   |:\/__/   \:\__\
//      \|__|     \|__|     \/__/     \|__|     \/__/

package ru.rknrl.common {
import flash.display.DisplayObject;
import flash.events.MouseEvent;

public class Clicks {
    public static function isTargetDescendantOf(parent:DisplayObject, event:MouseEvent):Boolean {
        return isDescendantOf(parent, DisplayObject(event.target));
    }

    public static function isDescendantOf(parent:DisplayObject, descendant:DisplayObject):Boolean {
        while (descendant != null) {
            if (descendant == parent) return true;
            descendant = descendant.parent;
        }
        return false;
    }
}
}
