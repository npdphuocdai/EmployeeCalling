import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.15
import Qt.labs.settings 1.1

Item {
    Rectangle{
        id: recCalling
        anchors.fill: parent
        color: "lightgreen"

        Text {
            id: txtCalling
            text: qsTr("Calling")
            font.pointSize: parent.height / 20
            color: "white"

            anchors{
                top: parent.top
                topMargin: parent.height/20
                horizontalCenter: parent.horizontalCenter
            }
        }

        Rectangle{
            id: recAvata
            width: parent.height / 3
            height: parent.height / 3
            radius: height/2

            anchors{
                top: txtCalling.bottom
                topMargin: parent.width / 20
                horizontalCenter: parent.horizontalCenter
            }

            Image {
                id: imgAvata
                source: src
                width: parent.width
                height: parent.height
            }
        }

        Text {
            id: txtEmpName
            text: name
            font.pointSize: parent.height / 40
            color: "white"

            anchors{
                top: recAvata.bottom
                topMargin: parent.height/20
                horizontalCenter: parent.horizontalCenter
            }
        }
        ComboBox{
            id: colorCB
            model: colorModel
            editable: false
            onActivated: {
                recCalling.color = currentText
            }
            anchors {
                top: parent.bottom
                right: parent.right
            }
        }
        Settings{
            property alias colorCall: recCalling.color
        }
    }

}
