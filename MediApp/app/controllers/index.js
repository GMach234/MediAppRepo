function doClick(e) {
    alert($.label.text);
}

function showLogin(event) {

	var loginView = Alloy.createController("loginView").getView();
	loginView.open();
	
}

$.index.open();
