import 'package:flutter/material.dart';

class CheckoutPage extends StatefulWidget {
  @override
  _CheckoutPageState createState() => _CheckoutPageState();
}

class _CheckoutPageState extends State<CheckoutPage> {
  TextEditingController _nameController = TextEditingController();
  TextEditingController _addressController = TextEditingController();
  TextEditingController _phoneController = TextEditingController();
  TextEditingController _couponController = TextEditingController();

  double _totalAmount = 0.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Checkout Page'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                'Checkout Details',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 16.0),
              TextField(
                controller: _nameController,
                decoration: InputDecoration(
                  labelText: 'Name',
                ),
              ),
              SizedBox(height: 8.0),
              TextField(
                controller: _addressController,
                decoration: InputDecoration(
                  labelText: 'Address',
                ),
              ),
              SizedBox(height: 8.0),
              TextField(
                controller: _phoneController,
                decoration: InputDecoration(
                  labelText: 'Phone Number',
                ),
                keyboardType: TextInputType.phone,
              ),
              SizedBox(height: 16.0),
              TextField(
                controller: _couponController,
                decoration: InputDecoration(
                  labelText: 'Coupon Code',
                ),
              ),
              SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: () {
                  // Apply Coupon Code logic
                  // Calculate Total Bill logic
                },
                child: Text('Apply Coupon'),
              ),
              SizedBox(height: 16.0),
              Text(
                'Total Bill: \$$_totalAmount',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: () {
                  // Checkout button logic
                },
                child: Text('Checkout'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
