import QtQuick 2.6
import Sailfish.Silica 1.0
import QtMultimedia 5.6

Rectangle {
    property alias note: keySound.source
    property string text: ""
    readonly property color initialColor: "#FA8072"
    property bool initial: false

    id: keyRed
    color: initialColor
    width: 200
    height: 200
    radius: width * 0.5

    function onPress(){
        keySound.play()
        keyRed.color = "#FF0000"
        initial = true
    }

    function onRelease(){
        keyRed.color = initialColor
        initial = false
    }

    Label {
        id: label
        color: Theme.primaryColor
        text: parent.text
        font.pixelSize: parent.height / 2
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.verticalCenter: parent.verticalCenter
    }
    MultiPointTouchArea {
        id: touchArea
        anchors.fill: parent
        onPressed: {
            onPress()
        }
        onReleased: {
            onRelease()
        }
    }

    SoundEffect { id: keySound }

    Behavior on color {
        ColorAnimation { duration: 25 }
    }
}
