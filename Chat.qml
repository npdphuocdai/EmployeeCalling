import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.15

Item {
    Rectangle{
        id: recChat
        anchors.fill: parent
        color: "lightblue"

        Rectangle{
            id: recTop
            height: parent.height / 10
            color: "lightblue"
            border.color: "black"
            border.width: height / 20

            anchors{
                top: parent.top
                left: parent.left
                right: parent.right
            }

            Text {
                id: txtEmpName
                text: qsTr("Nguyen Phuoc Dai")
                font.pointSize: parent.height / 5

                anchors{
                    centerIn: parent
                }
            }
        }

        Rectangle{
            id: recBot
            height: parent.height / 10
            color: "lightblue"
            border.color: "black"
            border.width: height / 20

            anchors{
                bottom: parent.bottom
                left: parent.left
                right: parent.right
            }

            TextInput{
                id: txtEdit
                text: focus ? "" : "Enter text...."
                font.pointSize: parent.height / 5
                color: focus ? "black" : "gray"

                anchors{
                    centerIn: parent
                }
            }
        }
    }
}
