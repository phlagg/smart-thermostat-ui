import QtQuick 2.15

Item {
    ListModel{
        id:settingsMainMenuListModel
        ListElement { menuText:"Temperature Units";iconSource:"qrc:/UI/Assets/thermometer.png" }
        ListElement { menuText:"Schedule";iconSource:"qrc:/UI/Assets/calendar.png" }
        ListElement { menuText:"WiFi Settings";iconSource:"qrc:/UI/Assets/wifi.png" }
        ListElement { menuText:"About";iconSource:"qrc:/UI/Assets/info-button.png" }
    }

    Rectangle {
        id: stackViewBackground
        width: parent.width * 0.7
        height: parent.height * 0.7
        anchors.centerIn: parent
        color: "black"
        border.width: 3
        border.color: "white"
        radius: 15
    }

    ListView {
        id: settingsListView
        anchors.fill: stackViewBackground
        model: settingsMainMenuListModel
        interactive: false
        delegate: Rectangle {
            width: settingsListView.width
            height: settingsListView.height / 4
            color: "black"
            border.color: "white"
            border.width: 4
            radius: 10
            Image {
                id: iconImage
                anchors {
                    verticalCenter: parent.verticalCenter
                    left: parent.left
                    leftMargin: 30
                }

                width: 48
                height: 48
                source: iconSource
            }
            Text {
                anchors {
                    verticalCenter: iconImage.verticalCenter
                    left: iconImage.right
                    leftMargin: 40
                }

                color: "white"
                font.pixelSize: 30
                text: menuText
            }

            MouseArea {
                anchors.fill: parent
                onClicked: {

                }
            }

        }
    }
}
