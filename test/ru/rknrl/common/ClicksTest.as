//       ___       ___       ___       ___       ___
//      /\  \     /\__\     /\__\     /\  \     /\__\
//     /::\  \   /:/ _/_   /:| _|_   /::\  \   /:/  /
//    /::\:\__\ /::-"\__\ /::|/\__\ /::\:\__\ /:/__/
//    \;:::/  / \;:;-",-" \/|::/  / \;:::/  / \:\  \
//     |:\/__/   |:|  |     |:/  /   |:\/__/   \:\__\
//      \|__|     \|__|     \/__/     \|__|     \/__/

package ru.rknrl.common {
import flash.display.Sprite;

import org.flexunit.asserts.assertFalse;
import org.flexunit.asserts.assertTrue;

public class ClicksTest {
    [Test]
    public function isDescendantOfTest():void {
        const sprite1:Sprite = new Sprite();
        const sprite2:Sprite = new Sprite();
        const sprite3:Sprite = new Sprite();
        assertTrue(Clicks.isDescendantOf(sprite1, sprite1));
        assertFalse(Clicks.isDescendantOf(sprite1, sprite2));

        sprite1.addChild(sprite2);
        sprite2.addChild(sprite3);
        assertTrue(Clicks.isDescendantOf(sprite1, sprite2));
        assertTrue(Clicks.isDescendantOf(sprite1, sprite3));
    }
}
}
