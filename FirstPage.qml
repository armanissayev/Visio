import QtQuick
import QtQuick.Window
import QtQuick.Controls
import QtQuick.Shapes


Page {

    id: firstPage

    signal buttomClicked();

    background: Rectangle {
        color: "#FFFFFF";
    }

    Rectangle {
        id: welcomeBlock
        width: win.width * 0.8
        height: win.height * 0.5

        x: win.width * 0.5 - welcomeBlock.width * 0.5
        y: win.height * 0.35 - welcomeBlock.height * 0.5

        Item {
            id: logoVisio

            anchors.horizontalCenter: parent.horizontalCenter
            anchors.top: parent.top

            Image {
                id: logo
                source: "Resources/Logo.png"
                anchors.horizontalCenter: parent.horizontalCenter

                height: welcomeBlock.height * 0.65
                width: logo.height * 303 / 230
            }
        }

        Item {
            id: welcomeVisio


            anchors.horizontalCenter: parent.horizontalCenter
            anchors.top: parent.top
            anchors.topMargin: parent.height * 0.65

            Text {
                id: visio
                text: "Visio"
                font.pointSize: 40 + welcomeBlock.height / 50
                font.family: passionOne.name

                anchors.horizontalCenter: parent.horizontalCenter
                color: "#92A3FD"

            }
        }

        Item {
            id: welcomeText

            anchors.horizontalCenter: parent.horizontalCenter
            anchors.top: parent.top
            anchors.topMargin: parent.height * 0.80

            Text {
                text: "Take care of your vision"
                font.pointSize: 12 + welcomeBlock.height / 100
                font.family: poppins.name

                anchors.top: parent.top
                anchors.horizontalCenter: parent.horizontalCenter
                color: "#7B6F72"
            }
        }
    }

    Button {
        id: getStarted;
        text: "Get Started";
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.bottom: parent.bottom
        anchors.bottomMargin: win.height * 0.05
        contentItem: Text {
            text : getStarted.text
            font.family: poppinsBold.name
            font.bold: true
            color: "#ffffff";
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
        }

        onClicked:  {
            firstPage.buttomClicked();
        }

        background: Rectangle {
            implicitWidth: win.width * 0.8
            implicitHeight: win.height * 0.10
            radius: win.height * 0.3 / 2
            gradient: Gradient {
                orientation: Gradient.Horizontal
                GradientStop{
                    position: 0.0
                    color: "#9dceff"
                }
                GradientStop{
                    position: 1.0
                    color: "#92a3fd"
                }
            }
        }
    }
}
