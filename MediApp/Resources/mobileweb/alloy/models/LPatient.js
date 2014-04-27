exports.definition = {
	config: {
		columns: {
			"patientId": "text",
		    "name": "text",
		    "phone": "text"
		},
		adapter: {
			type: "sql",
			collection_name: "lPatient"
		}
	},
	extendModel: function(Model) {
		_.extend(Model.prototype, {
			// extended functions and properties go here
		});

		return Model;
	},
	extendCollection: function(Collection) {
		_.extend(Collection.prototype, {
			// extended functions and properties go here
		});

		return Collection;
	}
};

var Alloy = require('alloy'),
    _ = require("alloy/underscore")._,
	model, collection;

model = Alloy.M('lPatient',
	 exports.definition,
	[]
);

collection = Alloy.C('lPatient',
	 exports.definition,
	 model
);

exports.Model = model;
exports.Collection = collection;