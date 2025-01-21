import QtQuick 2.15
import QtQuick.Controls 2.15

Slider {
    id: temperatureControlSlider
    from: 10
    to: 30
    stepSize: 0.5
    orientation: Qt.Vertical
    onValueChanged: systemController.setTargetTemp (value)
    background: Rectangle {
        height: parent.height
        width: 3
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.bottom: parent.bottom
        anchors.top: parent.top
        anchors.bottomMargin: 0
    }

    handle: Rectangle {
        y: temperatureControlSlider.visualPosition * (temperatureControlSlider.availableHeight - height)
        implicitWidth: 76
        implicitHeight: 76
        radius: width/2
        color: "black"
        border.color: "white"
        border.width: 3
        anchors.horizontalCenter: parent.horizontalCenter

        Text {
            anchors.centerIn: parent
            color:"white"
            font.pixelSize: 30
            text: temperatureControlSlider.value
        }
    }

}
