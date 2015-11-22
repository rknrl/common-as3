//       ___       ___       ___       ___       ___
//      /\  \     /\__\     /\__\     /\  \     /\__\
//     /::\  \   /:/ _/_   /:| _|_   /::\  \   /:/  /
//    /::\:\__\ /::-"\__\ /::|/\__\ /::\:\__\ /:/__/
//    \;:::/  / \;:;-",-" \/|::/  / \;:::/  / \:\  \
//     |:\/__/   |:|  |     |:/  /   |:\/__/   \:\__\
//      \|__|     \|__|     \/__/     \|__|     \/__/

package ru.rknrl.loaders.typed {
import flash.net.URLLoaderDataFormat;

import ru.rknrl.loaders.base.URLLoaderBase;

[Event(name="complete", type="flash.events.Event")]
[Event(name="ioError", type="flash.events.IOErrorEvent")]
[Event(name="securityError", type="flash.events.SecurityErrorEvent")]
public class StringLoader extends URLLoaderBase {
    public function StringLoader(url:String) {
        super(url, URLLoaderDataFormat.TEXT);
    }

    override protected function parseData(data:*):* {
        return String(data);
    }

    public function get string():String {
        return String(parsedData);
    }
}
}
