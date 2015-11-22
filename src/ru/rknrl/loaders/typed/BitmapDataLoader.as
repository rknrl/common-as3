//       ___       ___       ___       ___       ___
//      /\  \     /\__\     /\__\     /\  \     /\__\
//     /::\  \   /:/ _/_   /:| _|_   /::\  \   /:/  /
//    /::\:\__\ /::-"\__\ /::|/\__\ /::\:\__\ /:/__/
//    \;:::/  / \;:;-",-" \/|::/  / \;:::/  / \:\  \
//     |:\/__/   |:|  |     |:/  /   |:\/__/   \:\__\
//      \|__|     \|__|     \/__/     \|__|     \/__/

package ru.rknrl.loaders.typed {
import flash.display.Bitmap;
import flash.display.BitmapData;
import flash.display.DisplayObject;
import flash.events.SecurityErrorEvent;

import ru.rknrl.loaders.base.LoaderBase;
import ru.rknrl.log.Log;

[Event(name="securityError", type="flash.events.SecurityErrorEvent")]
[Event(name="ioError", type="flash.events.IOErrorEvent")]
[Event(name="complete", type="flash.events.Event")]
public class BitmapDataLoader extends LoaderBase {
    public function BitmapDataLoader(url:String) {
        super(url);
    }

    override protected function parseData(data:DisplayObject):* {
        var bitmapData:BitmapData = null;
        try {
            bitmapData = Bitmap(data).bitmapData;
        } catch (e:Error) {
            Log.warn("BitmapLoader:" + e.toString());
            dispatchEvent(new SecurityErrorEvent(SecurityErrorEvent.SECURITY_ERROR, false, false, e.toString()));
        }
        return bitmapData;
    }

    public function get bitmapData():BitmapData {
        return BitmapData(parsedData);
    }
}
}
