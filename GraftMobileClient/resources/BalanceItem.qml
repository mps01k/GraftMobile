import QtQuick 2.9
import QtQuick.Layouts 1.3
import com.graft.design 1.0

Rectangle {
    property real amountMoneyCost: amountMoneyText
    property alias amountGraftCost: amountGraftText.text

    height: 70
    anchors {
        left: parent.left
        right: parent.right
        leftMargin: 12
        rightMargin: 12
        top: parent.top
    }

    Text {
        text: qsTr("Balance:")
        color: "#233146"
        font.pointSize: 20
        anchors {
            left: parent.left
            verticalCenter: parent.verticalCenter
        }
    }

    RowLayout {
        anchors {
            right: parent.right
            verticalCenter: parent.verticalCenter
        }

        ColumnLayout {
            spacing: 0
            Layout.alignment: Qt.AlignRight

            Text {
                id: amountGraftText
                color: "#404040"
                font {
                    bold: true
                    pointSize: 21
                }
            }

            Text {
                id: amountMoneyText
                text: amountMoney + " USD"
                color: "#b39036"
                font.pointSize: 12
            }
        }

        Image {
            Layout.preferredHeight: 30
            Layout.preferredWidth: 34
            Layout.alignment: Qt.AlignRight
            source: "qrc:/imgs/g-max.png"
        }
    }
}
