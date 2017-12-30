using Toybox.System as Sys;
using Toybox.Lang as Lang;
using Toybox.Time as Time;
using Toybox.Time.Gregorian as Gregorian;

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

    function formatDate(date) {
        var dateInfo = Gregorian.info(date, Time.FORMAT_SHORT);
        var year = dateInfo.year;
        var month = dateInfo.month.format("%02d");
        var day = dateInfo.day.format("%02d");
        return Lang.format("$1$-$2$-$3$", [year, month, day]);
    }
    
    function newDate(year, month, day) {
	    var options = {
		    :year   => year,
		    :month  => month,
		    :day    => day
		};
		
        return Gregorian.moment(options);
    }
    
    function formatRemainingBattery(remainingBattery) { 
        return remainingBattery.format("%.0f") + " %";
    }
    
}