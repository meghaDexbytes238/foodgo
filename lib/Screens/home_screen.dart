import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

List productName = ['CheesBurger','Hamburger','Hamburger','Hamburger'];
List productDetail = ["Wendy'y Burger","Veggle Burger",'Chicken Burger','Fried Chicken Burger'];
List productRating = ["4.9","4.8",'4.6','4.5'];
List productImg = ["assets/images/foodImg1png.png","assets/images/imagepng2.png",'assets/images/foodImgPng3.png',"assets/images/foodImgPng3.png"];


class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body:  SingleChildScrollView(
        physics: AlwaysScrollableScrollPhysics(),
        scrollDirection: Axis.vertical,

        child: Column(
          children: [
            Padding(
              padding:  const EdgeInsets.only(left: 15,right: 15,top: 15),
              child: Column(
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
                   SearchBar(
                     surfaceTintColor: MaterialStatePropertyAll(Colors.white),
                    padding: const MaterialStatePropertyAll<EdgeInsets>(
                        EdgeInsets.symmetric(horizontal: 16.0)),
                    onTap: () {
                     // controller.openView();
                    },
                    onChanged: (_) {
                      //controller.openView();
                    },
                    leading: const Icon(Icons.search),

                  ),
                  GridView.builder(
                    shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,crossAxisSpacing: 10),
                      itemBuilder: (context, index) {
        return  Card(
          surfaceTintColor: Colors.white,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
          child: Padding(
            padding: const EdgeInsets.only(top: 15,bottom: 15,left: 10,right: 10),
            child: Column(
mainAxisAlignment: MainAxisAlignment.start,

              children: [
                Container(
                    width: 100,
                    height: 100,
                    decoration: BoxDecoration(
                        // color: Colors.blue,
                        image: DecorationImage(image: AssetImage('${productImg[index]}'),fit: BoxFit.cover),
                        shape: BoxShape.circle
                    ),),
              Text("${productName[index]}",textAlign: TextAlign.end,),
              Text('${productDetail[index]}'),
            Row(
              children: [
                Image(image: AssetImage('assets/images/star.png')),
               Expanded (
                    child: Text('${productRating[index]}'),flex: 1,
                ),
                SvgPicture.asset('assets/images/heart.svg'),
              ],
            ),
            ],
            ),
          ),
        );
                      },
                    itemCount: productName.length,
                  )

                ],
              ),
            ),
              ],
            ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Color(0xFFEF2A39),

        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.business),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.school),
            label: '',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        onTap: (value) {

        },
      ),



      
    );
  }
}
