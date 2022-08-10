import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.15
Item {
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
                source: "qrc:/image/woman-icon.gif"
                anchors.fill: parent
            }
        }

        Text {
            id: txtEmpName
            text: qsTr("Le Thi Dung")
            font.pointSize: parent.height / 40

            anchors{
                top: recImgDetail.bottom
                topMargin: parent.height/100
                horizontalCenter: parent.horizontalCenter
            }
        }

        Text {
            id: txtEmpDes
            text: qsTr("IS")
            font.pointSize: parent.height / 40

            anchors{
                top: txtEmpName.bottom
                topMargin: parent.height/100
                horizontalCenter: parent.horizontalCenter
            }
        }

        Text {
            id: txtEmpPhone
            text: qsTr("0869054332")
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
        }
    }
}
