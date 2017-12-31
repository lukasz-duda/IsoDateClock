using Toybox.System as Sys;
using Toybox.Lang as Lang;
using Toybox.Time as Time;
using Toybox.Time.Gregorian as Gregorian;
using Toybox.WatchUi as Ui;

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
        var dateInfo = Gregorian.info(today, Time.FORMAT_SHORT);
        var dateString = formatDate(dateInfo);
        view.showDate(dateString);
        var dayOfWeekString = formatDayOfWeek(dateInfo);
        view.showDayOfWeek(dayOfWeekString);
    }

    function formatDate(dateInfo) {
        var year = dateInfo.year;
        var month = dateInfo.month.format("%02d");
        var day = dateInfo.day.format("%02d");
        return Lang.format("$1$-$2$-$3$", [year, month, day]);
    }
    
    function formatDayOfWeek(dateInfo) {
        var dayOfWeekResourceIds = [Rez.Strings.Sunday, Rez.Strings.Monday,
            Rez.Strings.Tuesday, Rez.Strings.Wednesday, Rez.Strings.Thursday,
            Rez.Strings.Friday, Rez.Strings.Saturday];

        var dayOfWeekResourceIndex = dateInfo.day_of_week - 1;
        var dayOfWeekResourceId = dayOfWeekResourceIds[dayOfWeekResourceIndex];
        
        return Ui.loadResource(dayOfWeekResourceId);
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