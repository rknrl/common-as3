//       ___       ___       ___       ___       ___
//      /\  \     /\__\     /\__\     /\  \     /\__\
//     /::\  \   /:/ _/_   /:| _|_   /::\  \   /:/  /
//    /::\:\__\ /::-"\__\ /::|/\__\ /::\:\__\ /:/__/
//    \;:::/  / \;:;-",-" \/|::/  / \;:::/  / \:\  \
//     |:\/__/   |:|  |     |:/  /   |:\/__/   \:\__\
//      \|__|     \|__|     \/__/     \|__|     \/__/

package ru.rknrl.loaders {
import flash.events.Event;
import flash.events.EventDispatcher;
import flash.events.IOErrorEvent;
import flash.events.SecurityErrorEvent;
import flash.utils.Dictionary;

import ru.rknrl.common.Maps;
import ru.rknrl.loaders.base.ILoader;

[Event(name="complete", type="flash.events.Event")]
[Event(name="ioError", type="flash.events.IOErrorEvent")]
[Event(name="securityError", type="flash.events.SecurityErrorEvent")]
public class SequenceLoader extends EventDispatcher implements ILoader {
    private var loaders:Vector.<ILoader>;
    private var loading:Boolean;
    private var loaded:int;
    private var _data:Dictionary = new Dictionary();

    public function SequenceLoader(loaders:Vector.<ILoader>) {
        this.loaders = loaders;
    }

    public function load():void {
        if (loading) throw new Error("already in loading");
        loading = true;
        loaded = 0;

        next();
    }

    private function loadNext():void {
        const loader:ILoader = loaders[loaded];
        loader.addEventListener(Event.COMPLETE, onComplete);
        loader.addEventListener(SecurityErrorEvent.SECURITY_ERROR, onError);
        loader.addEventListener(IOErrorEvent.IO_ERROR, onError);
        loader.load();
    }

    private function onComplete(event:Event):void {
        const loader:ILoader = ILoader(event.target);
        loader.removeEventListener(Event.COMPLETE, onComplete);
        loader.removeEventListener(SecurityErrorEvent.SECURITY_ERROR, onError);
        loader.removeEventListener(IOErrorEvent.IO_ERROR, onError);

        _data = Maps.mergeDictionary(_data, loader.data);
        loaded++;
        next();
    }

    private function next():void {
        if (isLoaded) {
            dispatchEvent(new Event(Event.COMPLETE));
        } else {
            loadNext();
        }
    }

    private function get isLoaded():Boolean {
        return loaded == loaders.length;
    }

    public function get data():Dictionary {
        if (!isLoaded) throw new Error("get data before complete");
        return _data;
    }

    private function onError(event:Event):void {
        dispatchEvent(event.clone());
    }
}
}
