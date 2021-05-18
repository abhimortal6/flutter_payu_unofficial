///Result object that returns in the end of transaction
///It's directly put as it is no changes are made in this response
class PayuPaymentResult {
  ///Response from Native SDK
  Map<dynamic, dynamic>? response;

  ///Status of transaction part of which computed in dart code
  String? status;

  PayuPaymentResult({this.response, this.status});
}
