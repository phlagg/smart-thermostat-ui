import QtQuick 2.15
import QtQuick.Controls 2.15

Rectangle {
    id: settingsScreen
    color: "black"
    anchors.fill: parent

    Image {
        id: backButton
        anchors {
            left: parent.left
            top: parent.top
            margins: 10
        }
        source: "qrc:/UI/Assets/previous.png"
        width: 40
        height: 40

        MouseArea {
            anchors.fill: parent
            onClicked: mainLoader.source = "qrc:/UI/HomeScreen/HomeScreen.qml"
        }
    }



    StackView {
        id: settingsStackView
        anchors.fill: parent
        initialItem: "SettingsMainMenu.qml"
    }
}
