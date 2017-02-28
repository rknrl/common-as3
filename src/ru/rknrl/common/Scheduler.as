//       ___       ___       ___       ___       ___
//      /\  \     /\__\     /\__\     /\  \     /\__\
//     /::\  \   /:/ _/_   /:| _|_   /::\  \   /:/  /
//    /::\:\__\ /::-"\__\ /::|/\__\ /::\:\__\ /:/__/
//    \;:::/  / \;:;-",-" \/|::/  / \;:::/  / \:\  \
//     |:\/__/   |:|  |     |:/  /   |:\/__/   \:\__\
//      \|__|     \|__|     \/__/     \|__|     \/__/

package ru.rknrl.common {
import flash.events.Event;
import flash.events.IEventDispatcher;
import flash.utils.Dictionary;
import flash.utils.getTimer;

public class Scheduler {
    private var enterFrameDispatcher:IEventDispatcher;

    public function Scheduler(enterFrameDispatcher:IEventDispatcher) {
        this.enterFrameDispatcher = enterFrameDispatcher;
        enterFrameDispatcher.addEventListener(Event.ENTER_FRAME, onEnterFrame);
    }

    public function destroy():void {
        enterFrameDispatcher.removeEventListener(Event.ENTER_FRAME, onEnterFrame);
        enterFrameDispatcher = null;
        timeouts = new Dictionary();
    }

    public function setTimeout(f:Function, delay:int):uint {
        return add(f, delay, false);
    }

    public function clearTimeout(id:uint):void {
        clear(id);
    }

    public function setInterval(f:Function, delay:int):uint {
        return add(f, delay, true);
    }

    public function clearInterval(id:uint):void {
        clear(id);
    }

    private var idIterator:uint = 1;
    private var timeouts:Dictionary = new Dictionary();

    private function add(f:Function, delay:int, isInterval:Boolean):uint {
        const id:uint = idIterator++;
        const timeout:Timeout = new Timeout(id, f, delay, getTimer() + delay, isInterval);
        timeouts[id] = timeout;
        return id;
    }

    private function clear(id:uint):void {
        delete timeouts[id];
    }

    private function onEnterFrame(event:Event):void {
        const currentTime:int = getTimer();

        const toDelete:Vector.<uint> = new <uint>[];

        for (var id:* in timeouts) {
            const timeout:Timeout = timeouts[id];
            if (currentTime >= timeout.endTime) {
                timeout.f();

                if (timeout.isInterval) {
                    timeout.endTime = currentTime + timeout.delay;
                } else {
                    toDelete.push(id);
                }
            }
        }

        for each (id in toDelete) {
            delete timeouts[id];
        }
    }
}
}

class Timeout {
    private var _id:int;
    private var _f:Function;
    private var _delay:int;
    private var _endTime:int;
    private var _isInterval:Boolean;

    public function Timeout(id:int, f:Function, delay:int, endTime:int, isInterval:Boolean) {
        _id = id;
        _f = f;
        _delay = delay;
        _endTime = endTime;
        _isInterval = isInterval;
    }

    public function get id():int {
        return _id;
    }

    public function get f():Function {
        return _f;
    }

    public function get delay():int {
        return _delay;
    }

    public function set endTime(value:int):void {
        _endTime = value;
    }

    public function get endTime():int {
        return _endTime;
    }

    public function get isInterval():Boolean {
        return _isInterval;
    }
}
