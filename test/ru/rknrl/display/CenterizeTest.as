//       ___       ___       ___       ___       ___
//      /\  \     /\__\     /\__\     /\  \     /\__\
//     /::\  \   /:/ _/_   /:| _|_   /::\  \   /:/  /
//    /::\:\__\ /::-"\__\ /::|/\__\ /::\:\__\ /:/__/
//    \;:::/  / \;:;-",-" \/|::/  / \;:::/  / \:\  \
//     |:\/__/   |:|  |     |:/  /   |:\/__/   \:\__\
//      \|__|     \|__|     \/__/     \|__|     \/__/

package ru.rknrl.display {
import flash.display.Bitmap;
import flash.display.BitmapData;

import org.flexunit.asserts.assertEquals;

public class CenterizeTest {
    [Test]
    public function CenterizeTest() {
        const bitmap:Bitmap = new Bitmap(new BitmapData(100, 70, false, 0));
        centerize(bitmap);
        assertEquals(-50, bitmap.x);
        assertEquals(-35, bitmap.x);
    }
}
}
