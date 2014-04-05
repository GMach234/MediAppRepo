
var patientsListView = Titanium.UI.createListView({
	sections: [patientListSection],
	headerTitle: "Patients List"
});

var patientListSection = Titanium.UI.createListSection({
    items: [data],
    headerTitle: "Section A"
});



var data = [
	{ properties: { title: 'Row 1'} },
	{ properties: { title: 'Row 2'} },
	{ properties: { title: 'Row 3'} }
];

var listSection = Titanium.UI.createListSection({items: data});

var listView = Titanium.UI.createListView({section: [listSection]});


function showMain(event) {

	var mainView = Alloy.createController("mainView").getView();
	
	mainView.add(patientsListView);
	
	mainView.open();
	
}