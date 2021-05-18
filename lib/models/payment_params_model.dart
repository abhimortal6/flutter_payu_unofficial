///Payment parameters required before starting a payment
///Visit official PayUMoney official documentation for hash building formula
class PaymentParams {
  ///Merchant Id from Payu
  String merchantID,

      ///Merchant key from Payu
      merchantKey,

      ///Salt from Payu

      salt,

      ///Amount of service/product
      amount,

      ///Transaction ID
      transactionID,

      ///User phone number
      phone,

      ///Product Name
      productName,

      ///User name
      firstName,

      ///User Email
      email,

      ///Success URL
      sURL,

      ///Failure URL
      fURL,

      ///User defined field 1
      udf1,

      ///User defined field 2
      udf2,

      ///User defined field 3
      udf3,

      ///User defined field 4
      udf4,

      ///User defined field 5
      udf5,

      ///User defined field 6
      udf6,

      ///User defined field 7
      udf7,

      ///User defined field 8
      udf8,

      ///User defined field 9
      udf9,

      ///User defined field 10
      udf10,

      ///Hash don't generate this hash locally always use external source/server see example/main.dart for local working
      ///Refer official documentation for Hash generation formula
      hash;

  ///If true will show logs and environment to testing. False for production
  bool isDebug;

  PaymentParams(
      {required this.merchantID,
      required this.merchantKey,
      required this.salt,
      required this.amount,
      required this.transactionID,
      required this.phone,
      required this.productName,
      required this.firstName,
      required this.email,
      required this.sURL,
      required this.fURL,
      required this.udf1,
      required this.udf2,
      required this.udf3,
      required this.udf4,
      required this.udf5,
      required this.udf6,
      required this.udf7,
      required this.udf8,
      required this.udf9,
      required this.udf10,
      required this.hash,
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
