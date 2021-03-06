function Controller() {
    function getPatient(displayPatient) {
        actInd.show();
        win.open();
        var pClient = Ti.Network.createHTTPClient({
            onload: function() {
                var patientJson = JSON.parse(this.responseText);
                displayPatient(getNotes, patientJson);
            }
        });
        pClient.open("GET", "http://185.38.44.166:8080/MediAppRest/getPatient/" + Titanium.App.Properties.getString("patientId"));
        pClient.send();
    }
    function displayPatient(getNotes, patientJson) {
        var detailsView = Titanium.UI.createView({
            height: Titanium.UI.SIZE,
            width: Titanium.UI.FILL,
            top: 5,
            bottom: 5
        });
        var label = Titanium.UI.createLabel({
            text: "Name: \nAge: \nPhone: \nAddress:\n",
            color: "black",
            font: {
                fontSize: 16,
                fontWeight: "bold"
            },
            left: 10
        });
        var label1 = Titanium.UI.createLabel({
            text: patientJson.name + " (Patient ID: " + patientJson.id + ")\n" + patientJson.age + "\n" + patientJson.phone + "\n\n" + patientJson.address,
            color: "black",
            font: {
                fontSize: 16
            },
            textAlign: "right",
            right: 10
        });
        detailsView.add(label);
        detailsView.add(label1);
        patientView.add(detailsView);
        getNotes(displayNotes, patientJson.id);
    }
    function getNotes(displayNotes, id) {
        var nClient = Ti.Network.createHTTPClient({
            onload: function() {
                var notesJson = JSON.parse(this.responseText);
                displayNotes(notesJson);
            }
        });
        nClient.open("GET", "http://185.38.44.166:8080/MediAppRest/getNotes/" + id);
        nClient.send();
    }
    function displayNotes(notesJson) {
        var table = Titanium.UI.createTableView({});
        var section = Ti.UI.createTableViewSection({
            headerTitle: "Patient Notes:"
        });
        for (var i = notesJson.length; i > 0; --i) {
            var view = Ti.UI.createView({
                height: Titanium.UI.SIZE,
                width: Titanium.UI.FIll,
                layout: "vertical",
                top: 10,
                bottom: 10
            });
            var label = Ti.UI.createLabel({
                text: notesJson[i].time,
                color: "black",
                font: {
                    fontSize: 18,
                    fontWeight: "bold"
                },
                left: 10,
                width: "auto",
                height: "auto"
            });
            var label1 = Ti.UI.createLabel({
                text: notesJson[i].note,
                color: "black",
                font: {
                    fontSize: 16
                },
                top: 10,
                left: 10,
                right: 10
            });
            view.add(label);
            view.add(label1);
            var row = Ti.UI.createTableViewRow({
                _id: i,
                _nid: notesJson[i].noteId,
                height: 100,
                layout: "vertical"
            });
            row.addEventListener("click", function(e) {
                if (100 == e.row.height) {
                    e.row.height = 400;
                    var index = e.row._id;
                    index++;
                    table.scrollToTop(index);
                    refreshThumbnails(0);
                    getNoteImages(refreshThumbnails, e.row._nid);
                } else {
                    refreshThumbnails(0);
                    e.row.height = 100;
                }
            });
            row.add(view);
            section.add(row);
        }
        table.appendSection(section);
        patientView.add(table);
        $.viewWindow.add(patientView);
        $.viewWindow.add(noteImagesView);
        win.close();
        actInd.hide();
    }
    function getNoteImages(refreshThumbnails, id) {
        actInd.show();
        win.open();
        var iClient = Ti.Network.createHTTPClient({
            onload: function() {
                var imagesJson = JSON.parse(this.responseText);
                currNoteImages = [];
                for (i in imagesJson) {
                    var b64decoded = Ti.Utils.base64decode(imagesJson[i]);
                    currNoteImages.push(b64decoded);
                }
                refreshThumbnails(1);
            }
        });
        iClient.open("GET", "http://185.38.44.166:8080/MediAppRest/getImages/" + id);
        iClient.send();
    }
    function refreshThumbnails(clear) {
        if (0 == clear) {
            currNoteImages = [];
            noteImagesView.removeAllChildren();
        } else {
            noteImagesView.removeAllChildren();
            for (i in currNoteImages) {
                var width = currNoteImages[i].getWidth();
                var height = currNoteImages[i].getHeight();
                var image = Ti.UI.createImageView({
                    _id: i,
                    _fullImage: currNoteImages[i],
                    image: currNoteImages[i].imageAsResized(width / 2, height / 2),
                    right: 3,
                    left: 3
                });
                noteImagesView.add(image);
            }
            win.close();
            actInd.hide();
        }
    }
    function displayFullThumbnail(imagePath) {
        var fullScreenImage = Ti.UI.createImageView({
            image: imagePath,
            width: Ti.UI.SIZE,
            height: Ti.UI.SIZE
        });
        fullScreenImage.addEventListener("click", function() {
            $.viewWindow.remove(fullScreenImage);
        });
        $.viewWindow.add(fullScreenImage);
    }
    function displayFullImage(imagePath) {
        var fullScreenImage = Ti.UI.createImageView({
            image: imagePath,
            width: Ti.UI.SIZE,
            height: Ti.UI.SIZE
        });
        fullScreenImage.addEventListener("click", function() {
            $.addNoteWindow.remove(fullScreenImage);
        });
        $.addNoteWindow.add(fullScreenImage);
    }
    function displayThumbnails() {
        thumbnailView.removeAllChildren();
        for (i in imageData) {
            var image = Ti.UI.createImageView({
                _id: i,
                image: imageData[i],
                right: 3,
                left: 3
            });
            thumbnailView.add(image);
        }
    }
    function uploadImages() {
        var image64arr = new Array();
        for (i in imageData) {
            var image64 = Ti.Utils.base64encode(imageData[i]).toString();
            image64arr.push(image64);
        }
        var imagesToSend = {
            imageData: image64arr
        };
        var iClient = Ti.Network.createHTTPClient({
            onload: function() {}
        });
        iClient.open("POST", "http://185.38.44.166:8080/MediAppRest/submitImages/");
        iClient.setRequestHeader("Content-type", "application/json");
        iClient.send(JSON.stringify(imagesToSend));
    }
    require("alloy/controllers/BaseController").apply(this, Array.prototype.slice.call(arguments));
    this.__controllerPath = "patientView";
    arguments[0] ? arguments[0]["__parentSymbol"] : null;
    arguments[0] ? arguments[0]["$model"] : null;
    arguments[0] ? arguments[0]["__itemTemplate"] : null;
    var $ = this;
    var exports = {};
    var __alloyId1 = [];
    $.__views.viewWindow = Ti.UI.createWindow({
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
        id: "viewWindow",
        title: "View"
    });
    $.__views.viewTab = Ti.UI.createTab({
        window: $.__views.viewWindow,
        id: "viewTab",
        title: "View",
        icon: "KS_nav_views.png"
    });
    __alloyId1.push($.__views.viewTab);
    $.__views.addNoteWindow = Ti.UI.createWindow({
        id: "addNoteWindow",
        title: "Add Note"
    });
    $.__views.addNoteTab = Ti.UI.createTab({
        window: $.__views.addNoteWindow,
        id: "addNoteTab",
        title: "Add Note",
        icon: "KS_nav_views.png"
    });
    __alloyId1.push($.__views.addNoteTab);
    $.__views.patientView = Ti.UI.createTabGroup({
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
        tabs: __alloyId1,
        id: "patientView"
    });
    $.__views.patientView && $.addTopLevelView($.__views.patientView);
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
    var actInd = Ti.UI.createActivityIndicator({
        style: style
    });
    var view = Ti.UI.createView({
        width: Ti.UI.SIZE,
        height: Ti.UI.SIZE,
        layout: "horizontal"
    });
    var label = Titanium.UI.createLabel({
        text: "Loading...",
        color: "#fff",
        font: {
            fontFamily: "Helvetica Neue",
            fontSize: 18,
            fontWeight: "bold"
        }
    });
    view.add(actInd);
    view.add(label);
    win.add(view);
    var patientView = Ti.UI.createView({
        backgroundColor: "transparent",
        top: 0,
        left: 0,
        width: "100%",
        height: "100%",
        layout: "vertical"
    });
    setTimeout(function() {
        getPatient(displayPatient);
    }, 100);
    var noteImagesView = Ti.UI.createView({
        bottom: 5,
        right: 5,
        left: 5,
        width: Ti.UI.SIZE,
        height: 75,
        layout: "horizontal"
    });
    noteImagesView.addEventListener("click", function(e) {
        displayFullThumbnail(e.source._fullImage);
    });
    var currNoteImages = [];
    var noteView = Ti.UI.createView({
        top: 0,
        left: 0,
        width: "100%",
        height: "100%",
        layout: "vertical"
    });
    var noteArea = Ti.UI.createTextArea({
        borderWidth: 2,
        borderColor: "#bbb",
        borderRadius: 45,
        color: "black",
        font: {
            fontSize: 18
        },
        textAlign: "left",
        top: 5,
        right: 5,
        left: 5,
        bottom: 190,
        width: Titanium.UI.FILL,
        height: Titanium.UI.FILL
    });
    noteView.add(noteArea);
    $.addNoteWindow.add(noteView);
    var bottomView = Ti.UI.createView({
        bottom: 0,
        height: 185,
        layout: "vertical",
        width: Ti.UI.FILL
    });
    var thumbnailView = Ti.UI.createView({
        top: 5,
        right: 5,
        left: 5,
        bottom: 5,
        width: Ti.UI.SIZE,
        height: 75,
        layout: "horizontal"
    });
    thumbnailView.addEventListener("click", function(e) {
        displayFullImage(e.source.image);
    });
    thumbnailView.addEventListener("longpress", function(e) {
        var dialog = Ti.UI.createAlertDialog({
            _id: e.source._id,
            cancel: 1,
            buttonNames: [ "Confirm", "Cancel" ],
            message: "Remove selected Image?",
            title: "Image"
        });
        dialog.addEventListener("click", function(e) {
            if (e.index === e.source.cancel) ; else {
                imageData.splice(e.source._id, 1);
                displayThumbnails();
            }
        });
        dialog.show();
    });
    var imageData = [];
    var attachImageBtn = Titanium.UI.createButton({
        title: "Attach Image",
        right: 5,
        left: 5,
        bottom: 5,
        height: 45,
        width: Ti.UI.FILL
    });
    attachImageBtn.addEventListener("click", function() {
        imageData.length >= 7 ? alert("Maximum of 7 Images per Note.\nLongpress an Image to remove.") : Titanium.Media.showCamera({
            success: function(event) {
                imageData.push(event.media);
                displayThumbnails();
            }
        });
    });
    var submitBtn = Titanium.UI.createButton({
        title: "Submit Note",
        right: 5,
        left: 5,
        bottom: 0,
        height: 45,
        width: Ti.UI.FILL
    });
    submitBtn.addEventListener("click", function() {
        var noteData = {
            patientId: Titanium.App.Properties.getString("patientId"),
            note: noteArea.value,
            userId: Titanium.App.Properties.getString("userId")
        };
        var nClient = Ti.Network.createHTTPClient({
            onload: function() {
                imageData.length > 0 && uploadImages();
            }
        });
        nClient.open("POST", "http://185.38.44.166:8080/MediAppRest/submitNote/");
        nClient.setRequestHeader("Content-Type", "application/json");
        nClient.send(JSON.stringify(noteData));
    });
    bottomView.add(thumbnailView);
    bottomView.add(attachImageBtn);
    bottomView.add(submitBtn);
    $.addNoteWindow.add(bottomView);
    _.extend($, exports);
}

var Alloy = require("alloy"), Backbone = Alloy.Backbone, _ = Alloy._;

module.exports = Controller;