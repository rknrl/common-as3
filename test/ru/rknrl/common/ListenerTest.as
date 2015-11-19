//       ___       ___       ___       ___       ___
//      /\  \     /\__\     /\__\     /\  \     /\__\
//     /::\  \   /:/ _/_   /:| _|_   /::\  \   /:/  /
//    /::\:\__\ /::-"\__\ /::|/\__\ /::\:\__\ /:/__/
//    \;:::/  / \;:;-",-" \/|::/  / \;:::/  / \:\  \
//     |:\/__/   |:|  |     |:/  /   |:\/__/   \:\__\
//      \|__|     \|__|     \/__/     \|__|     \/__/

package ru.rknrl.common {
import flash.events.Event;
import flash.events.EventDispatcher;

import org.flexunit.asserts.assertFalse;
import org.flexunit.asserts.assertTrue;

public class ListenerTest {
    private static const TYPE_1:String = "type1";
    private static const TYPE_2:String = "type2";
    private static const TYPE_3:String = "type3";

    private function listener1(event:Event):void {

    }

    private function listener2(event:Event):void {

    }

    [Test(description="addEventListener работает корректно")]
    public function t0():void {
        const dispatcher1:EventDispatcher = new EventDispatcher();
        const dispatcher2:EventDispatcher = new EventDispatcher();

        const listener:Listener = new Listener();
        listener.addEventListener(dispatcher1, TYPE_1, listener1);
        listener.addEventListener(dispatcher1, TYPE_2, listener2);

        listener.addEventListener(dispatcher2, TYPE_3, listener2);

        assertTrue(dispatcher1.hasEventListener(TYPE_1));
        assertTrue(dispatcher1.hasEventListener(TYPE_2));
        assertFalse(dispatcher1.hasEventListener(TYPE_3));

        assertFalse(dispatcher2.hasEventListener(TYPE_1));
        assertFalse(dispatcher2.hasEventListener(TYPE_2));
        assertTrue(dispatcher2.hasEventListener(TYPE_3));
    }

    [Test(description="removeEventListener работает корректно")]
    public function t1():void {
        const dispatcher1:EventDispatcher = new EventDispatcher();
        const dispatcher2:EventDispatcher = new EventDispatcher();

        const listener:Listener = new Listener();
        listener.addEventListener(dispatcher1, TYPE_1, listener1);
        listener.addEventListener(dispatcher1, TYPE_2, listener2);

        listener.addEventListener(dispatcher2, TYPE_3, listener2);

        // Remove illegal listener (Ничего не должно произойти)

        listener.removeEventListener(dispatcher1, TYPE_1, listener2);

        assertTrue(dispatcher1.hasEventListener(TYPE_1));
        assertTrue(dispatcher1.hasEventListener(TYPE_2));
        assertFalse(dispatcher1.hasEventListener(TYPE_3));

        assertFalse(dispatcher2.hasEventListener(TYPE_1));
        assertFalse(dispatcher2.hasEventListener(TYPE_2));
        assertTrue(dispatcher2.hasEventListener(TYPE_3));

        // Remove listener

        listener.removeEventListener(dispatcher1, TYPE_2, listener2);

        assertTrue(dispatcher1.hasEventListener(TYPE_1));
        assertFalse(dispatcher1.hasEventListener(TYPE_2));
        assertFalse(dispatcher1.hasEventListener(TYPE_3));

        assertFalse(dispatcher2.hasEventListener(TYPE_1));
        assertFalse(dispatcher2.hasEventListener(TYPE_2));
        assertTrue(dispatcher2.hasEventListener(TYPE_3));

        // Remove another listener

        listener.removeEventListener(dispatcher2, TYPE_3, listener2);

        assertTrue(dispatcher1.hasEventListener(TYPE_1));
        assertFalse(dispatcher1.hasEventListener(TYPE_2));
        assertFalse(dispatcher1.hasEventListener(TYPE_3));

        assertFalse(dispatcher2.hasEventListener(TYPE_1));
        assertFalse(dispatcher2.hasEventListener(TYPE_2));
        assertFalse(dispatcher2.hasEventListener(TYPE_3));
    }

    [Test(description="removeAllListeners работает корректно")]
    public function t2():void {
        const dispatcher1:EventDispatcher = new EventDispatcher();
        const dispatcher2:EventDispatcher = new EventDispatcher();

        const listener:Listener = new Listener();
        listener.addEventListener(dispatcher1, TYPE_1, listener1);
        listener.addEventListener(dispatcher1, TYPE_2, listener2);

        listener.addEventListener(dispatcher2, TYPE_3, listener2);

        listener.removeAllListeners();

        assertFalse(dispatcher1.hasEventListener(TYPE_1));
        assertFalse(dispatcher1.hasEventListener(TYPE_2));
        assertFalse(dispatcher1.hasEventListener(TYPE_3));

        assertFalse(dispatcher2.hasEventListener(TYPE_1));
        assertFalse(dispatcher2.hasEventListener(TYPE_2));
        assertFalse(dispatcher2.hasEventListener(TYPE_3));
    }
}
}
