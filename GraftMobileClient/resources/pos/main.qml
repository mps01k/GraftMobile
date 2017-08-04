import QtQuick 2.7
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.3

ApplicationWindow {
    visible: true
    width: 320
    height: 480
    title: qsTr("POS")
    Loader {
        source:"firstpage.qml";
        anchors.fill: parent
    }
}
