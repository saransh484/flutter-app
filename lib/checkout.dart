import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: CheckoutPage(),
    ),
  );
}

class CheckoutPage extends StatefulWidget {
  @override
  _CheckoutPageState createState() => _CheckoutPageState();
}

class _CheckoutPageState extends State<CheckoutPage> {
  final _formKey = GlobalKey<FormState>();
  late String _name;
  late String _address;
  late String _phone;
  late String _couponCode;
  double _totalBillAmount = 0.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Checkout'),
      ),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: <Widget>[
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Name',
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter your name';
                  }
                  return null;
                },
                onSaved: (value) {
                  _name = value!;
                },
              ),
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Address',
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter your address';
                  }
                  return null;
                },
                onSaved: (value) {
                  _address = value!;
                },
              ),
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Phone Number',
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter your phone number';
                  }
                  return null;
                },
                onSaved: (value) {
                  _phone = value!;
                },
              ),
              TextField(
                decoration: InputDecoration(
                  labelText: 'Coupon Code',
                ),
                onSubmitted: (value) {
                  _applyCouponCode(value);
                },
              ),
              Text(
                'Total Bill Amount: \$${_totalBillAmount}',
                style: TextStyle(fontSize: 20.0),
              ),
              RaisedButton(
                child: Text('Submit'),
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();
                    // TODO: Submit the checkout form
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _applyCouponCode(String couponCode) {
    // TODO: Apply the coupon code
  }
}

RaisedButton({required Text child, required Null Function() onPressed}) {}
