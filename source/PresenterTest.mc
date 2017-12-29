using Toybox.Test as Test;

class PresenterTest {

	function assertFormattedTime(hour, minute, expectedFormattedTime) {
        var sut = new Presenter();
	    var time = sut.newTime(hour, minute);
	    
	    var formattedTime = sut.formatTime(time);
	    
	    var message = formattedTime + " should be equal " + expectedFormattedTime;
	    Test.assertEqualMessage(expectedFormattedTime, formattedTime, message);
	}

	(:test)
	function testFormatTime(logger) {
        var test = new PresenterTest();
        test.assertFormattedTime(0, 1, "0:01");
        test.assertFormattedTime(13, 1, "13:01");
        test.assertFormattedTime(23, 59, "23:59");
	    return true;
	}

}