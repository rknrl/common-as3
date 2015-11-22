//       ___       ___       ___       ___       ___
//      /\  \     /\__\     /\__\     /\  \     /\__\
//     /::\  \   /:/ _/_   /:| _|_   /::\  \   /:/  /
//    /::\:\__\ /::-"\__\ /::|/\__\ /::\:\__\ /:/__/
//    \;:::/  / \;:;-",-" \/|::/  / \;:::/  / \:\  \
//     |:\/__/   |:|  |     |:/  /   |:\/__/   \:\__\
//      \|__|     \|__|     \/__/     \|__|     \/__/

package ru.rknrl.common {
import org.flexunit.asserts.assertEquals;

public class StringsGetCharIndicesTest {

    [Test]
    public function testNull():void {
        assertEquals(0, Strings.getCharIndices(null, "a").length);
    }

    [Test]
    public function testEmpty():void {
        assertEquals(0, Strings.getCharIndices("", "a").length);
    }

    [Test]
    public function testOne():void {
        assertEquals(0, Strings.getCharIndices("a", "a")[0]);
        assertEquals(1, Strings.getCharIndices("a", "a").length);

        assertEquals(0, Strings.getCharIndices("b", "a").length);
    }

    [Test]
    public function testFirst():void {
        const indices:Vector.<int> = Strings.getCharIndices("ahhhh hhh h", "a");
        assertEquals(0, indices[0]);
        assertEquals(1, indices.length);
    }

    [Test]
    public function testLast():void {
        const indices:Vector.<int> = Strings.getCharIndices("hhhha", "a");
        assertEquals(4, indices[0]);
        assertEquals(1, indices.length);
    }

    [Test]
    public function testMany():void {
        const indices:Vector.<int> = Strings.getCharIndices("ha ha ha", "a");
        assertEquals(1, indices[0]);
        assertEquals(4, indices[1]);
        assertEquals(7, indices[2]);
        assertEquals(3, indices.length);
    }

    [Test]
    public function testNear():void {
        const indices:Vector.<int> = Strings.getCharIndices("haah", "a");
        assertEquals(1, indices[0]);
        assertEquals(2, indices[1]);
        assertEquals(2, indices.length);
    }
}
}
