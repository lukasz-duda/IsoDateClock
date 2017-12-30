using Toybox.System as Sys;
using Toybox.Time as Time;

class SystemGateway {

    function getClockTime() {
        return Sys.getClockTime();
    }
    
    function today() {
        return Time.today();
    }
    
    function getSystemStats() {
        return Sys.getSystemStats();
    }
}