using Toybox.WatchUi as Ui;

class IsoDateClockView extends Ui.WatchFace {

    var presenter;

    function initialize() {
        var gateway = new SystemGateway();
        presenter = new Presenter(gateway, me);
        WatchFace.initialize();
    }

    function onLayout(dc) {
        setLayout(Rez.Layouts.WatchFace(dc));
    }

    function onUpdate(dc) {
        presenter.updateView();
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
        batteryLabel.setText(remainingBatteryString + " ");
    }
    
}