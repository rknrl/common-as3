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
import org.flexunit.asserts.assertFalse;
import org.flexunit.asserts.assertNull;
import org.flexunit.asserts.assertTrue;

public class MapsTest {

    // empty

    [Test("isEmpty")]
    public function t0():void {
        assertTrue(Maps.isEmpty({}));
        assertTrue(Maps.isEmpty([]));
        assertTrue(Maps.isEmpty(new <int>[]));
        assertTrue(Maps.isEmpty(new Dictionary()));

        assertFalse(Maps.isEmpty({a: 1}));
        assertFalse(Maps.isEmpty([1]));
        assertFalse(Maps.isEmpty(new <int>[1]));
        const dictionary:Dictionary = new Dictionary();
        dictionary["a"] = 1;
        assertFalse(Maps.isEmpty(dictionary));
    }

    // notEmpty

    [Test("notEmpty")]
    public function t1():void {
        assertFalse(Maps.notEmpty({}));
        assertFalse(Maps.notEmpty([]));
        assertFalse(Maps.notEmpty(new <int>[]));
        assertFalse(Maps.notEmpty(new Dictionary()));

        assertTrue(Maps.notEmpty({a: 1}));
        assertTrue(Maps.notEmpty([1]));
        assertTrue(Maps.notEmpty(new <int>[1]));
        const dictionary:Dictionary = new Dictionary();
        dictionary["a"] = 1;
        assertTrue(Maps.notEmpty(dictionary));
    }

    // size

    [Test("object size")]
    public function t2():void {
        assertEquals(0, Maps.size({}));
        assertEquals(1, Maps.size({a: 1}));
        assertEquals(2, Maps.size({a: 1, b: 2}));
    }

    [Test("Dictionary size")]
    public function t3():void {
        const dictionary:Dictionary = new Dictionary();
        assertEquals(0, Maps.size(dictionary));
        dictionary["a"] = 1;
        assertEquals(1, Maps.size(dictionary));
        dictionary["b"] = 2;
        assertEquals(2, Maps.size(dictionary));
    }

    [Test("array size")]
    public function t4():void {
        assertEquals(0, Maps.size([]));
        assertEquals(1, Maps.size([1]));
        assertEquals(2, Maps.size([1, 2]));
    }

    [Test("vector size")]
    public function t5():void {
        assertEquals(0, Maps.size(new <int>[]));
        assertEquals(1, Maps.size(new <int>[1]));
        assertEquals(2, Maps.size(new <int>[1, 2]));
    }

    // first value

    [Test("object first value")]
    public function firstValue1():void {
        assertNull(Maps.firstValue({}));
        assertEquals(10, Maps.firstValue({1: 10}));
        assertEquals(10, Maps.firstValue({1: 10, 2: 20}));
    }

    [Test("Dictionart first value")]
    public function firstValue2():void {
        const dictionary:Dictionary = new Dictionary();
        assertNull(Maps.firstValue(dictionary));
        dictionary[1] = 10;
        assertEquals(10, Maps.firstValue(dictionary));
        dictionary[2] = 20;
        assertEquals(10, Maps.firstValue(dictionary));
    }

    [Test("array first value")]
    public function firstValue3():void {
        assertNull(Maps.firstValue([]));
        assertEquals(10, Maps.firstValue([10]));
        assertEquals(10, Maps.firstValue([10, 20]));
    }

    [Test("vector first value")]
    public function firstValue4():void {
        assertNull(Maps.firstValue(new <int>[]));
        assertEquals(10, Maps.firstValue(new <int>[10]));
        assertEquals(10, Maps.firstValue(new <int>[10, 20]));
    }

    // fist key

    [Test("object first key")]
    public function firstKey1():void {
        assertNull(Maps.firstKey({}));
        assertEquals(1, Maps.firstKey({1: 10}));
        assertEquals(1, Maps.firstKey({1: 10, 2: 20}));
    }

    [Test("Dictionart first key")]
    public function firstKey2():void {
        const dictionary:Dictionary = new Dictionary();
        assertNull(Maps.firstKey(dictionary));
        dictionary[1] = 10;
        assertEquals(1, Maps.firstKey(dictionary));
        dictionary[2] = 20;
        assertEquals(1, Maps.firstKey(dictionary));
    }

    [Test("array first key")]
    public function firstKey3():void {
        assertNull(Maps.firstKey([]));
        assertEquals(0, Maps.firstKey([10]));
        assertEquals(0, Maps.firstKey([10, 20]));
    }

    [Test("vector first key")]
    public function firstKey4():void {
        assertNull(Maps.firstKey(new <int>[]));
        assertEquals(0, Maps.firstKey(new <int>[10]));
        assertEquals(0, Maps.firstKey(new <int>[10, 20]));
    }

    // copy object

    [Test]
    public function copyObject():void {
        const obj:Object = {a: 1, b: 2, c: 3};
        const clone:Object = Maps.copyObject(obj);
        assertEquals(3, Maps.size(clone));
        assertEquals(1, clone["a"]);
        assertEquals(2, clone["b"]);
        assertEquals(3, clone["c"]);
    }

    // copy dictionary

    [Test]
    public function copyDictionary():void {
        const key1: KeyObject = new KeyObject();
        const key2: KeyObject = new KeyObject();

        const dict:Dictionary = new Dictionary();
        dict[key1] = 1;
        dict[key2] = 2;
        dict["c"] = 3;

        const clone:Dictionary = Maps.copyDictionary(dict);
        assertEquals(3, Maps.size(clone));
        assertEquals(1, clone[key1]);
        assertEquals(2, clone[key2]);
        assertEquals(3, clone["c"]);
    }

    // merge object

    [Test]
    public function mergeObject():void {
        const a:Object = {a: 1, b: 2, c: 3};
        const b:Object = {d: 10, e: 20, f: 30};

        const merge:Object = Maps.mergeObject(a, b);
        assertEquals(6, Maps.size(merge));
        assertEquals(1, merge["a"]);
        assertEquals(2, merge["b"]);
        assertEquals(3, merge["c"]);
        assertEquals(10, merge["d"]);
        assertEquals(20, merge["e"]);
        assertEquals(30, merge["f"]);
    }

    [Test(expects="Error")]
    public function mergeObjectConflict():void {
        const a:Object = {a: 1, b: 2, c: 3};
        const b:Object = {a: 10, e: 20, f: 30};

        Maps.mergeObject(a, b);
    }

    // merge dictionary

    [Test]
    public function mergeDictionary():void {
        const key1:KeyObject = new KeyObject(); // Проверяем, что ключи не кастяца к стрингу
        const key2:KeyObject = new KeyObject();

        const a:Dictionary = new Dictionary();
        a[key1] = 1;
        a["b"] = 2;
        a["c"] = 3;
        const b:Dictionary = new Dictionary();
        b[key2] = 10;
        b["e"] = 20;
        b["f"] = 30;

        const merge:Dictionary = Maps.mergeDictionary(a, b);
        assertEquals(6, Maps.size(merge));
        assertEquals(1, merge[key1]);
        assertEquals(2, merge["b"]);
        assertEquals(3, merge["c"]);
        assertEquals(10, merge[key2]);
        assertEquals(20, merge["e"]);
        assertEquals(30, merge["f"]);
    }

    [Test(expects="Error")]
    public function mergeDictionaryConflict():void {
        const key:Object = {};
        const a:Dictionary = new Dictionary();
        a[key] = 1;
        a["b"] = 2;
        a["c"] = 3;
        const b:Dictionary = new Dictionary();
        b[key] = 10;
        b["e"] = 20;
        b["f"] = 30;

        Maps.mergeDictionary(a, b);
    }
}
}

class KeyObject {
    public function toString():String {
        return "toString";
    }
}