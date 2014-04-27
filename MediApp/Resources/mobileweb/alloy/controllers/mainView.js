function Controller() {
    require("alloy/controllers/BaseController").apply(this, Array.prototype.slice.call(arguments));
    this.__controllerPath = "mainView";
    arguments[0] ? arguments[0]["__parentSymbol"] : null;
    arguments[0] ? arguments[0]["$model"] : null;
    arguments[0] ? arguments[0]["__itemTemplate"] : null;
    var $ = this;
    var exports = {};
    var __alloyId0 = [];
    $.__views.myPatients = Ti.UI.createWindow({
        id: "myPatients",
        title: "My Patients"
    });
    $.__views.label1 = Ti.UI.createLabel({
        text: "My Patients Window",
        id: "label1",
        color: "#999"
    });
    $.__views.myPatients.add($.__views.label1);
    var __alloyId3 = [];
    $.__views.__alloyId4 = {
        properties: {
            title: "List item 1",
            id: "__alloyId4"
        }
    };
    __alloyId3.push($.__views.__alloyId4);
    $.__views.__alloyId5 = {
        properties: {
            title: "List item 2",
            id: "__alloyId5"
        }
    };
    __alloyId3.push($.__views.__alloyId5);
    $.__views.__alloyId6 = {
        properties: {
            title: "List item 3",
            id: "__alloyId6"
        }
    };
    __alloyId3.push($.__views.__alloyId6);
    $.__views.__alloyId1 = Ti.UI.createListSection({
        id: "__alloyId1"
    });
    $.__views.__alloyId1.items = __alloyId3;
    var __alloyId7 = [];
    __alloyId7.push($.__views.__alloyId1);
    $.__views.list = Ti.UI.createListView({
        sections: __alloyId7,
        id: "list"
    });
    $.__views.myPatients.add($.__views.list);
    $.__views.myPatientsTab = Ti.UI.createTab({
        window: $.__views.myPatients,
        id: "myPatientsTab",
        title: "My Patients",
        icon: "KS_nav_views.png"
    });
    __alloyId0.push($.__views.myPatientsTab);
    $.__views.search = Ti.UI.createWindow({
        id: "search",
        title: "Search"
    });
    $.__views.label2 = Ti.UI.createLabel({
        text: "Search Window",
        id: "label2",
        color: "#999"
    });
    $.__views.search.add($.__views.label2);
    var __alloyId10 = [];
    $.__views.__alloyId11 = {
        properties: {
            title: "List item 1",
            id: "__alloyId11"
        }
    };
    __alloyId10.push($.__views.__alloyId11);
    $.__views.__alloyId12 = {
        properties: {
            title: "List item 2",
            id: "__alloyId12"
        }
    };
    __alloyId10.push($.__views.__alloyId12);
    $.__views.__alloyId13 = {
        properties: {
            title: "List item 3",
            id: "__alloyId13"
        }
    };
    __alloyId10.push($.__views.__alloyId13);
    $.__views.__alloyId8 = Ti.UI.createListSection({
        id: "__alloyId8"
    });
    $.__views.__alloyId8.items = __alloyId10;
    var __alloyId14 = [];
    __alloyId14.push($.__views.__alloyId8);
    $.__views.list = Ti.UI.createListView({
        sections: __alloyId14,
        id: "list"
    });
    $.__views.search.add($.__views.list);
    $.__views.searchTab = Ti.UI.createTab({
        window: $.__views.search,
        id: "searchTab",
        title: "Search",
        icon: "KS_nav_views.png"
    });
    __alloyId0.push($.__views.searchTab);
    $.__views.options = Ti.UI.createWindow({
        id: "options",
        title: "Options"
    });
    $.__views.label2 = Ti.UI.createLabel({
        text: "Options Window",
        id: "label2",
        color: "#999"
    });
    $.__views.options.add($.__views.label2);
    $.__views.optionsTab = Ti.UI.createTab({
        window: $.__views.options,
        id: "optionsTab",
        title: "Options",
        icon: "KS_nav_views.png"
    });
    __alloyId0.push($.__views.optionsTab);
    $.__views.mainView = Ti.UI.createTabGroup({
        tabs: __alloyId0,
        backgroundColor: "white",
        id: "mainView"
    });
    $.__views.mainView && $.addTopLevelView($.__views.mainView);
    exports.destroy = function() {};
    _.extend($, $.__views);
    _.extend($, exports);
}

var Alloy = require("alloy"), Backbone = Alloy.Backbone, _ = Alloy._;

module.exports = Controller;