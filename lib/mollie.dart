library molli;

export 'package:mollie/src/mollieaddress.dart';
export 'package:mollie/src/mollieorder.dart';
export 'package:mollie/src/mollieproduct.dart';
export 'package:mollie/src/mollieamount.dart';
export 'package:mollie/src/molliecheckout.dart';
export 'package:mollie/src/mollieorderstatus.dart';
export 'package:mollie/src/molliecustomer.dart';
export 'package:mollie/src/molliesubscription.dart';
export 'package:mollie/src/mollieshipment.dart';
export 'package:mollie/src/mollieorderline.dart';
export 'package:mollie/src/molliepayment.dart';
export 'package:mollie/src/mollieinvoice.dart';
export 'package:mollie/src/mollieinvoiceline.dart';

import 'package:mollie/src/mollieclient.dart';
import 'package:mollie/src/mollieorder.dart';
import 'dart:async';
import 'package:flutter/services.dart';
import 'package:mollie/src/molliepayment.dart';

class Mollie {
  final klarnaPayNow = "sofort";
  final creditCard = "creditcard";
  final payPal = "paypal";
  final sepa = "branktransfer";
  final applePay = "applePay";
  final ideal = "ideal";

  static MollieClient client = new MollieClient();

  static const MethodChannel _channel = const MethodChannel('mollie');

  /// Opens the browser to process the payment. Returns after payment is done.
  static Future<void> startPayment(String checkoutUrl) async {
    return await _channel
        .invokeMethod('startPayment', {"checkoutUrl": checkoutUrl});
  }

  static MollieOrderResponse _currentOrder;

  static MollieOrderResponse getCurrentOrder() => _currentOrder;

  static MollieOrderResponse setCurrentOrder(MollieOrderResponse order) =>
      _currentOrder = order;

  static MolliePaymentResponse _currentPayment;

  static MolliePaymentResponse getCurrentPayment() => _currentPayment;

  static MolliePaymentResponse setCurrentPayment(MolliePaymentResponse payment) =>
      _currentPayment = payment;

  static String _currentPaymentId;

  static String getCurrentPaymentId() => _currentPaymentId;

  static String setCurrentPaymentId(String paymentId) =>
      _currentPaymentId = paymentId;
}
