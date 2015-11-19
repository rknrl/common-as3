//       ___       ___       ___       ___       ___
//      /\  \     /\__\     /\__\     /\  \     /\__\
//     /::\  \   /:/ _/_   /:| _|_   /::\  \   /:/  /
//    /::\:\__\ /::-"\__\ /::|/\__\ /::\:\__\ /:/__/
//    \;:::/  / \;:;-",-" \/|::/  / \;:::/  / \:\  \
//     |:\/__/   |:|  |     |:/  /   |:\/__/   \:\__\
//      \|__|     \|__|     \/__/     \|__|     \/__/

package ru.rknrl.common {
import flash.events.IEventDispatcher;

/**
 * Обертка позволяющая снять все листенеры вызовом одного метода removeAllListeners()
 */
public class Listener {
    private const handlers:Vector.<Handler> = new <Handler>[];

    public function addEventListener(dispatcher:IEventDispatcher, type:String, listener:Function):void {
        handlers.push(new Handler(dispatcher, type, listener));
        dispatcher.addEventListener(type, listener)
    }

    public function removeEventListener(dispatcher:IEventDispatcher, type:String, listener:Function):void {
        const handlerIndex:int = findHandlerIndex(dispatcher, type, listener);
        if (handlerIndex > -1) handlers.splice(handlerIndex, 1);
        dispatcher.removeEventListener(type, listener)
    }

    public function removeAllListeners():void {
        for each(var handler:Handler in handlers) {
            handler.dispatcher.removeEventListener(handler.type, handler.listener);
        }
        handlers.length = 0;
    }

    private function findHandlerIndex(dispatcher:IEventDispatcher, type:String, listener:Function):int {
        for (var i:int = 0; i < handlers.length; i++) {
            const handler:Handler = handlers[i];
            if (handler.dispatcher == dispatcher && handler.type == type && handler.listener == listener) {
                return i;
            }
        }
        return -1;
    }
}
}

import flash.events.IEventDispatcher;

class Handler {
    private var _dispatcher:IEventDispatcher;
    private var _type:String;
    private var _listener:Function;

    public function get dispatcher():IEventDispatcher {
        return _dispatcher;
    }

    public function get type():String {
        return _type;
    }

    public function get listener():Function {
        return _listener;
    }

    public function Handler(dispatcher:IEventDispatcher, type:String, listener:Function) {
        _dispatcher = dispatcher;
        _type = type;
        _listener = listener;
    }
}