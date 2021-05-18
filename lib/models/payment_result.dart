///Result object that returns in the end of transaction
///It's directly put as it is no changes are made in this response
class PayuPaymentResult {
  Map<dynamic, dynamic>? response;
  String? status;

  PayuPaymentResult({this.response, this.status});
}
