import QtQuick 2.15

Rectangle {
    id: heatSelectDialog
    signal destroyMe()
    anchors.fill: parent
    color: Qt.rgba (0, 0, 0, 0)

    MouseArea {
        anchors.fill: parent
        onClicked: heatSelectDialog.destroyMe()
    }

    Rectangle {
        id: innerRectangle
        radius: 10
        width: parent.width /2
        height: parent.height * 0.8
        anchors.centerIn: parent
        color: "black"
        border.color: "white"
        border.width: 3
    }



    ListModel{
        id: heatModel
        ListElement { controlText: "Heat" }
        ListElement { controlText: "Cool" }
        ListElement { controlText: "Auto" }

    }

    ListView {
        id: heatListView
        anchors.fill: innerRectangle
        model: heatModel
        delegate: Rectangle {
            width: innerRectangle.width
            height: innerRectangle.height / 3
            color: "black"
            border.color: "white"
            border.width: 4
            radius: 10
            Text {
                anchors.centerIn: parent
                color: "white"
                font.pixelSize: 42
                text: controlText
            }
            MouseArea {
                anchors.fill: parent
                onClicked: {
                    if (controlText ==="Heat")
                        systemController.setSystemState(0)
                    else if (controlText ==="Cool")
                        systemController.setSystemState(1)
                    else if (controlText ==="Auto")
                        systemController.setSystemState(2)

                    heatSelectDialog.destroyMe()
                }
            }

        }
    }


}
