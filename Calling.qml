import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.15

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
                source: model.src
                width: parent.width
                height: parent.height
            }
        }

        Text {
            id: txtEmpName
            text: model.text
            font.pointSize: parent.height / 20
            color: "white"

            anchors{
                top: recAvata.bottom
                topMargin: parent.height/20
                horizontalCenter: parent.horizontalCenter
            }
        }
    }

}
