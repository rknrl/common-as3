//       ___       ___       ___       ___       ___
//      /\  \     /\__\     /\__\     /\  \     /\__\
//     /::\  \   /:/ _/_   /:| _|_   /::\  \   /:/  /
//    /::\:\__\ /::-"\__\ /::|/\__\ /::\:\__\ /:/__/
//    \;:::/  / \;:;-",-" \/|::/  / \;:::/  / \:\  \
//     |:\/__/   |:|  |     |:/  /   |:\/__/   \:\__\
//      \|__|     \|__|     \/__/     \|__|     \/__/

package ru.rknrl.loaders.typed {
import flash.net.URLLoaderDataFormat;
import flash.utils.ByteArray;

import ru.rknrl.loaders.base.URLLoaderBase;

[Event(name="complete", type="flash.events.Event")]
[Event(name="ioError", type="flash.events.IOErrorEvent")]
[Event(name="securityError", type="flash.events.SecurityErrorEvent")]
public class ByteArrayLoader extends URLLoaderBase {
    public function ByteArrayLoader(url:String) {
        super(url, URLLoaderDataFormat.BINARY);
    }

    override protected function parseData(data:*):* {
        return ByteArray(data);
    }

    public function get byteArray():ByteArray {
        return ByteArray(parsedData);
    }
}
}
