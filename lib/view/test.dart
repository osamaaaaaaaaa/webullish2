import 'package:flutter/material.dart';
import 'package:pay/pay.dart';
import 'payment_configurations.dart' as payment_configurations;

const _paymentItems = [
  PaymentItem(
    label:
        '<Add Your merchant name or the displayName you added in the json file apple_pay.json ex:Facebook',
    amount: '99.99',
    status: PaymentItemStatus.final_price,
  )
];

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Apple Pay Example'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ApplePayButton(
              paymentConfiguration: PaymentConfiguration.fromJsonString(
                  payment_configurations.defaultApplePay),
              paymentItems: _paymentItems,
              style: ApplePayButtonStyle.black,
              type: ApplePayButtonType.buy,
              margin: const EdgeInsets.only(top: 15.0),
              onPaymentResult: ((result) {}),
              loadingIndicator: const Center(
                child: CircularProgressIndicator(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
