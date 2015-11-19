//       ___       ___       ___       ___       ___
//      /\  \     /\__\     /\__\     /\  \     /\__\
//     /::\  \   /:/ _/_   /:| _|_   /::\  \   /:/  /
//    /::\:\__\ /::-"\__\ /::|/\__\ /::\:\__\ /:/__/
//    \;:::/  / \;:;-",-" \/|::/  / \;:::/  / \:\  \
//     |:\/__/   |:|  |     |:/  /   |:\/__/   \:\__\
//      \|__|     \|__|     \/__/     \|__|     \/__/

package ru.rknrl.common {
public class JsonParse {
    private var data:Object;

    public function JsonParse(data:Object) {
        this.data = data;
    }

    public function getObject(name:String):Object {
        check(name);
        return data[name];
    }

    public function getInt(name:String):int {
        check(name);
        return data[name];
    }

    public function getBool(name:String):Boolean {
        check(name);
        return data[name];
    }

    public function getString(name:String):String {
        check(name);
        return data[name];
    }

    public function getArray(name:String):Array {
        check(name);
        if (!(data[name] is Array)) throw new Error("property " + name + " isn't array, but " + data[name]);
        return data[name];
    }

    private function check(name:String):void {
        if (!data.hasOwnProperty(name)) throw new Error("Can't find property " + name + " in " + JSON.stringify(data));
    }
}
}
