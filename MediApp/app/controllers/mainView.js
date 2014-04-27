
//My Patients View //

getUserPatients();

function getUserPatients() {
	
	var pClient = Ti.Network.createHTTPClient({
		onload : function(e) {
			var userPatientsJson = JSON.parse(this.responseText);
			
			for(i in userPatientsJson) {
			
				var view = Ti.UI.createView({
					height: Ti.UI.FILL,
					width: Ti.UI.FILL
				});
				var label = Ti.UI.createLabel({
					color: 'black',
					font: {fontSize: 18, fontWeight: 'bold'},
					text:userPatientsJson[i].name,
					left:10
				});
				var label1 = Ti.UI.createLabel({
					color: 'black',
					font: {fontSize: 18},
					text:"(Patient ID: " + userPatientsJson[i].id + ")",
					right:10
				});
				var row = Ti.UI.createTableViewRow({
					height:50
				});
				view.add(label);
				view.add(label1);
				row.add(view);
				
				row.ID = userPatientsJson[i].id;
				
				row.addEventListener('click', function(e) {
					Titanium.App.Properties.setString("patientId", e.row.ID);
					
					var patientView = Alloy.createController("patientView").getView();
					patientView.open();					
				});
				
				$.myPatientsTable.appendRow(row);
			}	
			getClinics(loopClinics);
		}
	});
	
	pClient.open("GET", "http://185.38.44.166:8080/MediAppRest/getUserPatients/" + Titanium.App.Properties.getString("userId"));
	pClient.send();
}

//End My Patients View //

//Search View //

function getClinics(loopClinics) {
	
	var cClient = Ti.Network.createHTTPClient({
		onload : function(e) {
			var clinicsJson = JSON.parse(this.responseText);
			loopClinics(clinicsJson);
		}	
	});
	
	cClient.open("GET", "http://185.38.44.166:8080/MediAppRest/getClinics/" + Titanium.App.Properties.getString("userId"));
	cClient.send();
	
};

function loopClinics(clinicsJson) {
	for (i in clinicsJson) {
		getPatients(displayData, clinicsJson[i]);
	}
}; 

function getPatients(displayData, clinicData) {
	
	var pClient = Ti.Network.createHTTPClient({
		onload : function(e) {
			var patientsJson = JSON.parse(this.responseText);
			displayData(patientsJson, clinicData);
		}	
	});
	
	pClient.open("GET", "http://185.38.44.166:8080/MediAppRest/getPatients/" + clinicData.id);
	pClient.send();
	
}

function displayData(patientsJson, clinicData) {
	
	var view = Titanium.UI.createView({
		height: 40,
		width: Ti.UI.FILL,
		backgroundColor:'teal'
	});
	var label = Titanium.UI.createLabel({
		text:clinicData.name,
		color: 'black',
		font: {fontSize: 20, fontWeight: 'bold'},
		left:10
	});
	var label1 = Titanium.UI.createLabel({
		text:"(Clinic ID " + clinicData.id + ")",
		color: 'black',
		font: {fontSize: 16, fontWeight: 'bold'},
		right:10
	});
	view.add(label);
	view.add(label1);
		
	var section = Ti.UI.createTableViewSection({
		headerView:view		
	});	
	
	for(i = 0; i < patientsJson.length; i++) {
		
		var view = Titanium.UI.createView({
			height: Ti.UI.FILL,
			width: Ti.UI.FILL
		});
		var label = Titanium.UI.createLabel({
			text:patientsJson[i].name,
			color: 'black',
			font: {fontSize: 16},
			left:10
		});
		var label1 = Titanium.UI.createLabel({
			text:"(Patient ID: " + patientsJson[i].id + ")",
			color: 'black',
			font: {fontSize: 16},
			right:10
		});
		var row = Ti.UI.createTableViewRow({
			height:40
		});
		view.add(label);
		view.add(label1);
		row.add(view);

		row.ID = patientsJson[i].id;
				
		row.addEventListener('click', function(e) {
			Titanium.App.Properties.setString("patientId", e.row.ID);
			
			var patientView = Alloy.createController("patientView").getView();
			patientView.open();					
		});

		section.add(row);
	}
	$.searchTable.appendSection(section);
}

// End Search View //

// Options View //

var optionsView = Ti.UI.createView({
	backgroundColor:'transparent',
	top:0,
	left:0,
	width:'100%',
	height:'100%',
	layout:'vertical'
});

var detailsView = Titanium.UI.createView({
		height:Titanium.UI.SIZE,
		width: Titanium.UI.FILL,
		layout:'horizontal',
		top: 10,
		bottom: 10
	});
var label = Titanium.UI.createLabel({
		text:"Name: \nID: "
		+ "\nEmail: \nPhone: \nAddress: ",
		color: 'black',
		font: {fontSize: 16},
		left: 10,
		right: 12
	});	
var label1 = Titanium.UI.createLabel({
	text: Titanium.App.Properties.getString("userName")
		+ "\n" + Titanium.App.Properties.getString("userId") + " (Type: " + Titanium.App.Properties.getString("userType") + ")"
		+ "\n" + Titanium.App.Properties.getString("userEmail")
		+ "\n" + Titanium.App.Properties.getString("userPhone")
		+ "\n" + Titanium.App.Properties.getString("userAddress"),
		color: 'black',
		font: {fontSize: 16},
		right: 10
});
	
detailsView.add(label);
detailsView.add(label1);
optionsView.add(detailsView);

var table = Titanium.UI.createTableView({
});
var section = Ti.UI.createTableViewSection({
	headerTitle:"Assigned Clinics",
});

getClinics(displayClinics);

function displayClinics(clinicsJson) {
	for (i in clinicsJson) {
		
		var view = Titanium.UI.createView({
			top:5,
			bottom:5,
			height: Ti.UI.FILL,
			width: Ti.UI.FILL
		});
		var label = Titanium.UI.createLabel({
			text:clinicsJson[i].name,
			color: 'black',
			font: {fontSize: 18, fontWeight: 'bold'},
			left: 10,
			top:0
		});
		var label1 = Titanium.UI.createLabel({
			text:"(Clinic ID: " + clinicsJson[i].id + ")",
			color: 'black',
			font: {fontSize: 18, fontWeight: 'bold'},
			right: 10,
			textAlign: 'right',	
			top:0		
		});
		var label2 = Titanium.UI.createLabel({
			text:"\nEmail: \nPhone: \nAddress:\n",
			color: 'black',
			font: {fontSize: 16, fontWeight: 'bold'},
			left:10
		});
		var label3 = Titanium.UI.createLabel({
			text:"\n" + clinicsJson[i].email + "\n" + clinicsJson[i].phone + "\n\n" + clinicsJson[i].address,
			color: 'black',
			font: {fontSize: 16},
			textAlign: 'right',
			right:10
		});
		var row = Ti.UI.createTableViewRow({
			height:Ti.UI.SIZE
		});
		view.add(label);
		view.add(label1);
		view.add(label2);
		view.add(label3);
		row.add(view);

		section.add(row);
	}
	table.appendSection(section);
	optionsView.add(table);
};

$.options.add(optionsView);

var bottomButtons = Ti.UI.createView({
    //backgroundColor: '#ccc',
    bottom: 0,
    height: 110,
    layout: 'vertical',
    width: Ti.UI.FILL
});

var btn1 = Titanium.UI.createButton({
	title:"Add Clinic",
    right:5,
    left:5,
    bottom:0,
    height:50,
    width:Ti.UI.FILL
});
var btn2 = Titanium.UI.createButton({
	title:"Logout",
	right:5,
    left:5,
    bottom:0,
    height:50,
    width:Ti.UI.FILL
});

bottomButtons.add(btn1);
bottomButtons.add(btn2);

$.options.add(bottomButtons);

// End Options View //

