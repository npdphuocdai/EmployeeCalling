import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.15

Item {
    ListModel{
        id: nameModel
        ListElement { text: "Name 1" ; src: "qrc:/image/woman-icon.png"}
        ListElement { text: "Name 2" ; src: "qrc:/image/emp-icon.png"}
        ListElement { text: "Name 3" ; src: "qrc:/image/man-glasses-icon.png"}
        ListElement { text: "Name 4" ; src: "qrc:/image/man-icon.png"}
        ListElement { text: "Name 5" ; src: "qrc:/image/woman-icon.png"}
        ListElement { text: "Name 6" ; src: "qrc:/image/emp-icon.png"}
        ListElement { text: "Name 7" ; src: "qrc:/image/man-glasses-icon.png"}
        ListElement { text: "Name 8" ; src: "qrc:/image/man-icon.png"}
        ListElement { text: "Name 9" ; src: "qrc:/image/woman-icon.png"}
        ListElement { text: "Name 10" ; src: "qrc:/image/emp-icon.png"}
        ListElement { text: "Name 11" ; src: "qrc:/image/man-glasses-icon.png"}
        ListElement { text: "Name 12" ; src: "qrc:/image/man-icon.png"}
        ListElement { text: "Name 13" ; src: "qrc:/image/woman-icon.png"}
        ListElement { text: "Name 14" ; src: "qrc:/image/emp-icon.png"}
        ListElement { text: "Name 15" ; src: "qrc:/image/man-glasses-icon.png"}
        ListElement { text: "Name 16" ; src: "qrc:/image/man-icon.png"}
        ListElement { text: "Name 17" ; src: "qrc:/image/woman-icon.png"}
        ListElement { text: "Name 18" ; src: "qrc:/image/emp-icon.png"}
        ListElement { text: "Name 19" ; src: "qrc:/image/man-glasses-icon.png"}
        ListElement { text: "Name 20" ; src: "qrc:/image/man-icon.png"}
    }

    Component{
        id: empDelegate
        Rectangle{
            width: ListView.view.width
            height: root.height/10
            color: "lightblue"
            border.color: "black"
            radius: height/4

            Rectangle{
                id: recImg
                implicitWidth: img.sourceSize.width
                implicitHeight: img.sourceSize.height
                width: implicitWidth * ( parent.height / img.sourceSize.height) - 20
                height: implicitHeight * ( parent.height / img.sourceSize.height) - 20
                radius: width/2
                clip: true
                anchors {
                    left: parent.left
                    verticalCenter: parent.verticalCenter
                    leftMargin: 20
                }
                Image {
                    id: img
                    source: model.src
                    anchors.fill: parent
                    clip: true
                }
            }

            Text {
                id: txt
                text: model.text
                anchors {
                    left: recImg.right
                    leftMargin: 30
                    verticalCenter: parent.verticalCenter
                }
            }
        }
    }

    ListView{
        id: listEmployee
        anchors.fill: parent
        clip: true

        model: nameModel
        delegate: empDelegate
    }
}
