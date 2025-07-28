import QtQuick 2.6
import QtMultimedia 5.6

Item {
    id:videoWindow
    anchors.fill: parent
    signal closed
    property alias playbackState: player.playbackState
    property alias source: player.source

    function play() { player.play() }
    function stop() { player.stop() }
    function pause() { player.pause() }

    Rectangle{
        anchors.fill: parent
        color: "white"
    }

    MediaPlayer {
        id:player
    }

    VideoOutput{
        source: player
        anchors.fill: parent
    }
}
