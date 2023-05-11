import 'package:PharMa/checkout.dart';
import 'package:flutter/material.dart';


class ProductPage extends StatefulWidget {
  final String name;
  final String description;
  final String imageUrl;
  
  ProductPage(
      {required this.name, required this.description, required this.imageUrl});

  @override
  State<StatefulWidget> createState() {
    return _ProductPageState(name, description, imageUrl);
  }
}

class _ProductPageState extends State<ProductPage> {

  final String name;
  final String description;
  final String imageUrl;
   _ProductPageState(this.name, this.description, this.imageUrl);


  int _rating = 0;

  void _incrementRating() {
    setState(() {
      _rating++;
    });
  }

  void _decrementRating() {
    setState(() {
      _rating--;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Product Page'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Image.asset('assets/tablet.jpg',
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(height: 16),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children:[
                Text(
                  name,
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  description,
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                onPressed: () {},
                child: const Text('Add to Cart'),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context)=> CheckoutPage()));
                },
                child: const Text('Buy Now'),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                onPressed: _decrementRating,
                icon: const Icon(Icons.remove),
              ),
              Text('$_rating'),
              IconButton(
                onPressed: _incrementRating,
                icon: const Icon(Icons.add),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
