import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:PharMa/Search/productview.dart';

class Product {
  final  name;
  final  price;
  final  imageUrl;
  final  brand;

  Product(
      {required this.name, required this.price, required this.imageUrl, required this.brand});
}

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);
  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  List<Map<String, dynamic>> _items = [];

  final _shoppingBox = Hive.box('Medbox');

  void _refreshItems() {
    final data = _shoppingBox.keys.map((key) {
      final value = _shoppingBox.get(key);
      print(value);
      return {"key": key, "name": value["name"], "quantity": value['quantity']};
    }).toList();

    setState(() {
      _items = data.reversed.toList();
      // we use "reversed" to sort items in order from the latest to the oldest
    });
  }

  _readItem() {
    final item = _shoppingBox.get('name');
    return Text(item.toString());
  }

  final TextEditingController searchController = TextEditingController();
  String searchText = "";

  List<Product> products = [
    // Product(name: _readItem(), price:"", imageUrl: ""),
    Product(
        name: "Advil",
        price:
            '50',
        imageUrl: "https://www.mediafire.com/view/v2jv22jsthfpnua/tablet.jpg/file#",
        brand: 'Albert David',),
    Product(
        name: "Tylenol",
        price:
            '15',
        imageUrl: "https://via.placeholder.com/150",
        brand: "Triokka"),
    Product(
        name: "Lipitor",
        price:
            '45',
        imageUrl: "https://via.placeholder.com/150",
        brand: "Albert David"),
    Product(
        name: "Zoloft",
        price:
            '78',
        imageUrl: "https://via.placeholder.com/150",
        brand: "Cipila"),
    Product(
        name: "Paracetamol",
        price: '10',
        imageUrl: "https://via.placeholder.com/150",
        brand: "Lupin"),
    Product(
        name: "Xanax",
        price:
            '20',
        imageUrl: "https://via.placeholder.com/150",
        brand: "Mankind"),
    Product(
        name: "Nexium",
        price:
            '30',
        imageUrl: "https://via.placeholder.com/150",
        brand: "Zota"),
    Product(
        name: "Crestor",
        price:
            '75',
        imageUrl: "https://via.placeholder.com/150",
        brand: "Cipila"),
    Product(
        name: "Abilify",
        price:
            '195',
        imageUrl: "https://via.placeholder.com/150",
        brand: "Mankind"),
    Product(
        name: "Prozac",
        price:
            '135',
        imageUrl: "https://via.placeholder.com/150",
        brand: "Triokka"),
  ];

  List<Product> filteredProducts = [];

  @override
  void initState() {
    super.initState();
    filteredProducts = products;
    _refreshItems();
  }

  void filterProducts(String query) {
    List<Product> tempProducts = [];
    products.forEach((product) {
      if (product.name.toLowerCase().contains(query.toLowerCase())) {
        tempProducts.add(product);
      }
    });
    setState(() {
      filteredProducts = tempProducts;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Products"),
      ),
      body: Column(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.all(10),
            child: TextField(
              controller: searchController,
              decoration: InputDecoration(
                hintText: "Search products",
              ),
              onChanged: (value) {
                searchText = value;
                filterProducts(searchText);
              },
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: filteredProducts.length,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  leading: Image.asset('assets/tablet.jpg'),
                  title: Text(filteredProducts[index].name),
                  subtitle: Text(filteredProducts[index].brand),
                  trailing: Text(filteredProducts[index].price),
                  onTap: () {
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => ProductPage(description: filteredProducts[index].price, imageUrl: '', name: filteredProducts[index].name,)));
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
