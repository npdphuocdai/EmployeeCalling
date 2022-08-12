import QtQuick 2.15
import QtQuick.Controls 2.15
import Qt.labs.settings 1.1

ApplicationWindow {
    id: root
    width: height/1.5
    onWidthChanged: width = height/1.5
    height: 600
    onHeightChanged: width = height/1.5
    visible: true
    title: qsTr("Employee List")
    ListEmployee{
        anchors.fill: parent
    }
    Settings{
        property alias x: root.x
        property alias y: root.y
        property alias width: root.width
        property alias height: root.height
    }
}
