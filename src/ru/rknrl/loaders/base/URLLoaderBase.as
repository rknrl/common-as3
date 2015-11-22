//       ___       ___       ___       ___       ___
//      /\  \     /\__\     /\__\     /\  \     /\__\
//     /::\  \   /:/ _/_   /:| _|_   /::\  \   /:/  /
//    /::\:\__\ /::-"\__\ /::|/\__\ /::\:\__\ /:/__/
//    \;:::/  / \;:;-",-" \/|::/  / \;:::/  / \:\  \
//     |:\/__/   |:|  |     |:/  /   |:\/__/   \:\__\
//      \|__|     \|__|     \/__/     \|__|     \/__/

package ru.rknrl.loaders.base {
import flash.events.Event;
import flash.events.EventDispatcher;
import flash.events.IOErrorEvent;
import flash.events.SecurityErrorEvent;
import flash.net.URLLoader;
import flash.net.URLRequest;
import flash.utils.Dictionary;

import ru.rknrl.common.OverrideMe;

[Event(name="complete", type="flash.events.Event")]
[Event(name="ioError", type="flash.events.IOErrorEvent")]
[Event(name="securityError", type="flash.events.SecurityErrorEvent")]
public class URLLoaderBase extends EventDispatcher implements ILoader {
    private var _url:String;

    public function get url():String {
        return _url;
    }

    private var urlLoader:URLLoader;
    private var dataFormat:String;

    public function URLLoaderBase(url:String, dataFormat:String) {
        _url = url;
        this.dataFormat = dataFormat;
    }

    public function load():void {
        if (urlLoader) throw new Error("already in loading");

        urlLoader = new URLLoader();
        urlLoader.dataFormat = dataFormat;
        urlLoader.addEventListener(Event.COMPLETE, onComplete);
        urlLoader.addEventListener(IOErrorEvent.IO_ERROR, dispatchEvent);
        urlLoader.addEventListener(SecurityErrorEvent.SECURITY_ERROR, dispatchEvent);
        urlLoader.load(new URLRequest(_url));
    }

    private var _data:Dictionary;

    public function get data():Dictionary {
        if (!_data) throw new Error("get data before complete");
        return _data;
    }

    protected function get parsedData():* {
        return data[url];
    }

    private function onComplete(event:Event):void {
        _data = new Dictionary();
        _data[_url] = parseData(urlLoader.data);
        dispatchEvent(new Event(Event.COMPLETE));
    }

    protected function parseData(data:*):* {
        throw OverrideMe();
    }
}
}
