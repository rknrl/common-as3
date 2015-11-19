//       ___       ___       ___       ___       ___
//      /\  \     /\__\     /\__\     /\  \     /\__\
//     /::\  \   /:/ _/_   /:| _|_   /::\  \   /:/  /
//    /::\:\__\ /::-"\__\ /::|/\__\ /::\:\__\ /:/__/
//    \;:::/  / \;:;-",-" \/|::/  / \;:::/  / \:\  \
//     |:\/__/   |:|  |     |:/  /   |:\/__/   \:\__\
//      \|__|     \|__|     \/__/     \|__|     \/__/

package ru.rknrl.easers {
/**
 * Класс Linear обеспечивает определение замедления на трех этапах:
 * ускорение, равномерное воспроизведение и замедление.
 * После начала анимации она воспроизводится в ускоренном режиме в течение времени,
 * определенного в свойстве easeInFraction,
 * затем на следующем этапе воспроизведения используется равномерный (линейный) режим
 * воспроизведения, после чего скорость воспроизведения будет уменьшаться до
 * завершения периода, определенного свойством easeOutFraction.
 */
public class Linear implements IEaser {

    /**
     *  @param easeInFraction The fraction of the overall duration
     *  in the acceleration phase, between 0.0 and 1.0.
     *
     *  @param easeOutFraction The fraction of the overall duration
     *  in the deceleration phase, between 0.0 and 1.0.
     */
    public function Linear(easeInFraction:Number = 0, easeOutFraction:Number = 0) {
        this.easeInFraction = easeInFraction;
        this.easeOutFraction = easeOutFraction;
    }

    private var _easeInFraction:Number = 0;

    public function get easeInFraction():Number {
        return _easeInFraction;
    }

    public function set easeInFraction(value:Number):void {
        _easeInFraction = value;
    }

    private var _easeOutFraction:Number = 0;

    public function get easeOutFraction():Number {
        return _easeOutFraction;
    }

    public function set easeOutFraction(value:Number):void {
        _easeOutFraction = value;
    }

    public function ease(fraction:Number):Number {
        if (_easeInFraction == 0 && _easeOutFraction == 0)
            return fraction;

        var runRate:Number = 1 / (1 - _easeInFraction / 2 - _easeOutFraction / 2);
        if (fraction < _easeInFraction)
            return fraction * runRate * (fraction / _easeInFraction) / 2;
        if (fraction > (1 - _easeOutFraction)) {
            var decTime:Number = fraction - (1 - _easeOutFraction);
            var decProportion:Number = decTime / _easeOutFraction;
            return runRate * (1 - _easeInFraction / 2 - _easeOutFraction +
                    decTime * (2 - decProportion) / 2);
        }
        return runRate * (fraction - _easeInFraction / 2);
    }
}
}
