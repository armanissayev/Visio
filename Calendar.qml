import QtQuick
import QtQuick.Window
import QtQuick.Controls 2.0
import QtQuick.Layouts

Rectangle {
    property int day;
    property string week;
    property alias dcolor: dtext.color
    property alias wcolor: wtext.color

    id: cal;

    width: win.width / 8;
    height: win.height / 7;

    radius: height / 7;

    Text {
        id: dtext
        text : day;
        anchors.horizontalCenter: cal.horizontalCenter
        anchors.top: cal.verticalCenter;
        anchors.topMargin: cal.height / 16;
        font.family: inter.name
    }

    Text {
        id: wtext
        text : week;
        anchors.horizontalCenter: cal.horizontalCenter
        anchors.bottom: cal.verticalCenter;
        anchors.bottomMargin: cal.height / 16;
        font.family: inter.name
    }

}
