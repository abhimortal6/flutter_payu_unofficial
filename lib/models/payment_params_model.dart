import 'package:flutter/foundation.dart';

class PaymentParams {
  String merchantID,
      merchantKey,
      salt,
      amount,
      transactionID,
      phone,
      productName,
      firstName,
      email,
      sURL,
      fURL,
      udf1,
      udf2,
      udf3,
      udf4,
      udf5,
      udf6,
      udf7,
      udf8,
      udf9,
      udf10,
      hash;
  bool isDebug;

  PaymentParams(
      {@required this.merchantID,
      @required this.merchantKey,
      @required this.salt,
      @required this.amount,
      @required this.transactionID,
      @required this.phone,
      @required this.productName,
      @required this.firstName,
      @required this.email,
      @required this.sURL,
      @required this.fURL,
      @required this.udf1,
      @required this.udf2,
      @required this.udf3,
      @required this.udf4,
      @required this.udf5,
      @required this.udf6,
      @required this.udf7,
      @required this.udf8,
      @required this.udf9,
      @required this.udf10,
      @required this.hash,
      this.isDebug: false});

  Map<String, dynamic> toMap() => {
        'merchantID': merchantID,
        'merchantKey': merchantKey,
        'salt': salt,
        'amount': amount,
        'transactionID': transactionID,
        'phone': phone,
        'productName': productName,
        'firstName': firstName,
        'email': email,
        'sURL': sURL,
        'fURL': fURL,
        'udf1': udf1,
        'udf2': udf2,
        'udf3': udf3,
        'udf4': udf4,
        'udf5': udf5,
        'udf6': udf6,
        'udf7': udf7,
        'udf8': udf8,
        'udf9': udf9,
        'udf10': udf10,
        'hash': hash,
        'isDebug': isDebug,
      };
}