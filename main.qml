import QtQuick 2.15
import QtQuick.Window 2.15
import Phlagg 1.0

Window {
    width: 640
    height: 480
    visible: true
    title: qsTr("Smart Thermostat")

    SystemController {
        id: systemController
    }

    Loader{
        id: mainLoader
        anchors.fill: parent
        source: "./UI/HomeScreen/HomeScreen.qml"

    }
}
