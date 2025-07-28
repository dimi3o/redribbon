import QtQuick 2.0
import Sailfish.Silica 1.0

Page {
    objectName: "aboutPage"
    allowedOrientations: Orientation.All

    SilicaFlickable {
        objectName: "flickable"
        anchors.fill: parent
        contentHeight: layout.height + Theme.paddingLarge

        Column {
            id: layout
            objectName: "layout"
            width: parent.width
            spacing: Theme.paddingSmall

            PageHeader {
                objectName: "pageHeader"
                title: "О приложении"
            }
            Label {
                objectName: "developerText"
                anchors { left: parent.left; right: parent.right; margins: Theme.horizontalPageMargin }
                font.pixelSize: Theme.fontSizeMeduim
                textFormat: Text.RichText
                wrapMode: Text.WordWrap
                text: "Приложение для открытия лаборатории мобильной разработки Аврора.<br/><br/>" +
                      "Встреча руководителей, организаторов и других участников для торжественного перерезания красной ленты.<br/><br/>" +
                      "Место встречи:  Центр цифрового лидерства МГТУ им. Н.Э. Баумана (Bauman Digital World)."
            }
            SectionHeader {
                objectName: "siteInfo"
                text: "Сайт:"
                font.pixelSize: Theme.fontSizeLarge
            }
            Label {
                objectName: "developerText"
                width: parent.width - 2*Theme.horizontalPageMargin
                horizontalAlignment: Text.AlignRight
                font.pixelSize: Theme.fontSizeMedium
                textFormat: Text.RichText
                wrapMode: Text.WordWrap
                text: "<style>a:link { color: " + Theme.highlightColor + "; }</style>" +
                                  "<a href=\"https://bmstu.ru/\">https://bmstu.ru/</a>"
                onLinkActivated: {
                    Qt.openUrlExternally(link)
                }
            }
            SectionHeader {
                objectName: "contactInfo"
                text: "Адрес:"
                font.pixelSize: Theme.fontSizeLarge
            }
            Label {
                objectName: "developerText"
                width: parent.width - 2*Theme.horizontalPageMargin
                horizontalAlignment: Text.AlignRight
                font.pixelSize: Theme.fontSizeSmall
                textFormat: Text.RichText
                wrapMode: Text.WordWrap
                text: "Бауманская ул., 57, Москва"
            }
            SectionHeader {
                objectName: "devInfo"
                text: "Разработчик:"
                font.pixelSize: Theme.fontSizeLarge
            }
            Label {
                anchors.horizontalCenter: parent.horizontalCenter
                width: parent.width - 2*Theme.horizontalPageMargin
                horizontalAlignment: Text.AlignRight
                wrapMode: Text.Wrap
                font.pixelSize: Theme.fontSizeSmall
                text: "Made by Dmytry Vidmanov.<br/><br/>vidmanov@bmstu.ru"
            }
            SectionHeader {
                objectName: "versionInfo"
                text: "Версия приложения"
                font.pixelSize: Theme.fontSizeLarge
            }
            Label {
                anchors.horizontalCenter: parent.horizontalCenter
                width: parent.width - 2*Theme.horizontalPageMargin
                horizontalAlignment: Text.AlignRight
                wrapMode: Text.Wrap
                font.pixelSize: Theme.fontSizeSmall
                text: "0.3"
            }
        }
    }
}
