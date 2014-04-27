
function login(event) {
	openIndicator();

	if($.inputEmail.value == "") {
		var toast = Ti.UI.createNotification({
	    message:"Please enter a valid Email",
	    duration: Ti.UI.NOTIFICATION_DURATION_SHORT
		});
		toast.show();
	} 
	else if($.inputPass.value == "") {
		var toast = Ti.UI.createNotification({
	    message:"Please enter a password",
	    duration: Ti.UI.NOTIFICATION_DURATION_LONG
		});
		toast.show();
	} 
	else {
		checkLogin();	
	}	
}

function checkLogin(event) {

		var url = "http://185.38.44.166:8080/MediAppRest/login/" + $.inputEmail.value + "/" + $.inputPass.value;
		
		var httpCli = Ti.Network.createHTTPClient({
				onload: function() {
					
					json = JSON.parse(this.responseText);
															
					if(json){
						if($.inputEmail.value == json.email) {

							Titanium.App.Properties.setString("userId", json.id);
							Titanium.App.Properties.setString("userName", json.name);
							Titanium.App.Properties.setString("userType", json.type);
							Titanium.App.Properties.setString("userAddress", json.address);
							Titanium.App.Properties.setString("userPhone", json.phone);
							Titanium.App.Properties.setString("userEmail", json.email);
							
							var toast = Ti.UI.createNotification({
							message:"Welcome " + json.name + "!",
							duration: Ti.UI.NOTIFICATION_DURATION_SHORT
							});
							
							toast.show();
							var mainView = Alloy.createController("mainView").getView();
							mainView.open();
							closeIndicator();
													
						} else {
							closeIndicator();
							var toast = Ti.UI.createNotification({
							message:"Invalid Credentials",
							duration: Ti.UI.NOTIFICATION_DURATION_LONG
						});
						toast.show();
						}
					}	
				},
				onerror : function(e) {
					closeIndicator();
					Ti.API.debug("STATUS: " + this.status);
			        Ti.API.debug("TEXT:   " + this.responseText);
			        Ti.API.debug("ERROR:  " + e.error);
			        alert('There was an error retrieving the remote data. Try again.');
				},
				timeout : 5000
			});

		httpCli.open("GET", url);
		httpCli.send();
}


var style;
if (Ti.Platform.name === 'iPhone OS'){
  style = Ti.UI.iPhone.ActivityIndicatorStyle.DARK;
}
else {
  style = Ti.UI.ActivityIndicatorStyle.DARK;
}
var win = Titanium.UI.createWindow({
	navBarHidden:true,
	height:Ti.UI.FILL,
	width:Ti.UI.FILL,
	touchEnabled:false,
	backgroundColor:'#000',
	opacity:0.8
});
var view = Ti.UI.createView({
    width:   Ti.UI.SIZE,
    height:  Ti.UI.SIZE,
    layout:  'horizontal'
});
var activityIndicator = Ti.UI.createActivityIndicator({
	style:style
});
var label = Titanium.UI.createLabel({
    text:    "Logging In...",
    color:   '#fff',
    font:    { fontFamily: 'Helvetica Neue', fontSize: 18, fontWeight: 'bold' }
});

view.add(activityIndicator);
view.add(label);
win.add(view);	

function openIndicator() {
    win.open();
    activityIndicator.show();
}

function closeIndicator() {
    activityIndicator.hide();
    win.close();
}

$.index.open();
