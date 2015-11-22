//       ___       ___       ___       ___       ___
//      /\  \     /\__\     /\__\     /\  \     /\__\
//     /::\  \   /:/ _/_   /:| _|_   /::\  \   /:/  /
//    /::\:\__\ /::-"\__\ /::|/\__\ /::\:\__\ /:/__/
//    \;:::/  / \;:;-",-" \/|::/  / \;:::/  / \:\  \
//     |:\/__/   |:|  |     |:/  /   |:\/__/   \:\__\
//      \|__|     \|__|     \/__/     \|__|     \/__/

package ru.rknrl.display {
import flash.display.DisplayObject;

public class Align {
    /**
     * Расставляет центры displayObjects по горизонтали
     * @return total width
     */
    public static function horizontal(displayObjects:Vector.<DisplayObject>, itemWidth:Number, gap:Number):Number {
        if (displayObjects.length == 0) return 0;
        var x:Number = 0;
        for each(var displayObject:DisplayObject in displayObjects) {
            displayObject.x = x + itemWidth / 2;
            x += itemWidth + gap;
        }
        return x - gap;
    }
}
}
