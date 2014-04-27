exports.definition = {
    config: {
        columns: {
            patientId: "text",
            name: "text",
            phone: "text"
        },
        adapter: {
            type: "sql",
            collection_name: "lPatient"
        }
    },
    extendModel: function(Model) {
        _.extend(Model.prototype, {});
        return Model;
    },
    extendCollection: function(Collection) {
        _.extend(Collection.prototype, {});
        return Collection;
    }
};

var Alloy = require("alloy"), _ = require("alloy/underscore")._, model, collection;

model = Alloy.M("lPatient", exports.definition, []);

collection = Alloy.C("lPatient", exports.definition, model);

exports.Model = model;

exports.Collection = collection;