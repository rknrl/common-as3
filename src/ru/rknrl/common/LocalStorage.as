//       ___       ___       ___       ___       ___
//      /\  \     /\__\     /\__\     /\  \     /\__\
//     /::\  \   /:/ _/_   /:| _|_   /::\  \   /:/  /
//    /::\:\__\ /::-"\__\ /::|/\__\ /::\:\__\ /:/__/
//    \;:::/  / \;:;-",-" \/|::/  / \;:::/  / \:\  \
//     |:\/__/   |:|  |     |:/  /   |:\/__/   \:\__\
//      \|__|     \|__|     \/__/     \|__|     \/__/

package ru.rknrl.common {
import flash.net.SharedObject;

import ru.rknrl.log.Log;

public class LocalStorage {
    private var sharedObject:SharedObject;

    public function LocalStorage(name:String) {
        try {
            sharedObject = SharedObject.getLocal(name);
        } catch (e:Error) {
            Log.error("ShaderObject.getLocal: " + e, null);
        }
    }

    public function get isAvailable():Boolean {
        return sharedObject;
    }

    public function get data():Object {
        if (!sharedObject) throw new Error("SharedObject isn't available");
        return sharedObject.data;
    }

    public function flush():void {
        if (!sharedObject) throw new Error("SharedObject isn't available");
        try {
            sharedObject.flush();
        } catch (e:Error) {
            Log.error("ShaderObject.flush: " + e, e.getStackTrace());
        }
    }
}
}
