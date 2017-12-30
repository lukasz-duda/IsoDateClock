class ViewSpy {

    var presentedTime;
    var presentedDate;
    var presentedRemainingBattery;

	function showTime(timeString) {
	   me.presentedTime = timeString;
	}
	
    function showDate(dateString) {
        me.presentedDate = dateString;
    }
    
    function showRemainingBattery(remainingBatteryString) {
        me.presentedRemainingBattery = remainingBatteryString;
    }
    
    function getPresentedTime() {
        return me.presentedTime;
    }
    
    function getPresentedDate() {
        return me.presentedDate;
    }
    
    function getPresentedRemainingBattery() {
        return me.presentedRemainingBattery;
    }
    
}