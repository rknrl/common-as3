//       ___       ___       ___       ___       ___
//      /\  \     /\__\     /\__\     /\  \     /\__\
//     /::\  \   /:/ _/_   /:| _|_   /::\  \   /:/  /
//    /::\:\__\ /::-"\__\ /::|/\__\ /::\:\__\ /:/__/
//    \;:::/  / \;:;-",-" \/|::/  / \;:::/  / \:\  \
//     |:\/__/   |:|  |     |:/  /   |:\/__/   \:\__\
//      \|__|     \|__|     \/__/     \|__|     \/__/

package ru.rknrl.display {
import flash.display.DisplayObject;
import flash.display.Sprite;

import org.flexunit.asserts.assertEquals;

public class AlignTest {
    [Test]
    public function empty():void {
        assertEquals(0, Align.horizontal(new <DisplayObject>[], 100, 10));
    }

    [Test]
    public function one():void {
        const s0:Sprite = new Sprite();
        assertEquals(100, Align.horizontal(new <DisplayObject>[s0], 100, 10));

        assertEquals(s0.x, 50);
    }

    [Test]
    public function t0():void {
        const s0:Sprite = new Sprite();
        const s1:Sprite = new Sprite();
        const s2:Sprite = new Sprite();
        assertEquals(320, Align.horizontal(new <DisplayObject>[s0, s1, s2], 100, 10));

        assertEquals(s0.x, 50);
        assertEquals(s1.x, 160);
        assertEquals(s2.x, 270);
    }
}
}
