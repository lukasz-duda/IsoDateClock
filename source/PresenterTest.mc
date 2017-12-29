using Toybox.Test as Test;

class PresenterTest {

    (:test)
    function testFormatTime(logger) {
        var test = new PresenterTest();
        test.assertFormattedTime(0, 1, "0:01");
        test.assertFormattedTime(13, 1, "13:01");
        test.assertFormattedTime(23, 59, "23:59");
        return true;
    }

	function assertFormattedTime(hour, minute, expectedFormattedTime) {
        var sut = new Presenter();
	    var time = sut.newTime(hour, minute);
	    
	    var formattedTime = sut.formatTime(time);
	    
	    var message = formattedTime + " should be equal " + expectedFormattedTime;
	    Test.assertEqualMessage(expectedFormattedTime, formattedTime, message);
	}
	
	(:test)
	function testFormattedDate(logger) {
        var test = new PresenterTest();
        test.assertFormattedDate(1970, 1, 1, "1970-01-01");
        test.assertFormattedDate(2000, 1, 2, "2000-01-02");
        test.assertFormattedDate(2017, 12, 31, "2017-12-31");
        return true;
	}

    function assertFormattedDate(year, month, day, expectedFormattedDate) {
        var sut = new Presenter();
        var date = sut.newDate(year, month, day);
        
        var formattedDate = sut.formatDate(date);
        
        var message = formattedDate + " should be equal " + expectedFormattedDate;
        Test.assertEqualMessage(expectedFormattedDate, formattedDate, message);
    }

}