using Toybox.System as Sys;
using Toybox.Time as Time;
using Toybox.Time.Gregorian as Gregorian;

class GatewaySpy {

    var year = 1970;
    var month = 1;
    var day = 1;
    var hour = 0;
    var minute = 0;
    var remainingBattery = 0;

    function setTime(hour, minute) {
        me.hour = hour;
        me.minute = minute;
    }

    function getClockTime() {
        var clockTime = new Sys.ClockTime();
        clockTime.hour = me.hour;
        clockTime.min = me.minute;
        return clockTime;
    }
    
    function setDate(year, month, day) {
        me.year = year;
        me.month = month;
        me.day = day;
    }
    
    function today() {
        var options = {
            :year   => me.year,
            :month  => me.month,
            :day    => me.day
        };
        
        return Gregorian.moment(options);
    }
    
    function setRemainingBattery(remainingBattery) {
        me.remainingBattery = remainingBattery;
    }
    
    function getSystemStats() {
        var systemStats = new Sys.Stats();
        systemStats.battery = me.remainingBattery;
        return systemStats;
    }
}