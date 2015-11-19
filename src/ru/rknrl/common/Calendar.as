//       ___       ___       ___       ___       ___
//      /\  \     /\__\     /\__\     /\  \     /\__\
//     /::\  \   /:/ _/_   /:| _|_   /::\  \   /:/  /
//    /::\:\__\ /::-"\__\ /::|/\__\ /::\:\__\ /:/__/
//    \;:::/  / \;:;-",-" \/|::/  / \;:::/  / \:\  \
//     |:\/__/   |:|  |     |:/  /   |:\/__/   \:\__\
//      \|__|     \|__|     \/__/     \|__|     \/__/

package ru.rknrl.common {
public class Calendar {
    public static const SECOND:int = 1000;
    public static const SECONDS:int = SECOND;

    public static const MINUTE:int = 60 * 1000;
    public static const MINUTES:int = MINUTE;

    public static const HOUR:int = 60 * 60 * 1000;
    public static const HOURS:int = HOUR;

    public static const DAY:int = 24 * 60 * 60 * 1000;
    public static const DAYS:int = DAY;

    /**
     * millis => "hh:mm:ss" format
     */
    public static function formatTime(millis:int):String {
        if (millis < 0) millis = 0;
        const seconds:int = millisToSeconds(millis);
        const minutes:int = millisToMinutes(millis);
        const hours:int = millisToHours(millis);

        var time:String = "";
        if (hours > 0) time += doubleNumber(hours) + ":";
        time += doubleNumber(minutes);
        time += ":";
        time += doubleNumber(seconds);
        return time;
    }

    public static function millisToSeconds(millis:int):int {
        return (millis / 1000) % 60;
    }

    public static function millisToMinutes(millis:int):int {
        return (millis / (1000 * 60)) % 60;
    }

    public static function millisToHours(millis:int):int {
        return (millis / (1000 * 60 * 60)) % 24;
    }

    /**
     * 1 => "01"
     * 10 => "10"
     */
    public static function doubleNumber(i:int):String {
        return i > 9 ? i.toString() : "0" + i;
    }
}
}
