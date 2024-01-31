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
        background: white;
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
        background: white;
        Rectangle {
            id: welcomeText;
            height: win.height / 12;
            width: win.width * 9 / 10;
            anchors.horizontalCenter: parent.horizontalCenter;
            anchors.top: parent.top;
            anchors.topMargin: win.height / 4;
            Text {
                text: "Hello user, please, enter your name! 👋";
                font.pointSize: parent.height / 3;
                font.family: poppins.name
                anchors.horizontalCenter: parent.horizontalCenter;
            }
        }

        TextField {
            id : name;
            placeholderText: qsTr( "Enter your name" );
            anchors.horizontalCenter: parent.horizontalCenter;
            anchors.top: welcomeText.bottom;
            anchors.topMargin: win.height / 50;
            height: win.height / 15;
            width: win.width * 3 / 4;
        }

        Button {
            id : next;
            anchors.horizontalCenter: parent.horizontalCenter;
            anchors.top: name.bottom;
            anchors.topMargin: win.height / 25;
            height: win.height / 15
            width: win.width / 3
            Text {
                anchors.centerIn: parent
                text : "Confirm";
                color: "#FFFFFF"
                font.family: poppinsBold.name
                font.weight: 600
                font.pointSize: parent.height * 2 / 5
            }

            background:Rectangle {
                anchors.fill: next
                radius: next.height / 2
                gradient: Gradient {
                    orientation: Gradient.Horizontal;
                    GradientStop { position: 0.0; color : "#9DCEFF" }
                    GradientStop { position : 1.0; color : "#92A3FD" }
                }
            }
            onClicked: {
                app.nameWritten( name.text );
                num = 0;
                stackview.pop();
                headerText.text = "Welcome, " + name.text;
            }

        }

    }

    Page {
        id : nPage;
        anchors.fill: parent;
        visible: false;
        background: white;

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
                id: headerText
                text: "Welcome, " + app.takeName();
                font.family: poppinsBold.name;
                font.bold: true;
                anchors.verticalCenter: parent.verticalCenter;
                anchors.left: parent.left;
                anchors.leftMargin: win.width / 20;
            }
        }

        ColumnLayout {
            id: content
            spacing: 10
            anchors.top: header.bottom
            anchors.topMargin: win.height / 40;

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
                            font.pointSize: parent.width / 10
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
                                font.pointSize: parent.width / 5;
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
                                TIMER.start();
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

                Layout.preferredHeight: win.height * 3 / 10
                Layout.preferredWidth: win.width * 9 / 10
                Layout.topMargin: win.height / 45
                Layout.alignment: Qt.AlignHCenter
//                Layout.fillWidth: true

                Rectangle {
                    anchors.fill: parent
                    opacity: 0.2
                    radius: instructionBlock.height / 15
                    gradient: Gradient {
                        orientation: Gradient.Horizontal
                        GradientStop { position: 0.0; color : "#9DCEFF" }
                        GradientStop { position : 1.0; color : "#92A3FD" }
                    }
                }

                Rectangle {
                    id: needToKnow
                    color: "transparent"
                    width: parent.width * 8 / 10
                    height: parent.height / 2
                    anchors.top: parent.top
                    anchors.topMargin: parent.height / 10
                    anchors.horizontalCenter: parent.horizontalCenter
//                    anchors.verticalCenter: parent.verticalCenter
                    Text {
                        anchors.fill: parent
                        text: "Interesting and important facts you need to know"
                        width: parent.width
                        font.family: poppinsBold.name
                        horizontalAlignment: Text.AlignHCenter
                        font.pointSize: parent.height / 5
                        font.weight: 600
                        wrapMode: "WordWrap"
                    }
                }

                Rectangle {
                    color: "transparent"
                    width: parent.width * 6 / 10
                    height: parent.height / 5
                    anchors.top: needToKnow.bottom
                    anchors.topMargin: parent.height / 50
                    anchors.horizontalCenter: parent.horizontalCenter
//                    anchors.verticalCenter: parent.verticalCenter
                    Button {
                        id: instructionButton
                        anchors.centerIn: parent
                        width: parent.width
                        height: parent.height

                        Text {
                            anchors.centerIn: parent
                            text: "Check out"
                            color: "#FFFFFF"
                            font.family: poppinsBold.name
                            font.weight: 600
                            font.pointSize: parent.height * 2 / 5
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
                        onClicked: {
                            stackview.push( ipage1 );
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
                else {
                    stackview.pop( page1 );
                }
            }
            else {
                console.log( app.today() );
                num = num + 1;
                TIMER.start();
                stackview.replace( page3 );
            }
        }
//        onOnGoHomeButtomClicked: {
//            stackview.pop( nPage );
//        }

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
                TIMER.start();
                stackview.replace( page2 );
            }
        }
//        onOnGoHomeButtomClicked: {
//            stackview.pop( nPage );
//        }
    }

    InstructionPage {
        id: ipage1;
        text1:"Interesting fact about human eyes #1";
        text2: "Blue-eyed people share a common ancestor with every other blue-eyed person in the world.";
        num: 1;
        visible:false;
        link: "Resources/Inst1.png";
    }
    InstructionPage {
        id: ipage2;
        text1:"Interesting fact about human eyes #2";
        text2 : "You actually see with your brain, not your eyes. Our eyes function like a camera, capturing light and sending data back to the brain.";
        num: 2;
        visible:false;
        link: "Resources/Inst2.png";
    }
    InstructionPage {
        id: ipage3;
        text1:"Interesting fact about human eyes #3";
        text2: "You see things upside down - it is your brain which turns the image the right way up.";
        num: 3;
        visible:false;
        link: "Resources/InstFree.png";
    }
    InstructionPage {
        id: ipage4;
        text1:"Interesting fact about human eyes #4";
        text2: "The eye is the fastest muscle in your body";
        num: 4;
        visible:false;
        link: "Resources/Inst3.png";
    }
    InstructionPage {
        id: ipage5;
        text1:"Interesting fact about human eyes #5";
        text2: "A blink typically lasts 100-150 milliseconds. On average, you will blink approximately 4,200,000 times in a single year.";
        num: 5;
        visible:false;
        link: "Resources/InstFree.png";
    }
}
