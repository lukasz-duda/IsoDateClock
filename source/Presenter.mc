using Toybox.System as Sys;
using Toybox.Lang as Lang;

class Presenter {

    function formatTime(time) {
        var hour = time.hour;
        var minute = time.min;
        return Lang.format("$1$:$2$", [hour, minute.format("%02d")]);
    }
    
    function newTime(hour, minute) {
        var clockTime = new Sys.ClockTime();
        clockTime.hour = hour;
        clockTime.min = minute;
        return clockTime;
    }
    
}