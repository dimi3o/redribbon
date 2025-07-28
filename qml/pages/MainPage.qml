import QtQuick 2.6
import Sailfish.Silica 1.0
import QtMultimedia 5.6
import Nemo.DBus 2.0

Page {
    id: pageMP1
    allowedOrientations: Orientation.Landscape
    backgroundColor: "white"

    readonly property string dataPath: "/usr/share/ru.bmstu.redribbon/data/"
    property int bar: 5
    property string soundId: ""
    property int measure: 1
    property int bpm: 60
    property bool countdown: false

    DBusAdaptor {
        id: keysAdapter

        property bool needUpdate: true
        property int key1_code: 0
        property int key2_code: 0
        readonly property bool key1_init: redBtn1.initial
        readonly property bool key2_init: redBtn2.initial


        service: 'ru.bmstu.redribbon'
        path: '/ru/bmstu/redribbon'
        iface: 'ru.bmstu.redribbon'

        xml: '  <interface name="ru.bmstu.redribbon">\n' +
             '    <method name="update" />\n' +
             '    <method name="updateWithArgs">' +
             '      <arg name="code" direction="in" type="i" />' +
             '    </method>\n' +
             '    <property name="needUpdate" type="b" access="readwrite" />\n' +
             '    <property name="key1_code" type="i" access="readwrite" />\n' +
             '    <property name="key2_code" type="i" access="readwrite" />\n' +
             '    <signal name="key1_changed">' +
             '      <arg name="key1_init" type="b" />' +
             '    </signal>\n' +
             '    <signal name="key2_changed">' +
             '      <arg name="key2_init" type="b" />' +
             '    </signal>\n' +
             '  </interface>\n'

        function update() {
            console.log("update called! ("+key1_code+","+key2_code+")")
            if (key1_code>0){
                if (key1_code===11) redBtn1.onPress()
                else redBtn1.onRelease()
                key1_code=0
            }
            if (key2_code>0){
                if (key2_code===21) redBtn2.onPress()
                else redBtn2.onRelease()
                key2_code=0
            }
        }

        function updateWithArgs(code) {
            if (code===11) redBtn1.onPress()
            else if (code===10) redBtn1.onRelease()
            else if (code===21) redBtn2.onPress()
            else if (code===20) redBtn2.onRelease()
            else if (code===1) {
                if (pageStack.depth>1) {
                    pageStack.pop()
                    startPlayback()
                }
            }
        }
    }

    Component.onCompleted: {
        startPlayback()
    }

    Timer {
        id: tempo1
        interval: (60.0 / bpm) * 1000.0
        running: true
        repeat: true
        onTriggered: pageMP1.tock()
    }

    SoundEffect {
        id: sound
        source: dataPath+"intro.wav"
        loops: SoundEffect.Infinite
    }
    SoundEffect { id: soundEffect1; source: dataPath+"low.wav" }
    SoundEffect { id: soundEffect2; source: dataPath+"high.wav" }
    SoundEffect { id: soundEffect3; source: dataPath+"fine2.wav" }
    SoundEffect { id: soundEffect4; source: dataPath+"fine1.wav" }

    function startPlayback() {
        videoMP1.play()
        sound.play()
        if (!tempo1.running) tempo1.start()
    }

    function stopPlayback() {
        tempo1.stop()
        sound.stop()
        bar = 5
        label.text = ""
    }

    function tock() {
        if (countdown) {
            bar = bar - 1
            switch(bar){
            case 1: soundEffect3.play(); break
            case 2: soundEffect1.play(); break
            case 3: soundEffect1.play(); break
            case 4: soundEffect1.play(); break
            }
            label.text = String(bar)
            if (bar < measure) {
                pageStack.push(Qt.resolvedUrl("RedRibbonCut.qml"))
                stopPlayback()
                countdown = false
            }
        }
        else {
            if (!sound.playing)
                sound.play()
            if (videoMP1.playbackState === MediaPlayer.StoppedState)
                videoMP1.play()
            keysAdapter.emitSignal("key1_changed",[redBtn1.initial])
            keysAdapter.emitSignal("key2_changed",[redBtn2.initial])
            if (redBtn1.initial && redBtn2.initial) {
                countdown = true
                sound.stop()
            }
        }
    }
    VideoWindow {
        id: videoMP1
        source: dataPath+"firework.mp4"
    }
    Column {
        id: column
        spacing: Theme.paddingLarge
        width: parent.width
        Item {
            width: parent.width
            height: Theme.paddingLarge
        }
        Row {
            id: logo
            spacing: parent.width/7
            anchors.horizontalCenter: parent.horizontalCenter
            Image { source: dataPath+"bmstu.png" }
            Image { source: dataPath+"omp.png"; scale: 1.2 }
        }
        Item {
            width: parent.width
            height: Theme.paddingLarge
        }
        Row {
            id: redKeys
            spacing: parent.width/3 //Theme.paddingLarge*3
            anchors.horizontalCenter: parent.horizontalCenter
            KeyRed {
                id:redBtn1
                note: dataPath + "push.wav"
                text: "1"
            }
            KeyRed {
                id:redBtn2
                note: dataPath + "push2.wav"
                text: "2"
            }
        }
    }
    IconButton {
        id: playPauseButton
        highlighted: true
        icon.source: "image://theme/icon-l-play"
        height: Theme.itemSizeLarge
        anchors.bottom: parent.bottom
        anchors.right: parent.right
        onClicked: {
            if (videoMP1.playbackState === MediaPlayer.PlayingState)
                stopPlayback()
            else
                startPlayback()
        }
    }
    Label {
        id: label
        color: "#4F4F4F"
        text: ""
        font.pixelSize: parent.height / 2
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.bottom: parent.bottom
    }
}
