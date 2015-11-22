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
import flash.utils.Dictionary;
import flash.utils.setTimeout;

import ru.rknrl.loaders.base.ILoader;

class TestLoader extends EventDispatcher implements ILoader {
    private var _url:String;
    private var _loadedData:String;
    private var _event:Event;
    private var _delay:int;

    public function get url():String {
        return _url;
    }

    public function get loadedData():String {
        return _loadedData;
    }

    public function get event():Event {
        return _event;
    }

    public function get delay():int {
        return _delay;
    }

    public function TestLoader(url:String, loadedData:String, event:Event, delay:int) {
        _url = url;
        _loadedData = loadedData;
        _event = event;
        _delay = delay;
    }

    public function load():void {
        if (_delay == 0) {
            dispatchEvent(_event);
        } else {
            setTimeout(function ():void {
                dispatchEvent(_event)
            }, _delay);
        }
    }

    public function get data():Dictionary {
        const result:Dictionary = new Dictionary();
        result[_url] = _loadedData;
        return result;
    }
}
}
