import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.15

Item {
    ListModel{
        id: nameModel
        ListElement { text: "Name 1" ; phone: "08690000001"; src: "qrc:/image/woman-icon.png"; des: "Infomation System"}
        ListElement { text: "Name 2" ; phone: "08690000002"; src: "qrc:/image/emp-icon.png"; des: "Computer Network"}
        ListElement { text: "Name 3" ; phone: "08690000003"; src: "qrc:/image/man-glasses-icon.png"; des: "Computer Scient"}
        ListElement { text: "Name 4" ; phone: "08690000004"; src: "qrc:/image/man-icon.png"; des: "Infomation System"}
        ListElement { text: "Name 5" ; phone: "08690000005"; src: "qrc:/image/woman-icon.png"; des: "Infomation System"}
        ListElement { text: "Name 6" ; phone: "08690000006"; src: "qrc:/image/emp-icon.png"; des: "Infomation System"}
        ListElement { text: "Name 7" ; phone: "08690000007"; src: "qrc:/image/man-glasses-icon.png"; des: "Infomation System"}
        ListElement { text: "Name 8" ; phone: "08690000008"; src: "qrc:/image/man-icon.png"; des: "Infomation System"}
        ListElement { text: "Name 9" ; phone: "08690000009"; src: "qrc:/image/woman-icon.png"; des: "Infomation System"}
        ListElement { text: "Name 10" ; phone: "08690000010"; src: "qrc:/image/emp-icon.png"; des: "Infomation System"}
        ListElement { text: "Name 11" ; phone: "08690000011"; src: "qrc:/image/man-glasses-icon.png"; des: "Infomation System"}
        ListElement { text: "Name 12" ; phone: "08690000012"; src: "qrc:/image/man-icon.png"; des: "Infomation System"}
        ListElement { text: "Name 13" ; phone: "08690000013"; src: "qrc:/image/woman-icon.png"; des: "Infomation System"}
        ListElement { text: "Name 14" ; phone: "08690000014"; src: "qrc:/image/emp-icon.png"; des: "Infomation System"}
        ListElement { text: "Name 15" ; phone: "08690000015"; src: "qrc:/image/man-glasses-icon.png"; des: "Infomation System"}
        ListElement { text: "Name 16" ; phone: "08690000016"; src: "qrc:/image/man-icon.png"; des: "Infomation System"}
        ListElement { text: "Name 17" ; phone: "08690000017"; src: "qrc:/image/woman-icon.png"; des: "Infomation System"}
        ListElement { text: "Name 18" ; phone: "08690000018"; src: "qrc:/image/emp-icon.png"; des: "Infomation System"}
        ListElement { text: "Name 19" ; phone: "08690000019"; src: "qrc:/image/man-glasses-icon.png"; des: "Infomation System"}
        ListElement { text: "Name 20" ; phone: "08690000020"; src: "qrc:/image/man-icon.png"; des: "Infomation System"}
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
                        horizontalCenter: parent.horizontalCenter
                        bottom: parent.bottom

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

        model: nameModel
        delegate: empDelegate
    }
}
