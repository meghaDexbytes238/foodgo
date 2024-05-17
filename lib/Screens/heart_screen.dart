// import 'package:flutter/material.dart';
//
// class HeartScreen extends StatefulWidget {
//   const HeartScreen({super.key});
//
//   @override
//   State<HeartScreen> createState() => _HeartScreenState();
// }
//
// class _HeartScreenState extends State<HeartScreen> {
//   @override
//   Widget build(BuildContext context) {
//     return const Scaffold();
//   }
// }

import 'package:flutter/material.dart';
import 'package:footgo/Screens/product.dart';

class MyHomePage extends StatefulWidget {
 // final String title;
 //  const MyHomePage(Key key) : super(key: key);
  const MyHomePage({super.key});



  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  //Search TextField Controller
  final _searchController = TextEditingController();

  List<Fruit> mainList = [
    Fruit(name: 'Apple', imageUrl: 'https://images.pexels.com/photos/102104/pexels-photo-102104.jpeg'),
    Fruit(name: 'Banana', imageUrl: 'https://images.pexels.com/photos/5945848/pexels-photo-5945848.jpeg'),
    Fruit(name: 'Pineapple', imageUrl: 'https://images.pexels.com/photos/1071878/pexels-photo-1071878.jpeg'),
    Fruit(name: 'Mango', imageUrl: 'https://images.pexels.com/photos/918643/pexels-photo-918643.jpeg'),
  ];
  List<Fruit> searchList = [];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        //title: Text(widget.title),
      ),
      body: Column(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: 60.0,
            child: TextFormField(
                controller: _searchController,
                onChanged: (text){
                  final String queryString = _searchController.text;
                  setState((){
                    if(queryString.isNotEmpty){

                      for(final fruit in mainList){
                        if(fruit.name.contains(queryString)){
                          searchList.add(fruit);
                        } else{
                          searchList.remove(fruit);
                          mainList.remove(fruit);
                        }
                      }
                    }else{
                      searchList.clear();
                    }
                  });
                }
            ),
          ),

          Expanded(
            child: _searchController.text.isEmpty
                ? GridView.count(
              crossAxisCount: 2,
              children: mainList.map((fruit)=> CardWidget(fruit: fruit)).toList(),
            )
                :GridView.count(
                crossAxisCount: 2,
                children: searchList.map((searchedFruit)=>CardWidget(fruit: searchedFruit)).toList(),
            ),
          ),
        ],
      ),
    );
  }
}


//Card Widget
class CardWidget extends StatefulWidget{
  final Fruit fruit;

  CardWidget({required this.fruit});

  @override
  _CardWidgetState createState()=> _CardWidgetState();
}

class _CardWidgetState extends State<CardWidget>{

  @override
  Widget build(BuildContext context){
    return Card(
      child: Column(
          children:[
            Image(image: NetworkImage(widget.fruit.imageUrl),width: 100,height: 100,),
            SizedBox(height: 10.0),
            Text(widget.fruit.name),
          ]
      ),
    );
  }
}