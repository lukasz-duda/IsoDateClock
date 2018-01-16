using Toybox.Application as App;

class DateClockApp extends App.AppBase {

    function initialize() {
        AppBase.initialize();
    }

    function getInitialView() {
        return [ new DateClockView() ];
    }

}