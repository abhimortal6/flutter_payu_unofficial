import Flutter
import UIKit
import PlugNPlay


enum FluterChannels {
    static let methods = "flutterPayu"
}

enum FluterMethods {
    static let intiatePayment = "initiatePayment"

}

public class SwiftPayuUnofficialPlugin: NSObject, FlutterPlugin {
    public static func register(with registrar: FlutterPluginRegistrar) {
        let channel = FlutterMethodChannel(name: "flutterPayu", binaryMessenger: registrar.messenger())
        let instance = SwiftPayuUnofficialPlugin()
        registrar.addMethodCallDelegate(instance, channel: channel)
    }

    public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {

        switch (call.method) {
        case FluterMethods.intiatePayment:
            self.initiatePayment(result: result, args: call.arguments)
            break;

        default:
            result(FlutterMethodNotImplemented)
        }
    }

    func initiatePayment(result: @escaping FlutterResult, args: Any?) {




        let argsMap = args as! NSDictionary


        let txnParam = PUMTxnParam()

        let disableCompletionScreen = argsMap["showCompletionScreen"]  as! Bool


    PlugNPlay.setDisableCompletionScreen(!disableCompletionScreen)



        txnParam.phone = argsMap["phone"] as? String

        txnParam.email = argsMap["email"]  as? String

        txnParam.amount = argsMap["amount"] as? String

        txnParam.environment = argsMap["isDebug"]  as? Bool ?? false ?  PUMEnvironment.test : PUMEnvironment.production

        txnParam.firstname = argsMap["firstName"] as? String

        txnParam.key = argsMap["merchantKey"] as? String

        txnParam.merchantid = argsMap["merchantID"] as? String

        txnParam.txnID = argsMap["transactionID"] as? String

        txnParam.surl = argsMap["sURL"] as? String

        txnParam.furl = argsMap["fURL"] as? String

        txnParam.productInfo = argsMap["productName"] as? String

        txnParam.udf1 = argsMap["udf1"] as? String

        txnParam.udf2 = argsMap["udf2"] as? String

        txnParam.udf3 = argsMap["udf3"] as? String

        txnParam.udf4 = argsMap["udf4"] as? String

        txnParam.udf5 = argsMap["udf5"] as? String

        txnParam.udf6 = argsMap["udf6"] as? String

        txnParam.udf7 = argsMap["udf7"] as? String

        txnParam.udf8 = argsMap["udf8"] as? String

        txnParam.udf9 = argsMap["udf9"] as? String

        txnParam.udf10 = argsMap["udf10"] as? String


        txnParam.hashValue = argsMap["hash"] as? String


        PlugNPlay.presentPaymentViewController(withTxnParams: txnParam, on:UIApplication.getTopViewController() ) { (response, error, extraParam) in

            if(response == nil){
                let map:[String:Any] = ["result": ["status":"cancelled"]]
                result(map);


            }else{
                result(response);

            }



        }

    }
}

extension UIApplication {

    class func getTopViewController(base: UIViewController? = UIApplication.shared.keyWindow?.rootViewController) -> UIViewController? {

        if let nav = base as? UINavigationController {
            return getTopViewController(base: nav.visibleViewController)

        } else if let tab = base as? UITabBarController, let selected = tab.selectedViewController {
            return getTopViewController(base: selected)

        } else if let presented = base?.presentedViewController {
            return getTopViewController(base: presented)
        }
        return base
    }
}
