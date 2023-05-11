import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:myapp/Search/productview_2.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

class HistoryPage extends StatefulWidget {
 
  @override
  _HistoryPageState createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
  final _shoppingBox = Hive.box('Medbox');


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('History'),
      ),
      body: Column(
        children: [
          Expanded(
            child: ValueListenableBuilder(
              valueListenable: _shoppingBox.listenable(),
              builder: (_, Box<dynamic> box, __) {
                final data = box.keys.map((key) {
                  final value = box.get(key);
                  return {"name": value["name"], "quantity": value['quantity']};
                }).toList();

                return ListView.builder(
                  itemCount: data.length,
                  itemBuilder: (_, index) {
                    final item = data[index];
                    return ListTile(
                      title: Text(item['name']),
                      subtitle: Text(item['quantity'].toString()),
                    );
                  },
                );
              },
            ),
          ),
          Expanded(
            child: ValueListenableBuilder(
              valueListenable: _shoppingBox.listenable(),
              builder: (_, Box<dynamic> box, __) {
                final selectedProducts =
                    box.get('selectedProducts', defaultValue: []);

                return ListView.builder(
                  itemCount: selectedProducts.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(selectedProducts[index].name),
                      subtitle: Text(selectedProducts[index].range),
                    );
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
