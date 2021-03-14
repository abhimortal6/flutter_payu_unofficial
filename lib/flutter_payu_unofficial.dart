import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:flutter_payu_unofficial/models/payment_params_model.dart';
import 'package:flutter_payu_unofficial/models/payment_result.dart';
import 'package:flutter_payu_unofficial/utils/constants.dart';
import 'package:flutter_payu_unofficial/validator.dart';

class FlutterPayuUnofficial {
  static const MethodChannel _channel = const MethodChannel(Constants.platformChannelName);

  static Future<PayuPaymentResult> initiatePayment({
    @required PaymentParams paymentParams,
    bool showCompletionScreen: true,
  }) async {
    if (validatePaymentParams(paymentParams)) {
      Map<String, dynamic> _map = paymentParams.toMap();
      _map.addAll({'showCompletionScreen': showCompletionScreen});

      if (paymentParams.isDebug) {
        print("Flutter PayU Money: logs are available in debug mode only");
        print("Arguments Map: $_map");
      }
      Map<dynamic, dynamic> _resultMap = await _channel.invokeMethod(Constants.initiatePaymentMethod, _map);
      PayuPaymentResult _paymentResult = PayuPaymentResult(response: _resultMap, status: _resultMap["result"]["status"]);
      return _paymentResult;
    } else {
      throw Exception("Incorrect Payment Params");
    }

    return null;
  }
}
