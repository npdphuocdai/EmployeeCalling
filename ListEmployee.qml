import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.15
import Qt.labs.settings 1.1

Item {
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
                    source: src
                    anchors.fill: parent
                    clip: true
                }
            }

            Text {
                id: txt
                text: name
                font.pointSize: parent.height/5
                anchors {
                    top: parent.top
                    topMargin: parent.height/10
                    left: recImg.right
                    leftMargin: parent.width/10
                }
            }
            Text {
                id: txtDes
                text: des
                font.pointSize: parent.height/5

                anchors {
                    left: recImg.right
                    top: txt.bottom
                    leftMargin: parent.width/10
                }
            }

            MouseArea {
                anchors.fill: parent
                onClicked: pop.visible ?  pop.close() : pop.open()
            }
            Popup {
                id: pop
                anchors.centerIn: Overlay.overlay
                width: root.width
                height: root.height

                EmployeeDetail{

                    anchors{
                        bottom: btn.top
                        top: parent.top
                        left: parent.left
                        right: parent.right
                    }
                }

                Button {
                    id: btn
                    anchors{
                        bottom: parent.bottom
                        left: parent.left
                    }
                    text: "Back"
                    MouseArea {
                        anchors.fill: parent
                        onClicked: pop.visible ?  pop.close() : pop.open()
                    }
                }
            }
        }
    }

    ListView{
        id: listEmployee
        anchors.fill: parent
        clip: true

        model: _model
        delegate: empDelegate
    }
}
