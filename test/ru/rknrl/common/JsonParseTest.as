//       ___       ___       ___       ___       ___
//      /\  \     /\__\     /\__\     /\  \     /\__\
//     /::\  \   /:/ _/_   /:| _|_   /::\  \   /:/  /
//    /::\:\__\ /::-"\__\ /::|/\__\ /::\:\__\ /:/__/
//    \;:::/  / \;:;-",-" \/|::/  / \;:::/  / \:\  \
//     |:\/__/   |:|  |     |:/  /   |:\/__/   \:\__\
//      \|__|     \|__|     \/__/     \|__|     \/__/

package ru.rknrl.common {
import org.flexunit.asserts.assertEquals;

public class JsonParseTest {
    private static const json:Object = {
        obj: {
            param1: 1,
            param2: 2
        },
        i: 100,
        b: true,
        s: "Hello",
        arr: [1, 2, 3, 4, 5]
    };

    [Test(description="getObject")]
    public function getObject():void {
        const parse:JsonParse = new JsonParse(json);
        parse.getObject("obj");
    }

    [Test(description="getInt")]
    public function getInt():void {
        const parse:JsonParse = new JsonParse(json);
        assertEquals(100, parse.getInt("i"));
    }

    [Test(description="getBool")]
    public function getBool():void {
        const parse:JsonParse = new JsonParse(json);
        assertEquals(true, parse.getBool("b"));
    }

    [Test(description="getString")]
    public function getString():void {
        const parse:JsonParse = new JsonParse(json);
        assertEquals("Hello", parse.getString("s"));
    }

    [Test(description="getArray")]
    public function getArray():void {
        const parse:JsonParse = new JsonParse(json);
        const arr:Array = parse.getArray("arr");
        assertEquals(5, arr.length);
    }


    [Test(expects="Error", description="getObject null check")]
    public function t0():void {
        const parse:JsonParse = new JsonParse({});
        parse.getObject("obj");
    }

    [Test(expects="Error", description="getInt null check")]
    public function t1():void {
        const parse:JsonParse = new JsonParse({});
        parse.getInt("i");
    }

    [Test(expects="Error", description="getBool null check")]
    public function t2():void {
        const parse:JsonParse = new JsonParse({});
        parse.getBool("b");
    }

    [Test(expects="Error", description="getString null check")]
    public function t3():void {
        const parse:JsonParse = new JsonParse({});
        parse.getString("s");
    }

    [Test(expects="Error", description="getArray null check")]
    public function t4():void {
        const parse:JsonParse = new JsonParse({});
        parse.getArray("arr");
    }
}
}
