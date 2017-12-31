class ViewSpy {

    var presentedTime;
    var presentedDate;
    var presentedRemainingBattery;
    var presentedDayOfWeek;

	function showTime(timeString) {
	   me.presentedTime = timeString;
	}
	
    function showDate(dateString) {
        me.presentedDate = dateString;
    }
    
    function showRemainingBattery(remainingBatteryString) {
        me.presentedRemainingBattery = remainingBatteryString;
    }
    
    function showDayOfWeek(dayOfWeekString) {
        me.presentedDayOfWeek = dayOfWeekString;
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
    
    function getPresentedDayOfWeek() {
        return me.presentedDayOfWeek;
    }
    
}