//       ___       ___       ___       ___       ___
//      /\  \     /\__\     /\__\     /\  \     /\__\
//     /::\  \   /:/ _/_   /:| _|_   /::\  \   /:/  /
//    /::\:\__\ /::-"\__\ /::|/\__\ /::\:\__\ /:/__/
//    \;:::/  / \;:;-",-" \/|::/  / \;:::/  / \:\  \
//     |:\/__/   |:|  |     |:/  /   |:\/__/   \:\__\
//      \|__|     \|__|     \/__/     \|__|     \/__/

package ru.rknrl.loaders {
import flash.events.Event;
import flash.events.IOErrorEvent;
import flash.events.SecurityErrorEvent;

import org.flexunit.asserts.assertEquals;
import org.flexunit.async.Async;

import ru.rknrl.common.Maps;
import ru.rknrl.loaders.base.ILoader;

public class SequenceLoaderTest {

    [Test(async)]
    public function success():void {
        testLoadersComplete(0)
    }

    [Test(async)]
    public function success2():void {
        testLoadersComplete(100)
    }

    [Test(async)]
    public function securityError():void {
        testLoadersError(0, new SecurityErrorEvent(SecurityErrorEvent.SECURITY_ERROR))
    }

    [Test(async)]
    public function securityError2():void {
        testLoadersError(100, new SecurityErrorEvent(SecurityErrorEvent.SECURITY_ERROR))
    }

    [Test(async)]
    public function ioError():void {
        testLoadersError(0, new IOErrorEvent(IOErrorEvent.IO_ERROR))
    }

    [Test(async)]
    public function ioError2():void {
        testLoadersError(100, new IOErrorEvent(IOErrorEvent.IO_ERROR))
    }

    private function testLoadersComplete(delay:int):void {
        const loader:SequenceLoader = new SequenceLoader(new <ILoader>[
            new TestLoader("url1", "data1", new Event(Event.COMPLETE), delay),
            new TestLoader("url2", "data2", new Event(Event.COMPLETE), delay),
            new TestLoader("url3", "data3", new Event(Event.COMPLETE), delay)
        ]);
        const timeout:int = 3 * delay + 500;
        loader.addEventListener(Event.COMPLETE, Async.asyncHandler(this, onComplete, timeout));
        loader.load();

        function onComplete(event:Event, passThroughData:Object):void {
            assertEquals(3, Maps.size(loader.data));
            assertEquals("data1", loader.data["url1"]);
            assertEquals("data2", loader.data["url2"]);
            assertEquals("data3", loader.data["url3"]);
        }
    }

    private function testLoadersError(delay:int, errorEvent:Event):void {
        const loader:SequenceLoader = new SequenceLoader(new <ILoader>[
            new TestLoader("url1", "data1", new Event(Event.COMPLETE), delay),
            new TestLoader("url2", "data2", errorEvent, delay),
            new TestLoader("url3", "data3", new Event(Event.COMPLETE), delay)
        ]);
        const timeout:int = 3 * delay + 500;
        loader.addEventListener(errorEvent.type, Async.asyncHandler(this, onError, timeout));
        loader.load();

        function onError(event:Event, passThroughData:Object):void {
        }
    }
}
}