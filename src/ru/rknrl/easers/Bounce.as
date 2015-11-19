//       ___       ___       ___       ___       ___
//      /\  \     /\__\     /\__\     /\  \     /\__\
//     /::\  \   /:/ _/_   /:| _|_   /::\  \   /:/  /
//    /::\:\__\ /::-"\__\ /::|/\__\ /::\:\__\ /:/__/
//    \;:::/  / \;:;-",-" \/|::/  / \;:::/  / \:\  \
//     |:\/__/   |:|  |     |:/  /   |:\/__/   \:\__\
//      \|__|     \|__|     \/__/     \|__|     \/__/

package ru.rknrl.easers {
/**
 * Отскок
 */
public class Bounce implements IEaser {

    public function ease(fraction:Number):Number {
        return easeOut(fraction, 0, 1, 1);
    }

    public static function easeOut(t:Number, b:Number, c:Number, d:Number):Number {
        if ((t /= d) < (1 / 2.75))
            return c * (7.5625 * t * t) + b;

        else if (t < (2 / 2.75))
            return c * (7.5625 * (t -= (1.5 / 2.75)) * t + 0.75) + b;

        else if (t < (2.5 / 2.75))
            return c * (7.5625 * (t -= (2.25 / 2.75)) * t + 0.9375) + b;

        else
            return c * (7.5625 * (t -= (2.625 / 2.75)) * t + 0.984375) + b;
    }
}
}
