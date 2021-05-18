
# flutter_payu_money
  
Unofficial PayU Money Flutter Plugin supports Android & iOS.
  
**Flutter Payu Money**  uses Mobile SDK provided by PayU Money Dev Team

![Screenshot 1](https://github.com/abhimortal6/flutter_payu_money/blob/master/screenshots/0.png)  ![Screenshot 3](https://github.com/abhimortal6/flutter_payu_money/blob/master/screenshots/2.png) ![Screenshot 4](https://github.com/abhimortal6/flutter_payu_money/blob/master/screenshots/3.png).


##  Getting started

Add  dependency in *pubspec.yaml*

`flutter_payu_money: 1.0.2`

 [Follow me on Twitter](https://twitter.com/ab_hi_j)
 
 [Follow me on Linkedin](https://www.linkedin.com/in/ab-hi-j)




##  Features

| Feature |  |
| ----- | ----------- |
| Plug n Play | Simple to install, ready to use UI |
| Auto Read OTP | Auto read OTP on supported platform|
| PayU Money Mobile SDK | Based on PayU Money Mobile SDK for iOS and Android|
| Null Safety | :white_check_mark:|



## Android Installation
### Edit AndroidManifest.xml

Put this line in AndroidManifest.xml's **manifest** tag
```xml
   xmlns:tools="http://schemas.android.com/tools"
```
*\<project-dir\>/android/app/src/main/AndroidManifest.xml*
```xml
Example: 
<manifest xmlns:android="http://schemas.android.com/apk/res/android"  
  xmlns:tools="http://schemas.android.com/tools" <--------- Paste here 
  package="com.abhimortal6.flutter_payu_money_example">
```

And  put this line in **application** tag after **android:label**
```xml
   tools:replace="android:label"
```
```xml
Example: 
<application  
  android:name="io.flutter.app.FlutterApplication"  
  android:icon="@mipmap/ic_launcher"  
  android:label="flutter_payu_money_example"  
  tools:replace="android:label" <--------- Paste here >
```
### For iOS no configuration is needed

## Usage Examples


### Prepare Payment Parameters

```dart

// Prepare Payament Parameters.

PaymentParams _paymentParam = PaymentParams(  
		  merchantID: "Merchant ID",  
		  merchantKey: "Merchant Key",  
		  salt: "Salt",  
		  amount: "100",  
		  transactionID: "TXNID1234567890",  
		  firstName: "FirstName",
		  email: "Test@test.com",  
		  productName: "Test Product",  
		  phone: "9876543210",  
		  fURL: "https://www.payumoney.com/mobileapp/payumoney/failure.php",  
		  sURL: "https://www.payumoney.com/mobileapp/payumoney/success.php",  
		  udf1: "udf1",  
		  udf2: "udf2",  
		  udf3: "udf3",  
		  udf4: "udf4",  
		  udf5: "udf5",  
		  udf6: "",  
		  udf7: "",  
		  udf8: "",  
		  udf9: "",  
		  udf10: "",  
		  hash: "",  
		  isDebug: true,); // true for Test Mode, false for Production
		  //also disables logs in production
		  //default is false


```

###  Initiate Payment

```dart

// returns PayuPaymentResult object

PayuPaymentResult _paymentResult = await FlutterPayUMoney.initiatePayment(
		paymentParams: _paymentParam, 
		showCompletionScreen: false);
		//false will not show in built success/failure screens
		//default is true

```


### Compare result

```dart

// PayuPaymentResult.status is String and PayuPaymentStatus class have some generic statuses to compare cleanly.
// Actual response is in PayuPaymentResult.response.
// Response is Map<dynamic,dynamic> and direct from SDK nothing changed.

	if (_paymentResult.status == PayuPaymentStatus.success) {  
	  print("Success: ${_paymentResult.response}");  
	} else if (_paymentResult.status == PayuPaymentStatus.failed) {  
	  print("Failed: ${_paymentResult.response}");  
	} else if (_paymentResult.status == PayuPaymentStatus.cancelled) {  
	  print("Cancelled by User: ${_paymentResult.response}");  
	} else {  
	  print("Response: ${_paymentResult.response}");  
	  print("Status: ${_paymentResult.status}");  
	}

```

