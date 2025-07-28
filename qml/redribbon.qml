import QtQuick 2.0
import Sailfish.Silica 1.0

ApplicationWindow {
    id: applicationWindow
    objectName: "applicationWindow"
    initialPage: Qt.resolvedUrl("pages/MainPage.qml")
    cover: Qt.resolvedUrl("cover/DefaultCoverPage.qml")
    allowedOrientations: defaultAllowedOrientations

    Component.onCompleted: {
            if (applicationWindow.hasOwnProperty("displayMode")) {
                applicationWindow.displayMode = ApplicationDisplayMode.FillScreen
            }
        }
}
