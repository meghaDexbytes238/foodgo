import 'package:flutter/material.dart';
import 'package:footgo/Screens/product.dart';


class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}
// List<String> productName = ['chetan', 'megha', 'new', 'sweta', 'love'];

List<Fruit> productName = [
  Fruit(name: 'Apple', imageUrl: 'https://images.pexels.com/photos/102104/pexels-photo-102104.jpeg'),
  Fruit(name: 'Banana', imageUrl: 'https://images.pexels.com/photos/5945848/pexels-photo-5945848.jpeg'),
  Fruit(name: 'Pineapple', imageUrl: 'https://images.pexels.com/photos/1071878/pexels-photo-1071878.jpeg'),
  Fruit(name: 'Mango', imageUrl: 'https://images.pexels.com/photos/918643/pexels-photo-918643.jpeg'),
];
List<Fruit> searchList = [];


class _LoginScreenState extends State<LoginScreen> {
  late TextEditingController _searchController;
  late List<Fruit> filteredProductNames;

  @override
  void initState() {
    super.initState();
    _searchController = TextEditingController();
    filteredProductNames = List.from(productName);
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  // void _onSearch(String value) {
  //   setState(() {
  //     filteredProductNames = productName
  //         .where((name) => name.toLowerCase().contains(value.toLowerCase()))
  //         .toList();
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Product Search'),
      ),
      body: Column(
          mainAxisSize: MainAxisSize.min,

        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              clipBehavior: Clip.antiAlias,
              decoration: BoxDecoration(
                boxShadow:  [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5), //color of shadow
                    // spreadRadius: 5, //spread radius
                    blurRadius: 7, // blur radius
                    offset: Offset(0, 1),
                  ),],
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.circular(15),
                // shape: BoxShape.rectangle,
                // borderRadius: BorderRadius.(25),
                color: Colors.red,

              ),
              child: TextField(
//clipBehavior: Clip.none,

                controller: _searchController,

                decoration: InputDecoration(

                  filled: true,
                  //fillColor:  Colors.blue,
                  border: InputBorder.none,
                  fillColor: const Color(0xffffffff),
                  //  border: InputBorder.none,
                  // border:InputBorder.none,

                  //  (
                  //
                  //   borderRadius: BorderRadius.all(Radius.circular(25),),
                  //
                  //   borderSide: BorderSide(),
                  // ),

                  hintText: 'Search',

                  // labelText: 'Screat',
                  prefixIcon: Icon(Icons.search),


                ),
                onChanged: (value) {
                  setState(() {
                    filteredProductNames = productName
                        .where((fruit) => fruit.name.toLowerCase().contains(value.toLowerCase()))
                        .toList();
                  });
                },
                // _onSearch,
              ),
            ),
          ),
          Expanded(
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 8.0,
                mainAxisSpacing: 8.0,
              ),
              itemBuilder: (context, index) {
                return Card(
                  child: Center(child: Text("${filteredProductNames[index].name}")),
                );
              },
              itemCount: filteredProductNames.length,
            ),
          ),
        ],
      ),
    );
  }
}
