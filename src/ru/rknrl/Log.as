//       ___       ___       ___       ___       ___
//      /\  \     /\__\     /\__\     /\  \     /\__\
//     /::\  \   /:/ _/_   /:| _|_   /::\  \   /:/  /
//    /::\:\__\ /::-"\__\ /::|/\__\ /::\:\__\ /:/__/
//    \;:::/  / \;:;-",-" \/|::/  / \;:::/  / \:\  \
//     |:\/__/   |:|  |     |:/  /   |:\/__/   \:\__\
//      \|__|     \|__|     \/__/     \|__|     \/__/

package ru.rknrl {
import flash.events.Event;
import flash.events.IOErrorEvent;
import flash.events.SecurityErrorEvent;
import flash.net.URLLoader;
import flash.net.URLRequest;
import flash.net.URLRequestMethod;
import flash.system.Capabilities;
import flash.system.System;
import flash.utils.getTimer;

public class Log {
    public static const log:Log = new Log();
    public static var isDebug:Boolean = false;
    public static var url:String = null;

    public static function info(text:String):void {
        log.info(text);
    }

    public static function warn(text:String):void {
        log.warn(text);
    }

    public static function error(name:String, stackTrace:String):void {
        log.error(name, stackTrace);
    }

    public static function debug(text:String):void {
        log.debug(text);
    }

    //

    private static const limit:int = 200;
    private const list:Vector.<String> = new <String>[];

    private var startTime:int;
    private var startDate:Date;

    public function Log() {
        startTime = getTimer();
        startDate = new Date();
        trace(header())
    }

    private function header():String {
        return "startDate=" + startDate.toString() + "\n" +
                "sendDate=" + new Date().toString() + "\n" +
                "os=" + Capabilities.os + "\n" +
                "playerType=" + Capabilities.playerType + "\n" +
                "ver=" + Capabilities.version + "\n" +
                "debug=" + Capabilities.isDebugger + "\n" +
                "freemem=" + System.freeMemory + "\n" +
                "totalmem=" + System.totalMemory + "\n";
    }

    private function time():String {
        const time:int = getTimer() - startTime;
        const min:int = time / 60000;
        const sec:int = (time % 60000) / 1000;
        return "[" + min + ":" + sec + "]";
    }

    private function add(text:String):void {
        if (list.length > limit) list.shift();

        text = time() + " " + text;
        list.push(text);
        trace(text);
        trace("."); // just for divide
    }

    public function info(text:String):void {
        add(text);
    }

    public function debug(text:String):void {
        if (isDebug) add(text);
    }

    public function warn(text:String):void {
        add('[WARNING] ' + text);
    }

    private var errorSended:Boolean;

    public function error(name:String, stackTrace:String):void {
        add('[ERROR] "' + name + '"');
        add('stackTrace "' + stackTrace + '"');

        if (!errorSended) {
            if (url != null) {
                send(url);
                errorSended = true;
            } else {
                warn("want send log, but hasn't url");
            }
        }
    }

    public function clear():void {
        list.length = 0;
    }

    public function send(url:String):void {
        add("send log to " + url);
        const urlLoader:URLLoader = new URLLoader();
        urlLoader.addEventListener(Event.COMPLETE, onSendComplete);
        urlLoader.addEventListener(IOErrorEvent.IO_ERROR, onSendError);
        urlLoader.addEventListener(SecurityErrorEvent.SECURITY_ERROR, onSendError);

        const urlRequest:URLRequest = new URLRequest(url);
        urlRequest.method = URLRequestMethod.POST;
        urlRequest.data = header() + list.join("\n");

        urlLoader.load(urlRequest)
    }

    private function onSendComplete(event:Event):void {
        add("log sent");
        removeListeners(event);
    }

    private function onSendError(event:Event):void {
        add('log isn\'t sent "' + event.toString() + '"');
        removeListeners(event);
    }

    private function removeListeners(event:Event):void {
        const urlLoader:URLLoader = URLLoader(event.target);
        urlLoader.removeEventListener(Event.COMPLETE, onSendComplete);
        urlLoader.removeEventListener(IOErrorEvent.IO_ERROR, onSendError);
        urlLoader.removeEventListener(SecurityErrorEvent.SECURITY_ERROR, onSendError);
    }
}
}
