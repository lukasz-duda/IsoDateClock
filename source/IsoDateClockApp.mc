using Toybox.Application as App;

class IsoDateClockApp extends App.AppBase {

    function initialize() {
        AppBase.initialize();
    }

    function getInitialView() {
        return [ new IsoDateClockView() ];
    }

}