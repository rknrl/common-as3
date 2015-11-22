//       ___       ___       ___       ___       ___
//      /\  \     /\__\     /\__\     /\  \     /\__\
//     /::\  \   /:/ _/_   /:| _|_   /::\  \   /:/  /
//    /::\:\__\ /::-"\__\ /::|/\__\ /::\:\__\ /:/__/
//    \;:::/  / \;:;-",-" \/|::/  / \;:::/  / \:\  \
//     |:\/__/   |:|  |     |:/  /   |:\/__/   \:\__\
//      \|__|     \|__|     \/__/     \|__|     \/__/

package ru.rknrl.loaders.base {
import flash.events.IEventDispatcher;
import flash.utils.Dictionary;

[Event(name="securityError", type="flash.events.SecurityErrorEvent")]
[Event(name="ioError", type="flash.events.IOErrorEvent")]
[Event(name="complete", type="flash.events.Event")]
public interface ILoader extends IEventDispatcher {
    function load():void;

    function get data():Dictionary;
}
}
