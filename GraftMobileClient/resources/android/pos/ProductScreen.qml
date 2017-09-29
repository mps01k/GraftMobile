import QtQuick 2.9
import QtQuick.Layouts 1.3
import QtQuick.Controls 2.2
import QtGraphicalEffects 1.0
import QtQuick.Controls.Material 2.2
import com.graft.design 1.0
import "../components"
import "../"

BaseScreen {
    id: mainScreen
    title: qsTr("Store")
    screenHeader {
        cartEnable: true
        navigationButtonState: true
    }

    Connections {
        target: GraftClient
        onSaleReceived: {
            if (result === true) {
                pushScreen.initializingCheckout()
            }
        }
    }

    Connections {
        target: ProductModel
        onSelectedProductCountChanged: {
            mainScreen.screenHeader.selectedProductCount = count
        }
    }

    ColumnLayout {
        anchors.fill: parent

        Rectangle {
            Layout.fillWidth: true
            Layout.fillHeight: true
            Layout.bottomMargin: 80
            color: "red"/*"#e9e9e9"*/

            ListView {
                id: productList
                spacing: 0
                clip: true
                model: ProductModel
                delegate: productDelegate


                Component {
                    id: productDelegate
                    ProductSwipeDelegate {
                        width: productList.width
                        height: 60
                        selectState: selected
                        bottomLineVisible: false
                        topLineVisible: false
                        productImage: imagePath
                        productPrice: cost
                        productPriceTextColor: ColorFactory.color(DesignFactory.ItemText)
                        productText {
                            text: name
                            color: ColorFactory.color(DesignFactory.MainText)
                        }
                    }
                }
            }
        }

        WideActionButton {
            id: addButton
            text: qsTr("Checkout")
            anchors {
                top: productList.bottom
                topMargin: 5
            }
            onClicked: GraftClient.sale()
        }

        RoundButton {
            padding: 20
            highlighted: true
            Material.elevation: 4
            Material.accent: ColorFactory.color(DesignFactory.CircleBackground)
            Layout.preferredHeight: addButton.height * 1.4
            Layout.preferredWidth: height
            Layout.alignment: Qt.AlignRight
            Layout.rightMargin: 10
            Layout.bottomMargin: 10
            text: {
                font.pointSize = 16
                font.bold = true
                qsTr("+")
            }
            onClicked: pushScreen.openAddScreen()
        }
    }
}
