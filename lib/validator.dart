import 'package:flutter_payu_unofficial/models/payment_params_model.dart';
import 'package:flutter_payu_unofficial/utils/constants.dart';

bool validatePaymentParams(PaymentParams paymentParams,
    {bool debugPrint: true}) {
  if (paymentParams.merchantID == null) {
    if (debugPrint) print(Constants.printTAG + "Merchant ID cannot be null.");
    return false;
  }
  if (paymentParams.amount == null) {
    if (debugPrint) print(Constants.printTAG + "Amount cannot be null.");
    return false;
  }
  if (paymentParams.salt == null) {
    if (debugPrint) print(Constants.printTAG + "Salt cannot be null.");
    return false;
  }
  if (paymentParams.merchantKey == null) {
    if (debugPrint) print(Constants.printTAG + "Merchant Key cannot be null.");
    return false;
  }
  if (paymentParams.transactionID == null) {
    if (debugPrint)
      print(Constants.printTAG + "Transaction ID cannot be null.");
    return false;
  }
  if (paymentParams.phone == null) {
    if (debugPrint) print(Constants.printTAG + "Phone Number cannot be null.");
    return false;
  }
  if (paymentParams.productName == null) {
    if (debugPrint) print(Constants.printTAG + "Product Info cannot be null.");
    return false;
  }
  if (paymentParams.sURL == null) {
    if (debugPrint) print(Constants.printTAG + "sURL  cannot be null.");
    return false;
  }
  if (paymentParams.fURL == null) {
    if (debugPrint) print(Constants.printTAG + "fURL  cannot be null.");
    return false;
  }
  if (paymentParams.hash == null) {
    if (debugPrint) print(Constants.printTAG + "Hash cannot be null.");
    return false;
  }
  if (paymentParams.merchantID == null) {
    if (debugPrint) print(Constants.printTAG + "MerchantID cannot be null.");
    return false;
  }
  if (paymentParams.udf1 == null) {
    if (debugPrint)
      print(Constants.printTAG +
          "udf1 cannot be null. Must be initialised with \"\" ");
    return false;
  }
  if (paymentParams.udf2 == null) {
    if (debugPrint)
      print(Constants.printTAG +
          "udf2 cannot be null. Must be initialised with \"\" ");
    return false;
  }
  if (paymentParams.udf3 == null) {
    if (debugPrint)
      print(Constants.printTAG +
          "udf3 cannot be null. Must be initialised with \"\" ");
    return false;
  }
  if (paymentParams.udf4 == null) {
    if (debugPrint)
      print(Constants.printTAG +
          "udf4 cannot be null. Must be initialised with \"\" ");
    return false;
  }
  if (paymentParams.udf5 == null) {
    if (debugPrint)
      print(Constants.printTAG +
          "udf5 cannot be null. Must be initialised with \"\" ");
    return false;
  }
  if (paymentParams.udf6 == null) {
    if (debugPrint)
      print(Constants.printTAG +
          "udf6 cannot be null. Must be initialised with \"\" ");
    return false;
  }
  if (paymentParams.udf7 == null) {
    if (debugPrint)
      print(Constants.printTAG +
          "udf7 cannot be null. Must be initialised with \"\" ");
    return false;
  }
  if (paymentParams.udf8 == null) {
    if (debugPrint)
      print(Constants.printTAG +
          "udf8 cannot be null. Must be initialised with \"\" ");
    return false;
  }
  if (paymentParams.udf9 == null) {
    if (debugPrint)
      print(Constants.printTAG +
          "udf9 cannot be null. Must be initialised with \"\" ");
    return false;
  }
  if (paymentParams.udf10 == null) {
    if (debugPrint)
      print(Constants.printTAG +
          "udf10 cannot be null. Must be initialised with \"\" ");
    return false;
  }

  return true;
}
