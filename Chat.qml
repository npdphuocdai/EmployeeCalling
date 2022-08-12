import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.15
import Qt.labs.settings 1.1

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
            Rectangle{
                id: recAvatar
                width: parent.height / 1.5
                height: parent.height / 1.5
                radius: height/2

                anchors{
                    left: parent.left
                    leftMargin: parent.width / 30
                    verticalCenter: parent.verticalCenter
                }

                Image {
                    id: imgAvatar
                    source: src
                    width: parent.width
                    height: parent.height
                }
            }

            Text {
                id: txtEmpName
                text: name
                font.pointSize: parent.height / 5

                anchors{
                    left: recAvatar.right
                    leftMargin: parent.width / 30
                    verticalCenter: parent.verticalCenter
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
        ComboBox{
            id: colorCB
            model: colorModel
            editable: false
            onActivated: {
                recChat.color = currentText
                recTop.color = currentText
                recBot.color = currentText
            }
            anchors {
                top: parent.bottom
                right: parent.right
            }
        }
        Settings{
            property alias colorChat: recChat.color
            property alias colorTop: recTop.color
            property alias colorBot: recBot.color
        }
    }
}
