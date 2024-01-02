import QtQuick
import QtQuick.Window
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.12

Window {
    id : win
    visible: true

    property int num: 1;

    FontLoader {
        id: passionOne
        source: "Resources/PassionOne-Regular.ttf"
    }
    FontLoader {
        id: poppins
        source: "Resources/Poppins-Regular.ttf"
    }
    FontLoader {
        id: poppinsBold
        source: "Resources/Poppins-Bold.ttf"
    }
    FontLoader {
        id: inter
        source: "Resources/Inter-Regular.ttf"
    }
    FontLoader {
        id: poppinsSemiBold
        source: "Resources/Poppins-SemiBold.ttf"
    }

    StackView {
        id : stackview
        anchors.fill: parent
        initialItem: page1;
        visible: true;
    }

    FirstPage {
        id : page1
        visible: false
        onButtomClicked: {
            app.firstPageVisited();
            num = 0;
            if ( !app.isNameWritten() )
                stackview.push( namePage );
            else
                stackview.push( nPage );
            console.log( app.today() );
        }
    }

    Page {
        id : namePage;
        visible : false;
        TextField {
            id : name;
            placeholderText: qsTr( "Enter name" );
        }

        Button {
            id : next;
            text : "Next";
            anchors.bottom: parent.bottom;
            anchors.right: parent.right;

            onClicked: {
                app.nameWritten( name.text );
                num = 0;
                stackview.pop();
            }

        }

    }

    Page {
        id : nPage;
        anchors.fill: parent;
        visible: false;

        Button{
            id: settings;
            height : 50;
            width: 50;

            anchors.bottom: parent.bottom;
            anchors.left: parent.left;
            text: "Settings";

            onClicked: {
                stackview.push( namePage );
            }
        }

        Rectangle {
            id: header

            height: win.height / 20
            width: win.width
            anchors.top: parent.top
            anchors.left: parent.left

            Text {
                text: "Welcome"
                font.family: poppinsBold.name
                font.bold: true
                anchors.verticalCenter: parent.verticalCenter
                anchors.left: parent.left
                anchors.leftMargin: win.width / 20
            }
        }

        ColumnLayout {
            id: content
            spacing: 0
            anchors.top: header.bottom

            Rectangle {
                id: monyear
                Layout.preferredHeight: win.height / 20
                Layout.preferredWidth: win.width
                Layout.alignment: Qt.AlignHCenter
                Layout.topMargin: 0
                Layout.fillWidth: true
                Text {
                    text: "May 2022"
                    font.family: poppins.name
                    color: "#ADA4A5"
                    anchors.horizontalCenter: parent.horizontalCenter
                    anchors.verticalCenter: parent.verticalCenter
                }
            }

            RowLayout {
                id: dates
                Layout.preferredHeight: win.height / 8
                Layout.preferredWidth: win.width
                Layout.topMargin: 0
                Layout.alignment: Qt.AlignHCenter
                Layout.fillWidth: true
                spacing: 0;
                Calendar {
                    color : "#F7F8F8";
                    day: app.day(app.yesterday( app.today(), 3 ) );
                    week : app.dayToWeek( app.weekday( app.yesterday( app.today(), 3 ) ) );
                    dcolor: "#7B6F72"
                    wcolor: "#7B6F72"
                    Layout.alignment: Qt.AlignVCenter
                    Layout.fillHeight: true
                    Layout.fillWidth: true

                    Layout.leftMargin: win.width / 40
                    Layout.rightMargin: win.width / 40
                }
                Calendar {
                    color : "#F7F8F8";
                    day: app.day(app.yesterday( app.today(), 2 ) );
                    week : app.dayToWeek( app.weekday( app.yesterday( app.today(), 2 ) ) );
                    dcolor: "#7B6F72"
                    wcolor: "#7B6F72"
                    Layout.alignment: Qt.AlignVCenter
                    Layout.fillHeight: true
                    Layout.fillWidth: true

                    Layout.leftMargin: win.width / 40
                    Layout.rightMargin: win.width / 40
                }
                Calendar {
                    color : "#F7F8F8";
                    day: app.day( app.yesterday(  app.today(), 1 ) );
                    week : app.dayToWeek( app.weekday( app.yesterday(  app.today(), 1 ) ) );
                    dcolor: "#7B6F72"
                    wcolor: "#7B6F72"
                    Layout.alignment: Qt.AlignVCenter
                    Layout.fillHeight: true
                    Layout.fillWidth: true

                    Layout.leftMargin: win.width / 40
                    Layout.rightMargin: win.width / 40
                }
                Calendar {
                    gradient: Gradient {
                        orientation: Gradient.Horizontal;
                        GradientStop { position: 0.0; color : "#9DCEFF" }
                        GradientStop { position : 1.0; color : "#92A3FD" }
                    }

                    day: app.day( app.today() );
                    week : app.dayToWeek( app.weekday( app.today() ) );
                    dcolor: "#FFFFFF"
                    wcolor: "#FFFFFF"
                    Layout.alignment: Qt.AlignVCenter
                    Layout.fillHeight: true
                    Layout.fillWidth: true

                    Layout.leftMargin: win.width / 40
                    Layout.rightMargin: win.width / 40
                }
                Calendar {
                    color : "#F7F8F8";
                    day: app.day( app.yesterday( app.today(), -1 ) );
                    week : app.dayToWeek( app.weekday( app.yesterday( app.today(), -1 ) ) );
                    dcolor: "#7B6F72"
                    wcolor: "#7B6F72"
                    Layout.alignment: Qt.AlignVCenter
                    Layout.fillHeight: true
                    Layout.fillWidth: true

                    Layout.leftMargin: win.width / 40
                    Layout.rightMargin: win.width / 40
                }
            }

            Rectangle {
                id: startBlock
                Layout.preferredHeight: win.height / 4
                Layout.preferredWidth: win.width * 8 / 10
                Layout.topMargin: win.height / 50
                Layout.alignment: Qt.AlignHCenter
                Layout.fillWidth: true

                Image {
                    id: back1
                    height: parent.height
                    width: parent.width

                    anchors.top: parent.top
                    anchors.left: parent.left
                    anchors.leftMargin: win.width / 20
                    anchors.rightMargin: win.width / 20
                    anchors.right: parent.right
                    anchors.horizontalCenter: parent.horizontalCenter
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.fill: parent
                    fillMode: Image.PreserveAspectFit
                    source: "Resources/ba.png"
                }

                RowLayout {
                    id: rL1
                    height: parent.height
                    width: parent.width
                    Layout.alignment: Qt.AlignHCenter
                    anchors.left: parent.left
                    anchors.right: parent.right
                    anchors.top: parent.top
                    anchors.leftMargin: win.width / 10
                    anchors.rightMargin: win.width / 10
                    anchors.horizontalCenter: parent.horizontalCenter
                    anchors.verticalCenter: parent.verticalCenter
                    spacing: 0

                    ColumnLayout {
                        id: cL1
                        Layout.alignment: Qt.AlignVCenter
                        height: parent.height * 3 / 10
                        width: parent.width * 2 / 3
                        Layout.fillWidth: true
                        spacing: 0

                        Text {
                            id: today
                            Layout.alignment: Qt.AlignLeft
                            width: parent.width
                            anchors.left: parent.left
                            anchors.leftMargin: parent.width / 10
                            text: "Today's exercises"
                            font.family: poppinsSemiBold.name
                            font.weight: 600
                            color: "#FFFFFF"
                            font.pointSize: parent.width / 11
                        }
                        Text {
                            id: complete
                            Layout.alignment: Qt.AlignLeft
                            Layout.topMargin: parent.height / 15
                            width: parent.width
                            anchors.left: parent.left
                            anchors.leftMargin: parent.width / 10
                            text: "Complete ..."
                            font.family: poppins.name
                            color: "#FFFFFF"
                            font.pointSize: parent.width / 12
                        }

                        Button {
                            id: startButton
                            Layout.alignment: Qt.AlignLeft
                            Layout.topMargin: parent.height / 6
                            height: parent.height / 2
                            Layout.fillWidth: true
                            anchors.left: parent.left
                            anchors.right: parent.right
                            anchors.leftMargin: parent.width / 10
                            anchors.rightMargin: parent.width * 2 / 5
                            Text {
                                anchors.horizontalCenter: parent.horizontalCenter
                                anchors.verticalCenter: parent.verticalCenter
                                text: "Start"
                                color: "#FFFFFF"
                                font.family: poppinsSemiBold.name
                                font.weight: 600
                                font.pointSize: parent.width / 10;
                            }

                            background: Rectangle {
                                anchors.fill: startButton
                                radius: startButton.height / 2
                                height: startButton.height
                                width: startButton.width
                                gradient: Gradient {
                                    orientation: Gradient.Horizontal;
                                    GradientStop { position: 0.0; color : "#EEA4CE" }
                                    GradientStop { position : 1.0; color : "#C58BF2" }
                                }
                            }
                            onClicked: {
                                num = 0;
                                stackview.push( page2 );
                            }
                        }
                    }
                    Rectangle {
                        id: cL2
                        Layout.alignment: Qt.AlignVCenter
                        Layout.preferredHeight: parent.height
                        Layout.preferredWidth: parent.width / 3
                        Layout.fillWidth: true
                        color: "transparent"

                        Image {
                            id: eye
                            source: "Resources/eye.png"
                            anchors.horizontalCenter: parent.horizontalCenter
                            anchors.verticalCenter: parent.verticalCenter
                            anchors.left: parent.left
                            anchors.right: parent.right
                            anchors.leftMargin: parent.width / 10
                            anchors.rightMargin: parent.width / 10
                            fillMode: Image.PreserveAspectFit

                            height: parent.height
                            width: parent.width
                        }
                    }
                }
            }

            Rectangle {
                id: instructionBlock

                Layout.preferredHeight: win.height / 10
                Layout.preferredWidth: win.width * 9 / 10
                Layout.topMargin: win.height / 50
                Layout.alignment: Qt.AlignHCenter
//                Layout.fillWidth: true

                Rectangle {
                    anchors.fill: parent
                    opacity: 0.2
                    radius: instructionBlock.height / 5
                    gradient: Gradient {
                        orientation: Gradient.Horizontal
                        GradientStop { position: 0.0; color : "#9DCEFF" }
                        GradientStop { position : 1.0; color : "#92A3FD" }
                    }
                }

                Rectangle {
                    color: "transparent"
                    width: parent.width * 4 / 10
                    height: parent.height * 2 / 3
                    anchors.left: parent.left
                    anchors.top: parent.top
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.leftMargin: parent.width / 20
                    Text {
                        text: "Need to know!"
                        font.family: poppins.name
                        anchors.centerIn: parent
                        font.pointSize: parent.height * 3 / 13
                    }
                }

                Rectangle {
                    color: "transparent"
                    width: parent.width * 3 / 10
                    height: parent.height * 2 / 3
                    anchors.right: parent.right
                    anchors.top: parent.top
                    anchors.bottom: parent.bottom
                    anchors.topMargin: parent.height / 6
                    anchors.bottomMargin: parent.height / 6
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.rightMargin: parent.width / 20
                    Button {
                        id: instructionButton
                        anchors.centerIn: parent
                        width: parent.width
                        height: parent.height

                        Text {
                            anchors.centerIn: parent
                            text: "Check"
                            color: "#FFFFFF"
                            font.family: poppins.name
                            font.pointSize: parent.height / 4
                        }

                        background: Rectangle {
                            anchors.fill: instructionButton
                            radius: instructionButton.height / 2
                            height: instructionButton.height
                            width: instructionButton.width
                            gradient: Gradient {
                                orientation: Gradient.Horizontal;
                                GradientStop { position: 0.0; color : "#9DCEFF" }
                                GradientStop { position : 1.0; color : "#92A3FD" }
                            }
                        }
                    }
                }
            }
        }
    }

    ExercisePage {
        id: page2;
        visible: false;
        exerID: app.pos( num );

        onOnButtomClicked: {
            if ( num === app.sz() - 1 ) {
                if ( app.isFirstPageVisited() )
                    stackview.pop( nPage );
                else
                    stackview.pop( page1 );
            }
            else {
                console.log( app.today() );
                num = num + 1;
                stackview.replace( page3 );
            }
        }

    }

    ExercisePage {
        id: page3;
        visible: false;
        exerID: app.pos( num );

        onOnButtomClicked: {
            if ( num === app.sz() - 1 ) {
                if ( app.isFirstPageVisited() )
                    stackview.pop( nPage );
                else
                    stackview.pop( page1 );
            }
            else {
                num = num + 1;
                stackview.replace( page2 );
            }
        }

    }


}
