//       ___       ___       ___       ___       ___
//      /\  \     /\__\     /\__\     /\  \     /\__\
//     /::\  \   /:/ _/_   /:| _|_   /::\  \   /:/  /
//    /::\:\__\ /::-"\__\ /::|/\__\ /::\:\__\ /:/__/
//    \;:::/  / \;:;-",-" \/|::/  / \;:::/  / \:\  \
//     |:\/__/   |:|  |     |:/  /   |:\/__/   \:\__\
//      \|__|     \|__|     \/__/     \|__|     \/__/

package ru.rknrl.loaders.base {
import flash.display.DisplayObject;
import flash.display.Loader;
import flash.events.Event;
import flash.events.EventDispatcher;
import flash.events.IOErrorEvent;
import flash.events.SecurityErrorEvent;
import flash.net.URLRequest;
import flash.system.LoaderContext;
import flash.utils.Dictionary;

import ru.rknrl.common.OverrideMe;

[Event(name="securityError", type="flash.events.SecurityErrorEvent")]
[Event(name="ioError", type="flash.events.IOErrorEvent")]
[Event(name="complete", type="flash.events.Event")]
public class LoaderBase extends EventDispatcher implements ILoader {
    private var _url:String;

    public function get url():String {
        return _url;
    }

    private var loader:Loader;

    public function LoaderBase(url:String) {
        _url = url;
    }

    public function load():void {
        if (loader) throw new Error("already in loading");

        loader = new Loader();
        loader.contentLoaderInfo.addEventListener(Event.COMPLETE, onComplete);
        loader.contentLoaderInfo.addEventListener(IOErrorEvent.IO_ERROR, dispatchEvent);
        loader.contentLoaderInfo.addEventListener(SecurityErrorEvent.SECURITY_ERROR, dispatchEvent);
        loader.load(new URLRequest(_url), new LoaderContext(true));
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
        _data[_url] = parseData(loader.content);
        dispatchEvent(new Event(Event.COMPLETE));
    }

    protected function parseData(data:DisplayObject):* {
        throw OverrideMe();
    }
}
}
