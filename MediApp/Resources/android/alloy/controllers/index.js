function Controller() {
    function login() {
        openIndicator();
        if ("" == $.inputEmail.value) {
            var toast = Ti.UI.createNotification({
                message: "Please enter a valid Email",
                duration: Ti.UI.NOTIFICATION_DURATION_SHORT
            });
            toast.show();
        } else if ("" == $.inputPass.value) {
            var toast = Ti.UI.createNotification({
                message: "Please enter a password",
                duration: Ti.UI.NOTIFICATION_DURATION_LONG
            });
            toast.show();
        } else checkLogin();
    }
    function checkLogin() {
        var url = "http://185.38.44.166:8080/MediAppRest/login/" + $.inputEmail.value + "/" + $.inputPass.value;
        var httpCli = Ti.Network.createHTTPClient({
            onload: function() {
                json = JSON.parse(this.responseText);
                if (json) if ($.inputEmail.value == json.email) {
                    Titanium.App.Properties.setString("userId", json.id);
                    Titanium.App.Properties.setString("userName", json.name);
                    Titanium.App.Properties.setString("userType", json.type);
                    Titanium.App.Properties.setString("userAddress", json.address);
                    Titanium.App.Properties.setString("userPhone", json.phone);
                    Titanium.App.Properties.setString("userEmail", json.email);
                    var toast = Ti.UI.createNotification({
                        message: "Welcome " + json.name + "!",
                        duration: Ti.UI.NOTIFICATION_DURATION_SHORT
                    });
                    toast.show();
                    var mainView = Alloy.createController("mainView").getView();
                    mainView.open();
                    closeIndicator();
                } else {
                    closeIndicator();
                    var toast = Ti.UI.createNotification({
                        message: "Invalid Credentials",
                        duration: Ti.UI.NOTIFICATION_DURATION_LONG
                    });
                    toast.show();
                }
            },
            onerror: function(e) {
                closeIndicator();
                Ti.API.debug("STATUS: " + this.status);
                Ti.API.debug("TEXT:   " + this.responseText);
                Ti.API.debug("ERROR:  " + e.error);
                alert("There was an error retrieving the remote data. Try again.");
            },
            timeout: 5e3
        });
        httpCli.open("GET", url);
        httpCli.send();
    }
    function openIndicator() {
        win.open();
        activityIndicator.show();
    }
    function closeIndicator() {
        activityIndicator.hide();
        win.close();
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
        backgroundGradient: {
            type: "linear",
            startPoint: {
                x: "50%",
                y: "100%"
            },
            endPoint: {
                x: "50%",
                y: "0%"
            },
            colors: [ "teal", "white", "white", "teal" ]
        },
        id: "index"
    });
    $.__views.index && $.addTopLevelView($.__views.index);
    $.__views.loginView = Ti.UI.createView({
        id: "loginView",
        layout: "vertical",
        top: "140"
    });
    $.__views.index.add($.__views.loginView);
    $.__views.emailId = Ti.UI.createLabel({
        width: Ti.UI.SIZE,
        height: Ti.UI.SIZE,
        color: "#000",
        font: {
            fontSize: "32dp",
            fontWeight: "bold"
        },
        id: "emailId",
        text: "Login",
        top: "20"
    });
    $.__views.loginView.add($.__views.emailId);
    $.__views.inputEmail = Ti.UI.createTextField({
        id: "inputEmail",
        width: "250",
        hintText: "Email",
        top: "40",
        value: "admin@admin.com",
        color: "black"
    });
    $.__views.loginView.add($.__views.inputEmail);
    $.__views.inputPass = Ti.UI.createTextField({
        id: "inputPass",
        passwordMask: "true",
        width: "250",
        hintText: "Password",
        top: "20",
        value: "admin123",
        color: "black"
    });
    $.__views.loginView.add($.__views.inputPass);
    $.__views.buttonLogin = Ti.UI.createButton({
        title: "Log In",
        id: "buttonLogin",
        width: "200",
        top: "20"
    });
    $.__views.loginView.add($.__views.buttonLogin);
    login ? $.__views.buttonLogin.addEventListener("click", login) : __defers["$.__views.buttonLogin!click!login"] = true;
    exports.destroy = function() {};
    _.extend($, $.__views);
    var style;
    style = Ti.UI.ActivityIndicatorStyle.DARK;
    var win = Titanium.UI.createWindow({
        navBarHidden: true,
        height: Ti.UI.FILL,
        width: Ti.UI.FILL,
        touchEnabled: false,
        backgroundColor: "#000",
        opacity: .8
    });
    var view = Ti.UI.createView({
        width: Ti.UI.SIZE,
        height: Ti.UI.SIZE,
        layout: "horizontal"
    });
    var activityIndicator = Ti.UI.createActivityIndicator({
        style: style
    });
    var label = Titanium.UI.createLabel({
        text: "Logging In...",
        color: "#fff",
        font: {
            fontFamily: "Helvetica Neue",
            fontSize: 18,
            fontWeight: "bold"
        }
    });
    view.add(activityIndicator);
    view.add(label);
    win.add(view);
    $.index.open();
    __defers["$.__views.buttonLogin!click!login"] && $.__views.buttonLogin.addEventListener("click", login);
    _.extend($, exports);
}

var Alloy = require("alloy"), Backbone = Alloy.Backbone, _ = Alloy._;

module.exports = Controller;