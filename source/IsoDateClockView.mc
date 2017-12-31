using Toybox.WatchUi as Ui;

class IsoDateClockView extends Ui.WatchFace {

    function initialize() {
        WatchFace.initialize();
    }

    function onLayout(dc) {
        setLayout(Rez.Layouts.WatchFace(dc));
    }

    function onUpdate(dc) {
        var presenter = makePresenter();
        presenter.updateView();
        View.onUpdate(dc);
    }
    
    function makePresenter() {
        var gateway = new SystemGateway();
        return new Presenter(gateway, me);
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
    
    function showDayOfWeek(dayOfWeekString) {
        var dayOfWeekLabel = View.findDrawableById("DayOfWeekLabel");
        dayOfWeekLabel.setText(dayOfWeekString);
    }
    
}