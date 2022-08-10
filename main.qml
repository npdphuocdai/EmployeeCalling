import QtQuick 2.15
import QtQuick.Controls 2.15

ApplicationWindow {
    id: root
    width: height/1.5
    height: 600
    visible: true
    title: qsTr("Employee List")
    StackView {
        id: stackview
        anchors.fill: parent
        initialItem: "qrc:/ListEmployee.qml"
    }
}
