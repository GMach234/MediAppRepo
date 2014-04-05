function Controller() {
    function showMain() {
        var mainView = Alloy.createController("mainView").getView();
        mainView.add(patientsListView);
        mainView.open();
    }
    require("alloy/controllers/BaseController").apply(this, Array.prototype.slice.call(arguments));
    this.__controllerPath = "loginView";
    arguments[0] ? arguments[0]["__parentSymbol"] : null;
    arguments[0] ? arguments[0]["$model"] : null;
    arguments[0] ? arguments[0]["__itemTemplate"] : null;
    var $ = this;
    var exports = {};
    var __defers = {};
    $.__views.loginView = Ti.UI.createWindow({
        id: "loginView"
    });
    $.__views.loginView && $.addTopLevelView($.__views.loginView);
    $.__views.label = Ti.UI.createLabel({
        text: "The Login Page",
        id: "label"
    });
    $.__views.loginView.add($.__views.label);
    $.__views.loginButton = Ti.UI.createButton({
        id: "loginButton",
        title: "Login",
        top: "10",
        width: "100",
        height: "50"
    });
    $.__views.loginView.add($.__views.loginButton);
    showMain ? $.__views.loginButton.addEventListener("click", showMain) : __defers["$.__views.loginButton!click!showMain"] = true;
    exports.destroy = function() {};
    _.extend($, $.__views);
    var patientsListView = Titanium.UI.createListView({
        sections: [ patientListSection ],
        headerTitle: "Patients List"
    });
    var patientListSection = Titanium.UI.createListSection({
        items: [ data ],
        headerTitle: "Section A"
    });
    var data = [ {
        properties: {
            title: "Row 1"
        }
    }, {
        properties: {
            title: "Row 2"
        }
    }, {
        properties: {
            title: "Row 3"
        }
    } ];
    var listSection = Titanium.UI.createListSection({
        items: data
    });
    Titanium.UI.createListView({
        section: [ listSection ]
    });
    __defers["$.__views.loginButton!click!showMain"] && $.__views.loginButton.addEventListener("click", showMain);
    _.extend($, exports);
}

var Alloy = require("alloy"), Backbone = Alloy.Backbone, _ = Alloy._;

module.exports = Controller;