var stompClient = null;
var counter;

function connect() {
	var counter = newaccounts;
    var socket = new SockJS('/accountsmanager/notify');  // Web Name + StompEndpoints
    stompClient = Stomp.over(socket);            
    stompClient.connect({}, function(frame) {
        console.log('Connected: ' + frame);
        stompClient.subscribe('/topic/managerpage/createNew', function(){ // @SendTo
        	counter++;
        	newaccounts++;
        	showNotification();	
        });
    });
}

function showNotification() {
	if(role.indexOf("admin") === 1){
		$('#numberNew').html(newaccounts);
	}
}