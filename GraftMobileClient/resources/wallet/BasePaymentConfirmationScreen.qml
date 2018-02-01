import QtQuick 2.9
import com.device.platform 1.0
import "../"
import "../components"

BaseScreen {
    id: root

    property var productModel

    title: qsTr("Pay")
    screenHeader {
        navigationButtonState: Detector.isPlatform(Platform.Android)
    }

    Connections {
        target: GraftClient

        onPayReceived: {
            if (result !== true) {
                pushScreen.openBalanceScreen()
            }
        }

        onPayStatusReceived: {
            if (result === true) {
                pushScreen.openPaymentScreen(result)
            }
        }
    }

    function confirmPay() {
        GraftClient.pay()
    }

    function cancelPay() {
        GraftClient.rejectPay()
        pushScreen.openBalanceScreen()
    }
}
