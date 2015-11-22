//       ___       ___       ___       ___       ___
//      /\  \     /\__\     /\__\     /\  \     /\__\
//     /::\  \   /:/ _/_   /:| _|_   /::\  \   /:/  /
//    /::\:\__\ /::-"\__\ /::|/\__\ /::\:\__\ /:/__/
//    \;:::/  / \;:;-",-" \/|::/  / \;:::/  / \:\  \
//     |:\/__/   |:|  |     |:/  /   |:\/__/   \:\__\
//      \|__|     \|__|     \/__/     \|__|     \/__/

package ru.rknrl.display {
import flash.display.BitmapData;
import flash.display.Shape;
import flash.geom.Matrix;

public class BitmapUtils {
    public static function square(bitmapData:BitmapData, resultSize:int):BitmapData {
        const size:int = Math.min(bitmapData.width, bitmapData.height);
        const x:int = (bitmapData.width - size) / 2;
        const y:int = (bitmapData.height - size) / 2;

        const matrix:Matrix = new Matrix();
        matrix.translate(-x, -y);
        matrix.scale(resultSize / size, resultSize / size);

        const result:BitmapData = new BitmapData(resultSize, resultSize, true, 0);
        result.draw(bitmapData, matrix, null, null, null, true);
        return result;
    }

    public static function createCircleShape(squareBitmapData:BitmapData):Shape {
        const radius:int = squareBitmapData.width / 2;
        const shape:Shape = new Shape();
        shape.graphics.beginBitmapFill(squareBitmapData);
        shape.graphics.drawCircle(radius, radius, radius);
        shape.graphics.endFill();
        return shape;
    }
}
}
