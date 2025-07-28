import QtQuick 2.0
import Sailfish.Silica 1.0

CoverBackground {
    objectName: "defaultCover"

    CoverPlaceholder {
        objectName: "applicationCover"
        text: qsTr("Red Ribbon")
        icon {
            source: Qt.resolvedUrl("../icons/redribbon.svg")
            sourceSize { width: icon.width; height: icon.height }
        }
    }
}
