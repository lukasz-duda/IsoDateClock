using Toybox.Test as Test;
using Toybox.WatchUi as Ui;

class PresenterTest {

    var sut;
    var gateway;
    var view;

    (:test)
    function updateView_showsTime(logger) {
        PresenterTest.assertPresentedTime(0, 1, "0:01");
        PresenterTest.assertPresentedTime(13, 1, "13:01");
        PresenterTest.assertPresentedTime(23, 59, "23:59");
        return true;
    }
    
    function assertPresentedTime(hour, minute, expectedString) {
        var test = PresenterTest.make();
        test.gateway.setTime(hour, minute);
        
        test.sut.updateView();
        
        var presentedString = test.view.getPresentedTime();
        test.assertPresentedString(expectedString, presentedString);
    }
    
    function make() {
        var test = new PresenterTest();
        test.setUpSystemUnderTest();
        return test;
    }
    
    function setUpSystemUnderTest() {
        me.gateway = new GatewaySpy();
        me.view = new ViewSpy();
        me.sut = new Presenter(me.gateway, me.view);
    }
    
    function assertPresentedString(expectedString, presentedString) {
        var message = presentedString + " should be equal " + expectedString;
        Test.assertEqualMessage(expectedString, presentedString, message);
    }
    
    (:test)
    function updateView_showsDate(logger) {
        PresenterTest.assertPresentedDate(1970, 1, 1, "1970-01-01");
        PresenterTest.assertPresentedDate(2000, 1, 2, "2000-01-02");
        PresenterTest.assertPresentedDate(2017, 12, 31, "2017-12-31");
        return true;
    }
    
    function assertPresentedDate(year, month, day, expectedString) {
        var test = PresenterTest.make();
        test.gateway.setDate(year, month, day);
        
        test.sut.updateView();
        
        var presentedString = test.view.getPresentedDate();
        test.assertPresentedString(expectedString, presentedString);
    }
    
    (:test)
    function updateView_showsRemainingBattery(logger) {
        PresenterTest.assertPresentedRemainingBattery(0, "0 %");
        PresenterTest.assertPresentedRemainingBattery(0.4, "0 %");
        PresenterTest.assertPresentedRemainingBattery(0.5, "1 %");
        PresenterTest.assertPresentedRemainingBattery(0.999, "1 %");
        PresenterTest.assertPresentedRemainingBattery(1, "1 %");
        PresenterTest.assertPresentedRemainingBattery(99, "99 %");
        PresenterTest.assertPresentedRemainingBattery(100, "100 %");
        return true;
    }
    
    function assertPresentedRemainingBattery(remainingBattery, expectedString) {
        var test = PresenterTest.make();
        test.gateway.setRemainingBattery(remainingBattery);
        
        test.sut.updateView();
        
        var presentedString = test.view.getPresentedRemainingBattery();
        test.assertPresentedString(expectedString, presentedString);
    }
    
    (:test)
    function updateView_showsDayOfWeek(logger) {
        PresenterTest.assertPresentedDayOfWeek(2018, 1, 1, Rez.Strings.Monday);
        PresenterTest.assertPresentedDayOfWeek(2018, 1, 2, Rez.Strings.Tuesday);
        PresenterTest.assertPresentedDayOfWeek(2018, 1, 3, Rez.Strings.Wednesday);
        PresenterTest.assertPresentedDayOfWeek(2018, 1, 4, Rez.Strings.Thursday);
        PresenterTest.assertPresentedDayOfWeek(2018, 1, 5, Rez.Strings.Friday);
        PresenterTest.assertPresentedDayOfWeek(2018, 1, 6, Rez.Strings.Saturday);
        PresenterTest.assertPresentedDayOfWeek(2018, 1, 7, Rez.Strings.Sunday);
        PresenterTest.assertPresentedDayOfWeek(2018, 1, 8, Rez.Strings.Monday);
        return true;
    }
    
    function assertPresentedDayOfWeek(year, month, day, dayOfWeekResoureId) {
        var expectedString = Ui.loadResource(dayOfWeekResoureId);
        var test = PresenterTest.make();
        test.gateway.setDate(year, month, day);
        
        test.sut.updateView();
        
        var presentedString = test.view.getPresentedDayOfWeek();
        test.assertPresentedString(expectedString, presentedString);
    }

}