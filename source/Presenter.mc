using Toybox.System as Sys;
using Toybox.Lang as Lang;
using Toybox.Time as Time;
using Toybox.Time.Gregorian as Gregorian;

class Presenter {

    var gateway;
    var view;
    
    function initialize(gateway, view) {
        me.gateway = gateway;
        me.view = view;
    }

    function updateView() {
        updateTime();
        updateDate();
        updateRemainingBattery();
    }
    
    function updateTime() {
        var clockTime = gateway.getClockTime();
        var timeString = formatTime(clockTime);
        view.showTime(timeString);
    }

    function formatTime(time) {
        var hour = time.hour;
        var minute = time.min;
        return Lang.format("$1$:$2$", [hour, minute.format("%02d")]);
    }

    function updateDate() {
        var today = gateway.today();
        var dateString = formatDate(today);
        view.showDate(dateString);
    }

    function formatDate(date) {
        var dateInfo = Gregorian.info(date, Time.FORMAT_SHORT);
        var year = dateInfo.year;
        var month = dateInfo.month.format("%02d");
        var day = dateInfo.day.format("%02d");
        return Lang.format("$1$-$2$-$3$", [year, month, day]);
    }
    
    function updateRemainingBattery() {
        var systemStats = gateway.getSystemStats();
        var remainingBatteryString = formatRemainingBattery(systemStats.battery); 
        view.showRemainingBattery(remainingBatteryString);
    }
    
    function formatRemainingBattery(remainingBattery) { 
        return remainingBattery.format("%.0f") + " %";
    }
    
}