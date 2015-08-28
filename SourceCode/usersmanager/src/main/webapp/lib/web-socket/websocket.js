var stompClient = null;
var counter = 0;

/*$( document ).ready(function() {
	// Connect websocket when load
	connect();
});*/

function connect() {
    var socket = new SockJS('/accountsmanager/notify');  // Web Name + StompEndpoints
    stompClient = Stomp.over(socket);            
  /*  stompClient.connect({}, function(frame) {
        console.log('Connected: ' + frame);
        stompClient.subscribe('/topic/managerpage/createNew', function(data){ // @SendTo
        	counter++;
        	//showNotification(JSON.parse(data.body).content);	
        });
    });*/
}

/*function disconnect() {
    if (stompClient != null) {
        stompClient.disconnect();
    }
    console.log("Disconnected");
}*/

function notify(username) {
    stompClient.send("/app/notifications"); // DestinationPrefixes + @MessageMapping
}


/*function showNotification(message) {
	//$('#viewNewAccount').show();
	if (role.indexOf('admin') !== -1){
		
	} else {
		console.log("Support");
	}
	 $('#viewNewAccount').load('managerpage.jsp').show();
}*/