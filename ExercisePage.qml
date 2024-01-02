import QtQuick
import QtQuick.Window
import QtQuick.Controls 2.0
import QtQuick.Layouts


Page {
    id: root;


    property alias exerID: giftext.text;
    signal onButtomClicked();

    background: Rectangle {
        color: "#FFFFFF";
    }

    Rectangle {
        anchors.top: parent.top
        anchors.topMargin: parent.height / 25
        anchors.horizontalCenter: parent.horizontalCenter
        height: parent.height / 10
        color: "transparent"
        id: header
        Text {
            id: headert1
            text: "This exercise is called"
            height: parent.height / 3
            anchors.top: parent.top
            anchors.horizontalCenter: parent.horizontalCenter
            font.family: poppins.name
            font.pointSize: headert1.height / 2
        }
        Text {
            id: exerciseName
            text: "Exercise name"
            height: parent.height * 2 / 3
            anchors.top: headert1.bottom
            anchors.topMargin: parent.height / 75
            anchors.horizontalCenter: parent.horizontalCenter
            font.family: poppinsBold.name
            font.weight: 600
            font.pointSize: exerciseName.height / 2
        }
    }

    Rectangle {
        id: gif
        width: parent.width * 8 / 10;
        height: width * 5 / 11;
        radius: 20;
        anchors.top: header.bottom
        anchors.topMargin: parent.height / 15
        anchors.horizontalCenter: parent.horizontalCenter;
        Text {
            id: giftext
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.verticalCenter: parent.verticalCenter
        }

        gradient: Gradient {
            orientation: Gradient.Horizontal;
            GradientStop { position: 0.0; color : "#92A3FD" }
            GradientStop { position : 1.0; color : "#9DCEFF" }
        }
    }

    Rectangle {
        id: timer
        anchors.top: gif.bottom
        anchors.topMargin: parent.height / 50
        anchors.horizontalCenter: parent.horizontalCenter
        height: parent.height / 10
        color: "transparent"
        RowLayout {
            anchors.top: parent.top
            anchors.horizontalCenter: parent.horizontalCenter
            height: parent.height
            Text {
                id: minutes
                text: "00"
                font.family: poppinsBold.name
                font.weight: 900
                font.pointSize: parent.height / 2
            }
            Text {
                text: ":"
                font.family: poppinsBold.name
                font.weight: 900
                font.pointSize: parent.height / 2
            }
            Text {
                id: seconds
                text: "00"
                font.family: poppinsBold.name
                font.weight: 900
                font.pointSize: parent.height / 2
            }
        }
    }

    Rectangle {
        id: buttons
        anchors.top: timer.bottom
        anchors.topMargin: parent.height / 30
        anchors.horizontalCenter: parent.horizontalCenter
        height: parent.height / 10
        width: parent.width * 7 / 10

        Button {
            id: pause
            anchors.bottom: parent.bottom
            anchors.left: parent.left
            height: parent.height * 5 / 7
            width: parent.height * 5 / 7

            background: Rectangle {
                anchors.fill: parent
                height: parent.height
                width: parent.width
                color: "#94A9FE"
                radius: 10
            }

            Image {
                id: pauseImage
                anchors.centerIn: parent
                height: parent.height / 2
                width: parent.width / 2
                source: "Resources/pause.png"
                fillMode: Image.PreserveAspectFit
            }

            onClicked:  {
                root.onButtomClicked();
            }
        }
        Button {
            id: restart
            anchors.top: parent.top
            anchors.horizontalCenter: parent.horizontalCenter
            height: parent.height * 5 / 7
            width: parent.height * 5 / 7

            background: Rectangle {
                anchors.fill: parent
                height: parent.height
                width: parent.width
                color: "#94A9FE"
                radius: 10
            }

            Image {
                id: restartImage
                anchors.centerIn: parent
                height: parent.height * 2 / 3
                width: parent.width * 2 / 3
                source: "Resources/restart.png"
                fillMode: Image.PreserveAspectFit
            }
        }

        Button {
            id: skip
            anchors.bottom: parent.bottom
            anchors.right: parent.right
            height: parent.height * 5 / 7
            width: parent.height * 5 / 7

            background: Rectangle {
                anchors.fill: parent
                height: parent.height
                width: parent.width
                color: "#94A9FE"
                radius: 10
            }

            Image {
                id: skipImage
                anchors.centerIn: parent
                height: parent.height * 2 / 3
                width: parent.width * 2 / 3
                source: "Resources/skip.png"
                fillMode: Image.PreserveAspectFit
            }
        }
    }

    Rectangle {
        id: goHome
        anchors.bottom: parent.bottom
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.bottomMargin: parent.height / 30
        height: parent.height / 10
        width: parent.width  * 9 / 10

        Button {
            id: goHomeButton
            anchors.fill: parent
            height: parent.height
            width: parent.width

            Text {
                anchors.centerIn: parent
                text: "Go To Home"
                color: "white"
                font.family: poppinsBold.name
                font.weight: 600
            }
            background: Rectangle {
                gradient: Gradient {
                    orientation: Gradient.Horizontal;
                    GradientStop { position: 0.0; color : "#92A3FD" }
                    GradientStop { position : 1.0; color : "#9DCEFF" }
                }
                radius: 25
            }
        }
    }

}
