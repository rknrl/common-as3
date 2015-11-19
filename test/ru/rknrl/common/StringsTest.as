//       ___       ___       ___       ___       ___
//      /\  \     /\__\     /\__\     /\  \     /\__\
//     /::\  \   /:/ _/_   /:| _|_   /::\  \   /:/  /
//    /::\:\__\ /::-"\__\ /::|/\__\ /::\:\__\ /:/__/
//    \;:::/  / \;:;-",-" \/|::/  / \;:::/  / \:\  \
//     |:\/__/   |:|  |     |:/  /   |:\/__/   \:\__\
//      \|__|     \|__|     \/__/     \|__|     \/__/

package ru.rknrl.common {
import org.flexunit.asserts.assertEquals;
import org.flexunit.asserts.assertFalse;
import org.flexunit.asserts.assertNull;
import org.flexunit.asserts.assertTrue;

public class StringsTest {
    [Test]
    public function isNumberTest():void {
        assertTrue(Strings.isNumber("0"));
        assertTrue(Strings.isNumber("1"));
        assertFalse(Strings.isNumber("a"));
        assertFalse(Strings.isNumber(""));
        assertFalse(Strings.isNumber(null));
    }

    [Test]
    public function capitalizeTest():void {
        assertNull(Strings.capitalize(null));
        assertEquals("", Strings.capitalize(""));
        assertEquals("A", Strings.capitalize("a"));
        assertEquals("A", Strings.capitalize("A"));
        assertEquals("Hello world", Strings.capitalize("hello world"));
    }

    [Test]
    public function uncapitalizeTest():void {
        assertNull(Strings.capitalize(null));
        assertEquals("", Strings.uncapitalize(""));
        assertEquals("a", Strings.uncapitalize("A"));
        assertEquals("a", Strings.uncapitalize("a"));
        assertEquals("hello world", Strings.uncapitalize("Hello world"));
    }
}
}
