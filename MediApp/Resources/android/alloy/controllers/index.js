function Controller() {
    function __alloyId1() {
        $.__views.index.removeEventListener("open", __alloyId1);
        if ($.__views.index.activity) $.__views.index.activity.onCreateOptionsMenu = function(e) {
            var __alloyId0 = {
                id: "showLogin",
                title: "Login",
                showAsAction: Ti.Android.SHOW_AS_ACTION_IF_ROOM
            };
            $.__views.showLogin = e.menu.add(_.pick(__alloyId0, Alloy.Android.menuItemCreateArgs));
            $.__views.showLogin.applyProperties(_.omit(__alloyId0, Alloy.Android.menuItemCreateArgs));
            showLogin ? $.__views.showLogin.addEventListener("click", showLogin) : __defers["$.__views.showLogin!click!showLogin"] = true;
        }; else {
            Ti.API.warn("You attempted to attach an Android Menu to a lightweight Window");
            Ti.API.warn("or other UI component which does not have an Android activity.");
            Ti.API.warn("Android Menus can only be opened on TabGroups and heavyweight Windows.");
        }
    }
    function doClick() {
        alert($.label.text);
    }
    function showLogin() {
        var loginView = Alloy.createController("loginView").getView();
        loginView.open();
    }
    require("alloy/controllers/BaseController").apply(this, Array.prototype.slice.call(arguments));
    this.__controllerPath = "index";
    arguments[0] ? arguments[0]["__parentSymbol"] : null;
    arguments[0] ? arguments[0]["$model"] : null;
    arguments[0] ? arguments[0]["__itemTemplate"] : null;
    var $ = this;
    var exports = {};
    var __defers = {};
    $.__views.index = Ti.UI.createWindow({
        backgroundColor: "white",
        id: "index"
    });
    $.__views.index && $.addTopLevelView($.__views.index);
    $.__views.label = Ti.UI.createLabel({
        width: Ti.UI.SIZE,
        height: Ti.UI.SIZE,
        color: "#000",
        text: "Hello, World",
        id: "label"
    });
    $.__views.index.add($.__views.label);
    doClick ? $.__views.label.addEventListener("click", doClick) : __defers["$.__views.label!click!doClick"] = true;
    $.__views.index.addEventListener("open", __alloyId1);
    exports.destroy = function() {};
    _.extend($, $.__views);
    $.index.open();
    __defers["$.__views.label!click!doClick"] && $.__views.label.addEventListener("click", doClick);
    __defers["$.__views.showLogin!click!showLogin"] && $.__views.showLogin.addEventListener("click", showLogin);
    _.extend($, exports);
}

var Alloy = require("alloy"), Backbone = Alloy.Backbone, _ = Alloy._;

module.exports = Controller;