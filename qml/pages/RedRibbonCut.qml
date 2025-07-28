import QtQuick 2.0
import Sailfish.Silica 1.0
import QtMultimedia 5.6

Page {
    id: pageRRC1
    allowedOrientations: Orientation.Landscape
    backgroundColor: "white"

    readonly property string dataPath: "/usr/share/ru.bmstu.redribbon/data/"
    property bool firstStep: true
    property bool secondStep: false
    property bool cutting: false
    property int bpm: 60

    Timer {
        id: tempo
        interval: (60.0 / bpm) * 1000.0
        running: true
        repeat: true
        onTriggered: pageRRC1.tock()
    }

    function tock() {
        if (firstStep) {
            if (videoRRC1.playbackState === MediaPlayer.StoppedState)
                videoRRC1.play()
            firstStep = false
            cutting = true
        }
        else {
            if (cutting){
                soundEffect0.play()
                cutting = false
            }
            if (!secondStep) {
                if (videoRRC1.playbackState === MediaPlayer.StoppedState) {
                    videoRRC1.source = dataPath+"aurora.mp4"
                    videoRRC1.play()
                    soundEffect1.play()
                    soundEffect2.play()
                    secondStep = true
                }
            }
            else {
                if (videoRRC1.playbackState === MediaPlayer.StoppedState)
                    videoRRC1.play()
            }
        }
    }

    SoundEffect { id: soundEffect0; source: dataPath+"cutting.wav" }
    SoundEffect { id: soundEffect1; source: dataPath+"applause.wav" }
    SoundEffect { id: soundEffect2; source: dataPath+"fanfare.wav" }
    VideoWindow {
        id: videoRRC1
        source: dataPath+"redribbon.mp4"
    }
    IconButton {
        id: resetBtn
        highlighted: true
        icon.source: "image://theme/icon-m-back"
        height: Theme.itemSizeLarge
        anchors.bottom: parent.bottom
        anchors.right: parent.right
        onClicked: {
            if (secondStep) pageStack.pop()
        }
    }
    IconButton {
        id: aboutBtn
        highlighted: true
        icon.source: "image://theme/icon-m-about"
        height: Theme.itemSizeLarge
        anchors.bottom: parent.bottom
        anchors.left: parent.left
        onClicked: {
            pageStack.push(Qt.resolvedUrl("AboutPage.qml"))
        }
    }
}
