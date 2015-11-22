//       ___       ___       ___       ___       ___
//      /\  \     /\__\     /\__\     /\  \     /\__\
//     /::\  \   /:/ _/_   /:| _|_   /::\  \   /:/  /
//    /::\:\__\ /::-"\__\ /::|/\__\ /::\:\__\ /:/__/
//    \;:::/  / \;:;-",-" \/|::/  / \;:::/  / \:\  \
//     |:\/__/   |:|  |     |:/  /   |:\/__/   \:\__\
//      \|__|     \|__|     \/__/     \|__|     \/__/

package ru.rknrl.common {
import flash.utils.Dictionary;

import org.flexunit.asserts.assertEquals;

public class PrintTest {
    [Test]
    public function testNull():void {
        assertEquals("null", print(null))
    }

    [Test]
    public function testUndefined():void {
        assertEquals("null", print(undefined))
    }

    [Test]
    public function testInt():void {
        assertEquals("123", print(123))
    }

    [Test]
    public function testNumber():void {
        assertEquals("123.23", print(123.23))
    }

    [Test]
    public function testNaN():void {
        assertEquals("NaN", print(NaN))
    }

    [Test]
    public function testInfinity():void {
        assertEquals("Infinity", print(Infinity));
        assertEquals("Infinity", print(Number.POSITIVE_INFINITY));
        assertEquals("-Infinity", print(Number.NEGATIVE_INFINITY));
    }

    [Test]
    public function testBoolean():void {
        assertEquals("true", print(true));
        assertEquals("false", print(false))
    }

    [Test]
    public function testString():void {
        assertEquals('"fuck"', print("fuck"))
    }

    [Test]
    public function testEmptyString():void {
        assertEquals('""', print(""))
    }

    [Test]
    public function testToString():void {
        assertEquals("TestObject.toString", print(new TestObject()))
    }

    [Test]
    public function testArray():void {
        assertEquals(
                "[\n" +
                "  0=100\n" +
                "  1=101\n" +
                "  2=102\n" +
                "]",
                print([100, 101, 102]))
    }

    [Test]
    public function testEmptyArray():void {
        assertEquals(
                "[]",
                print([]))
    }

    [Test]
    public function testVectorNumber():void {
        assertEquals(
                "[\n" +
                "  0=10.1\n" +
                "  1=10.2\n" +
                "  2=10.3\n" +
                "]",
                print(new <Number>[10.1, 10.2, 10.3]))
    }

    [Test]
    public function testEmptyVectorNumber():void {
        assertEquals(
                "[]",
                print(new <Number>[]))
    }

    [Test]
    public function testVectorString():void {
        assertEquals(
                "[\n" +
                '  0="bla"\n' +
                '  1="bla"\n' +
                '  2="blah"\n' +
                "]",
                print(new <String>["bla", "bla", "blah"]))
    }

    [Test]
    public function testEmptyVectorString():void {
        assertEquals(
                "[]",
                print(new <String>[]))
    }

    [Test]
    public function testObject():void {
        assertEquals(
                "{\n" +
                '  c="Tolya"\n' +
                '  b="Yanot"\n' +
                '  a=24\n' +
                "}",
                print({
                    a: 24,
                    b: "Yanot",
                    c: "Tolya"
                }));
    }

    [Test]
    public function testEmptyObject():void {
        assertEquals(
                "{}",
                print({}))
    }

    [Test]
    public function testDictionary():void {
        const d:Dictionary = new Dictionary();
        d["a"] = 24;
        d["b"] = "Yanot";
        d["c"] = "Tolya";

        assertEquals(
                "{\n" +
                '  c="Tolya"\n' +
                '  b="Yanot"\n' +
                '  a=24\n' +
                "}",
                print(d));
    }

    [Test]
    public function testEmptyDictionary():void {
        assertEquals(
                "{}",
                print(new Dictionary()))
    }

    [Test]
    public function testNested():void {
        assertEquals(
                "{\n" +
                "  error={}\n" +
                "  result={\n" +
                "    userInfo={\n" +
                '      c="Tolya"\n' +
                '      b="Yanot"\n' +
                '      a=24\n' +
                "    }\n" +
                "  }\n" +
                "}",
                print({
                    result: {
                        userInfo: {
                            a: 24,
                            b: "Yanot",
                            c: "Tolya"
                        }
                    },
                    error: {}
                })
        )
    }

    [Test]
    public function testDeadLock():void {
        const hash:Object = {
            a: null,
            b: "rknrl"
        };

        hash.hash = hash;

        assertEquals(
                "{\n" +
                "  hash=@link\n" +
                '  b="rknrl"\n' +
                "  a=null\n" +
                "}",
                print(hash));
    }
}
}

class TestObject {
    public function toString():String {
        return "TestObject.toString";
    }
}
