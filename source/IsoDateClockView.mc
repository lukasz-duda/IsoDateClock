using Toybox.WatchUi as Ui;
using Toybox.Graphics as Gfx;
using Toybox.System as Sys;
using Toybox.Lang as Lang;
using Toybox.Time as Time;

class IsoDateClockView extends Ui.WatchFace {

    var presenter;

    function initialize() {
        presenter = new Presenter();
        WatchFace.initialize();
    }

    function onLayout(dc) {
        setLayout(Rez.Layouts.WatchFace(dc));
    }

    function onUpdate(dc) {
        var clockTime = Sys.getClockTime();
        
        var timeString = presenter.formatTime(clockTime);
        showTime(timeString);
        
        var today = Time.today();
        var dateString = presenter.formatDate(today);
        showDate(dateString);
        
        var systemStats = Sys.getSystemStats();
        var remainingBatteryString = presenter.formatRemainingBattery(systemStats.battery); 
        showRemainingBattery(remainingBatteryString);
        
        View.onUpdate(dc);
    }
    
    function showTime(timeString) {
        var timeLabel = View.findDrawableById("TimeLabel");
        timeLabel.setText(timeString);
    }
    
    function showDate(dateString) {
        var dateLabel = View.findDrawableById("DateLabel");
        dateLabel.setText(dateString);
    }
    
    function showRemainingBattery(remainingBatteryString) {
        var batteryLabel = View.findDrawableById("RemainingBatteryLabel");
        batteryLabel.setText(remainingBatteryString);
    }
    
}