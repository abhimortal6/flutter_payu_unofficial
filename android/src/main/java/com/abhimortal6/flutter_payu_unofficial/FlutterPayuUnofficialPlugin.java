package com.abhimortal6.flutter_payu_unofficial;
/** FlutterPayuUnofficialPlugin */
//public class FlutterPayuUnofficialPlugin implements FlutterPlugin, MethodCallHandler {


import android.app.Activity;
import android.content.Intent;

import androidx.annotation.NonNull;

import com.google.gson.Gson;
import com.google.gson.reflect.TypeToken;
import com.payumoney.core.PayUmoneySdkInitializer;
import com.payumoney.core.entity.TransactionResponse;
import com.payumoney.sdkui.ui.utils.PayUmoneyFlowManager;

import java.util.HashMap;
import java.util.Map;

import io.flutter.embedding.engine.plugins.FlutterPlugin;
import io.flutter.embedding.engine.plugins.activity.ActivityAware;
import io.flutter.embedding.engine.plugins.activity.ActivityPluginBinding;
import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel;
import io.flutter.plugin.common.MethodChannel.MethodCallHandler;
import io.flutter.plugin.common.MethodChannel.Result;
import io.flutter.plugin.common.PluginRegistry;

import static android.app.Activity.RESULT_CANCELED;
import static android.app.Activity.RESULT_OK;

/**
 * FlutterPayuMoneyPlugin
 */


public class FlutterPayuUnofficialPlugin implements FlutterPlugin, MethodCallHandler, ActivityAware, PluginRegistry.ActivityResultListener {

  private MethodChannel channel;
  private static Activity activity;

  private MethodChannel.Result result;


  private static final String CHANNEL = "flutterPayu";
  private static final String INITIATE_PAYMENT_METHOD = "initiatePayment";

  @Override
  public void onDetachedFromEngine(@NonNull FlutterPluginBinding binding) {
    channel.setMethodCallHandler(null);
  }

  @Override
  public void onAttachedToActivity(@NonNull ActivityPluginBinding binding) {
    activity = binding.getActivity();
    binding.addActivityResultListener(this);

  }

  @Override
  public void onDetachedFromActivityForConfigChanges() {

  }

  @Override
  public void onReattachedToActivityForConfigChanges(@NonNull ActivityPluginBinding binding) {

  }

  @Override
  public void onDetachedFromActivity() {

  }


  @Override
  public void onAttachedToEngine(@NonNull FlutterPluginBinding flutterPluginBinding) {
    channel = new MethodChannel(flutterPluginBinding.getBinaryMessenger(), CHANNEL);
    channel.setMethodCallHandler(this);

  }


  @Override
  public void onMethodCall(@NonNull MethodCall call, @NonNull Result result) {
    this.result = result;
    if (call.method.equals(INITIATE_PAYMENT_METHOD)) {
      try {
        initiatePayment(call, result);
      } catch (Exception e) {
        e.printStackTrace();
      }
    } else {
      result.notImplemented();
    }
  }

  private void initiatePayment(@NonNull MethodCall call, @NonNull Result result) throws Exception {

    String merchantID = call.argument("merchantID");
    String merchantKey = call.argument("merchantKey");
    String salt = call.argument("salt");
    String amount = call.argument("amount");
    String transactionID = call.argument("transactionID");
    String phone = call.argument("phone");
    String productName = call.argument("productName");
    String firstName = call.argument("firstName");
    String email = call.argument("email");
    String sURL = call.argument("sURL");
    String fURL = call.argument("fURL");
    String udf1 = call.argument("udf1");
    String udf2 = call.argument("udf2");
    String udf3 = call.argument("udf3");
    String udf4 = call.argument("udf4");
    String udf5 = call.argument("udf5");
    String udf6 = call.argument("udf6");
    String udf7 = call.argument("udf7");
    String udf8 = call.argument("udf8");
    String udf9 = call.argument("udf9");
    String udf10 = call.argument("udf10");
    String hash = call.argument("hash");
    boolean isDebug = call.argument("isDebug");
    boolean showCompletionScreen = call.argument("showCompletionScreen");


    PayUmoneySdkInitializer.PaymentParam.Builder builder = new
            PayUmoneySdkInitializer.PaymentParam.Builder();
    builder.setAmount(amount)
            .setTxnId(transactionID)
            .setPhone(phone)
            .setProductName(productName)
            .setFirstName(firstName)
            .setEmail(email)
            .setsUrl(sURL)
            .setfUrl(fURL)
            .setUdf1(udf1)
            .setUdf2(udf2)
            .setUdf3(udf3)
            .setUdf4(udf4)
            .setUdf5(udf5)
            .setUdf6(udf6)
            .setUdf7(udf7)
            .setUdf8(udf8)
            .setUdf9(udf9)
            .setUdf10(udf10)
            .setIsDebug(isDebug)
            .setKey(merchantKey)
            .setMerchantId(merchantID);

    PayUmoneySdkInitializer.PaymentParam paymentParam = builder.build();
    paymentParam.setMerchantHash(hash);


    PayUmoneyFlowManager.startPayUMoneyFlow(
            paymentParam,
            activity,
            R.style.AppTheme_Green,
            !showCompletionScreen);


  }

  @Override
  public boolean onActivityResult(int requestCode, int resultCode, Intent data) {
    if (requestCode == PayUmoneyFlowManager.REQUEST_CODE_PAYMENT && resultCode == RESULT_OK && data != null) {
      TransactionResponse transactionResponse = data.getParcelableExtra(PayUmoneyFlowManager.INTENT_EXTRA_TRANSACTION_RESPONSE);

      if (transactionResponse != null && transactionResponse.getPayuResponse() != null) {

        if (transactionResponse.getTransactionStatus().equals(TransactionResponse.TransactionStatus.SUCCESSFUL)) {
          String payuResponse = transactionResponse.getPayuResponse();

          Map<String, Object> retMap = new Gson().fromJson(
                  payuResponse, new TypeToken<HashMap<String, Object>>() {}.getType()
          );
          this.result.success(retMap);
        } else {
          HashMap<String, Object> response = new HashMap<>();
          response.put("message", transactionResponse.getMessage());
          response.put("result", transactionResponse.toString());
          this.result.success(response);
        }
      }
    } else if (resultCode == RESULT_CANCELED) {
      HashMap<String, Object> response = new HashMap<>();
      HashMap<String, Object> innerResponse = new HashMap<>();
      innerResponse.put("status","cancelled");
      response.put("result", innerResponse);
      this.result.success(response);
    }
    return false;
  }


}