//       ___       ___       ___       ___       ___
//      /\  \     /\__\     /\__\     /\  \     /\__\
//     /::\  \   /:/ _/_   /:| _|_   /::\  \   /:/  /
//    /::\:\__\ /::-"\__\ /::|/\__\ /::\:\__\ /:/__/
//    \;:::/  / \;:;-",-" \/|::/  / \;:::/  / \:\  \
//     |:\/__/   |:|  |     |:/  /   |:\/__/   \:\__\
//      \|__|     \|__|     \/__/     \|__|     \/__/

package ru.rknrl.easers {
public function interpolate(prev:Number, next:Number, currentTime:int, startTime:int, duration:int, easer:IEaser):Number {
    const deltaTime:int = currentTime - startTime;
    var progress:Number = deltaTime / duration;
    if (progress >= 1) progress = 1;
    const value:Number = easer.ease(progress);
    return prev + (next - prev) * value;
}
}
