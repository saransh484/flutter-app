import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:PharMa/Search/productview.dart';

class Product {
  final  name;
  final  description;
  final  imageUrl;

  Product(
      {required this.name, required this.description, required this.imageUrl});
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
    // Product(name: _readItem(), description:"", imageUrl: ""),
    Product(
        name: "Advil",
        description:
            "It is used to relieve pain, reduce fever, and reduce inflammation.",
        imageUrl: "https://www.mediafire.com/view/v2jv22jsthfpnua/tablet.jpg/file#"),
    Product(
        name: "Tylenol",
        description:
            "It is used to treat mild to moderate pain and reduce fever.",
        imageUrl: "https://via.placeholder.com/150"),
    Product(
        name: "Lipitor",
        description:
            "It is used to lower cholesterol levels and reduce the risk of heart attack and stroke.",
        imageUrl: "https://via.placeholder.com/150"),
    Product(
        name: "Zoloft",
        description:
            "It is used to treat depression, anxiety, and obsessive-compulsive disorder (OCD).",
        imageUrl: "https://via.placeholder.com/150"),
    Product(
        name: "Paracetamol",
        description: " It is used for pain relief and fever reduction..",
        imageUrl: "https://via.placeholder.com/150"),
    Product(
        name: "Xanax",
        description:
            "It is a benzodiazepine medication used to treat anxiety and panic disorders.",
        imageUrl: "https://via.placeholder.com/150"),
    Product(
        name: "Nexium",
        description:
            "It is a proton pump inhibitor (PPI) medication used to treat gastroesophageal reflux disease (GERD) and other conditions related to excess stomach acid.",
        imageUrl: "https://via.placeholder.com/150"),
    Product(
        name: "Crestor",
        description:
            "It is used to lower cholesterol levels and reduce the risk of heart attack and stroke.",
        imageUrl: "https://via.placeholder.com/150"),
    Product(
        name: "Abilify",
        description:
            "It is an antipsychotic medication used to treat schizophrenia, bipolar disorder, and major depressive disorder.",
        imageUrl: "https://via.placeholder.com/150"),
    Product(
        name: "Prozac",
        description:
            "a medication used to treat high blood pressure and fluid retention",
        imageUrl: "https://via.placeholder.com/150"),
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
                  subtitle: Text(filteredProducts[index].description),
                  onTap: () {
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => ProductPage(description: filteredProducts[index].description, imageUrl: '', name: filteredProducts[index].name,)));
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
