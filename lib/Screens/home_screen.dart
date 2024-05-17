import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:footgo/Screens/product.dart';
import 'package:footgo/Screens/product_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

// List <dynamic> productName = ['CheesBurger','Hamburger','Hamburger1','Hamburger2'];
// List productDetail = ["Wendy'y Burger","Veggle Burger",'Chicken Burger','Fried Chicken Burger'];
// List productRating = ["4.9","4.8",'4.6','4.5'];
// List productImg = ["assets/images/foodImg1png.png","assets/images/imagepng2.png",'assets/images/foodImgPng3.png',"assets/images/foodImgPng3.png"];
final List<Product> productsList = [
  Product(productName: 'CheesBurger', productRating: "4.9", productDetail: "Wendy'y Burger", productImage: 'assets/images/foodImg1png.png',),
  Product(productName: 'Hamburger', productRating: "4.8", productDetail: "Veggle Burger",productImage: "assets/images/imagepng2.png" ),
  Product(productName: 'Hamburger1', productRating: "4.6", productDetail: 'Chicken Burger',productImage: 'assets/images/foodImgPng3.png'),
  Product(productName: 'Hamburger2', productRating: "4.5", productDetail: 'Fried Chicken Burger',productImage:'assets/images/foodImgPng3.png'),
 // Product(name: 'Product 5', price: 20.0, category: 'Category A'),
];

class _HomeScreenState extends State<HomeScreen> {
  late TextEditingController _searchController;
  late List<Product> filteredProductNames;

  @override
  void initState() {
    super.initState();
    _searchController = TextEditingController();
    filteredProductNames = List.from(productsList);
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body:  Padding(
        padding:  const EdgeInsets.only(left: 15,right: 15,top: 15),
        child: Column(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Foodgo',style: TextStyle(fontWeight: FontWeight.w400,color: Color(0xFF3C2F2F),fontFamily: 'Lobster',fontSize: 45),),
                        Container(
                          width: 60,
                          height: 60,
                          decoration: BoxDecoration(
                              color: Colors.blue,
                              image: DecorationImage(image: AssetImage('assets/images/profilePhoto.png',),fit: BoxFit.cover),
                            shape: BoxShape.circle
                          ),
                        )
                      ],
                    ),
                Text('Order your favourite food!',style: TextStyle(fontWeight: FontWeight.w400,color: Color(0xFF3C2F2F),fontFamily: 'Poppins',fontSize: 18),),


              ],
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                clipBehavior: Clip.antiAlias,
                decoration: BoxDecoration(
                  boxShadow:  [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5), //color of shadow
                      blurRadius: 7, // blur radius
                      offset: Offset(0, 1),
                    ),],
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.circular(15),
                  color: Colors.red,

                ),
                child: TextField(
                  controller: _searchController,
                  decoration: InputDecoration(
                    filled: true,
                    border: InputBorder.none,
                    fillColor: const Color(0xffffffff),
                    hintText: 'Search',
                    prefixIcon: Icon(Icons.search),
                  ),
                  onChanged: (value) {
                    setState(() {
                      filteredProductNames = productsList
                          .where((product) => product.productName.toLowerCase().contains(value.toLowerCase()))
                          .toList();
                    });
                  },
                  // _onSearch,
                ),
              ),
            ),
            Expanded(
              child: GestureDetector(
                child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 8.0,
                    mainAxisSpacing: 8.0,
                  ),
                  itemBuilder: (context, index) {
                    return Card(
                      elevation: 8,
                shadowColor: Colors.grey.shade50,
                surfaceTintColor: Colors.white,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                child: Padding(
                      padding:  EdgeInsets.only(top: 15,left: 10,right: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                          //  mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Center(
                            child: Image(image: AssetImage('${filteredProductNames[index].productImage}'),),

                            // Container(
                            //   alignment: Alignment.center,
                            //     width: 120,
                            //     height: 120,
                            //     decoration: BoxDecoration(
                            //         // color: Colors.blue,
                            //         image: DecorationImage(image: AssetImage('${filteredProductNames[index].productImage}'),fit: BoxFit.cover),
                            //         shape: BoxShape.circle
                            //     ),),
                          ),
                        Text("${filteredProductNames[index].productName}",style: TextStyle(fontWeight: FontWeight.bold,fontFamily: 'Roboto'),),
                        Text('${filteredProductNames[index].productDetail}',style: TextStyle(fontFamily: 'Roboto'),),
                     // SizedBox(height: ,),
                      Row(
                        children: [
                          Image(image: AssetImage('assets/images/star.png')),
                       //  SizedBox(width: 2,),
                         Expanded (
                child: Text('${filteredProductNames[index].productRating}'),flex: 1,
                          ),
                          SvgPicture.asset('assets/images/heart.svg'),
                        ],
                      ),
                      ],
                      ),
                ),

                      //Center(child: Text("${filteredProductNames[index].productName}")),


                    );
                  },
                  itemCount: filteredProductNames.length,
                ),
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => ProductScreen(),));
                },
              ),
            ),
          ],
        ),
      ),





    );
  }

}
