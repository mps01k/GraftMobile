import QtQuick 2.9
import QtQuick.Layouts 1.3
import "../"
import "../components"

BaseBalanceScreen {
    splitterVisible: false
    graftWalletLogo: "qrc:/imgs/graft-pos-logo.png"
    screenHeader {
        navigationButtonState: Qt.platform.os === "ios" ? false : true
    }

    ColumnLayout {
        anchors.fill: parent
        spacing: 0

        Rectangle {
            Layout.fillHeight: true
            Layout.fillWidth: true
        }

        WideActionButton {
            text: qsTr("Transfer to Paypal")
        }

        WideActionButton {
            text: qsTr("Chase XXX929")
            Layout.bottomMargin: 15
        }
    }
}
