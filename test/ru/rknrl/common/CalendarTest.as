//       ___       ___       ___       ___       ___
//      /\  \     /\__\     /\__\     /\  \     /\__\
//     /::\  \   /:/ _/_   /:| _|_   /::\  \   /:/  /
//    /::\:\__\ /::-"\__\ /::|/\__\ /::\:\__\ /:/__/
//    \;:::/  / \;:;-",-" \/|::/  / \;:::/  / \:\  \
//     |:\/__/   |:|  |     |:/  /   |:\/__/   \:\__\
//      \|__|     \|__|     \/__/     \|__|     \/__/

package ru.rknrl.common {
import org.flexunit.asserts.assertEquals;

public class CalendarTest {
    [Test]
    public function formatTimeTest1():void {
        const millis:int = 0;
        assertEquals("00:00", Calendar.formatTime(millis));
    }

    [Test]
    public function formatTimeTest2():void {
        const millis:int = 14 * Calendar.MINUTES + 1 * Calendar.SECONDS;
        assertEquals("14:01", Calendar.formatTime(millis));
    }

    [Test]
    public function formatTimeTest3():void {
        const millis:int = 23 * Calendar.HOURS + 56 * Calendar.MINUTES + 30 * Calendar.SECONDS + 104;
        assertEquals("23:56:30", Calendar.formatTime(millis));
    }
}
}
