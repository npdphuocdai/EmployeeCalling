import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.15
import Qt.labs.settings 1.1

Item {
    ListModel{
        id: colorModel
        ListElement {text: "yellow"}
        ListElement {text: "lightblue"}
        ListElement {text: "lightgreen"}
        ListElement {text: "lightpink"}
    }

    Rectangle{
        id: recDetail
        anchors.fill: parent
        color: "yellow"
        Rectangle{
            id: recImgDetail
            width: parent.height / 5
            height: parent.height / 5
            radius: height/2
            border.color: "black"
            color: "blue"
            clip: true

            anchors {
                horizontalCenter: parent.horizontalCenter
                top: parent.top
                topMargin: parent.height /20
            }
            Image {
                id: imgDetail
                source: model.src
                anchors.fill: parent
            }
        }

        Text {
            id: txtEmpName
            text: model.text
            font.pointSize: parent.height / 40

            anchors{
                top: recImgDetail.bottom
                topMargin: parent.height/100
                horizontalCenter: parent.horizontalCenter
            }
        }

        Text {
            id: txtEmpDes
            text: model.des
            font.pointSize: parent.height / 40

            anchors{
                top: txtEmpName.bottom
                topMargin: parent.height/100
                horizontalCenter: parent.horizontalCenter
            }
        }

        Text {
            id: txtEmpPhone
            text: model.phone
            font.pointSize: parent.height / 40

            anchors{
                top: txtEmpDes.bottom
                topMargin: parent.height/100
                horizontalCenter: parent.horizontalCenter
            }
        }

        Rectangle{
            id: recCall
            width: parent.height / 8
            height: parent.height / 8
            radius: height/2

            anchors{
                left: parent.left
                leftMargin: parent.width / 10
                verticalCenter: parent.verticalCenter
            }

            Image {
                id: imgCall
                source: "qrc:/image/call-icon.png"
                width: parent.width
                height: parent.height
            }

            MouseArea {
                anchors.fill: parent
                onClicked: popCall.visible ?  popCall.close() : popCall.open()
            }
            Popup {
                id: popCall
                anchors.centerIn: Overlay.overlay
                width: root.width
                height: root.height

                Calling{
                    anchors{
                        bottom: btnCall.top
                        top: parent.top
                        left: parent.left
                        right: parent.right
                    }
                }

                Button {
                    id: btnCall
                    anchors{
                        left: parent.left
                        bottom: parent.bottom

                    }
                    text: "Back"
                    MouseArea {
                        anchors.fill: parent
                        onClicked: popCall.visible ?  popCall.close() : popCall.open()
                    }
                }
            }
        }
        Rectangle{
            id: recChat
            width: parent.height / 8
            height: parent.height / 8
            radius: height/2

            anchors{
                right: parent.right
                rightMargin: parent.width / 10
                verticalCenter: parent.verticalCenter
            }

            Image {
                id: imgChat
                source: "qrc:/image/chat-icon.png"
                width: parent.width
                height: parent.height
            }

            MouseArea {
                anchors.fill: parent
                onClicked: popChat.visible ?  popChat.close() : popChat.open()
            }
            Popup {
                id: popChat
                anchors.centerIn: Overlay.overlay
                width: root.width
                height: root.height

                Chat{
                    anchors{
                        bottom: btnChat.top
                        top: parent.top
                        left: parent.left
                        right: parent.right
                    }
                }

                Button {
                    id: btnChat
                    anchors{
                        bottom: parent.bottom
                        left: parent.left
                    }
                    text: "Back"
                    MouseArea {
                        anchors.fill: parent
                        onClicked: popChat.visible ?  popChat.close() : popChat.open()
                    }
                }
            }
        }
        ComboBox{
            id: colorCB
            model: colorModel
            editable: false
            onActivated: {
                recDetail.color = currentText
            }
            anchors {
                top: parent.bottom
                right: parent.right
            }
        }
        Settings{
            property alias colorDetail: recDetail.color
        }
    }
}
