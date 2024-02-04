import QtQuick
import QtQuick.Window
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.12

Page {
    id: page;
    height: parent.height;
    width: parent.width;
    property string text1;
    property string text2;
    property string link;
    property int num;
    signal onButtonClicked();
    background: white;

    Rectangle {
        id: png;
        anchors.top: parent.top;
        anchors.left: parent.left;
        width: parent.width;
        height: parent.height * 58 / 100;
        Image {
            id: upper_part;
            anchors.top: parent.top;
            anchors.left: parent.left;
            anchors.topMargin: parent.height / -20;
            height:parent.height;
            width: parent.width;
            source: link;
            fillMode: Image.Stretch
        }
    }

    Rectangle {
        anchors.top: png.bottom;
        width: parent.width * 8 / 10;
        height: parent.height / 4;
        anchors.horizontalCenter: parent.horizontalCenter;

        Rectangle {
            id: txt;
            width: parent.width;
            height: parent.height * 3 / 10;
            anchors.top: parent.top;
            anchors.left: parent.left;
            Text {
                width: parent.width * 3 / 4;
                height: parent.height;
                text: text1;
                anchors.top: parent.top;
                wrapMode: "WordWrap"
                font.family: poppinsBold.name;
                font.weight: 600;
                font.pointSize: page.width / 25;
            }
        }

        Rectangle {
            id: txt2;
            width: parent.width;
            height: parent.height * 6 / 10;
            anchors.top: txt.bottom;
            anchors.topMargin: parent.height / 10;
            anchors.left: parent.left;
            Text {
                width: parent.width
                height: parent.height
                text: text2;
                anchors.top: parent.horizontalCenter;
                wrapMode: "WordWrap"
                font.family: poppins.name;
            }
        }
    }
    Button {
        id: ibutton;
        anchors.bottom: parent.bottom;
        anchors.right: parent.right;
        height: parent.height / 12;
        width: parent.height / 12;
        anchors.bottomMargin: parent.height / 40; //30
        anchors.rightMargin: parent.height / 40; //30

        background: Rectangle {
            anchors.fill: parent
            height: parent.height
            width: parent.width
            color: "#94A9FE"
            radius: page.height / 2;
        }

        Image {
            id: skipImage
            anchors.centerIn: parent
            height: parent.height / 2
            width: parent.width / 2
            source: "Resources/skip.png"
            fillMode: Image.PreserveAspectFit
        }

        onClicked: {
            switch( num ) {
                case 1:
                    stackview.push( ipage2 );
                    break;
                case 2:
                    stackview.push( ipage3 );
                    break;
                case 3:
                    stackview.push( ipage4 );
                    break;
                case 4:
                    stackview.push( ipage5 );
                    break;
                case 5:
                    stackview.pop( nPage );
                    break;
            }
        }

    }
}
