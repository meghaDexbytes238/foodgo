import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

List productName = ['CheesBurger','Hamburger','Hamburger','Hamburger'];
List productDetail = ["Wendy'y Burger","Veggle Burger",'Chicken Burger','Fried Chicken Burger'];
List productRating = ["4.9","4.8",'4.6','4.5'];
List productImg = ["assets/images/foodimg1.svg","assets/images/foodimg2.svg",'assets/images/foodimg3.svg','assets/images/foodimg4.svg'];


class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body:  SingleChildScrollView(

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
                 // const Text('Order your favourite food!',style: TextStyle(fontWeight: FontWeight.w400,height: 61,color: Color(0xFF3C2F2F),fontFamily: 'Poppins'),),

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
          child: Column(
            children: [
            // Container(
            //     width: 60,
            //     height: 60,
            //     decoration: BoxDecoration(
            //         color: Colors.blue,
            //         image: DecorationImage(image: SvgPicture.asset('${productImg[index]}',width: 50,height: 50,),fit: BoxFit.cover),
            //         shape: BoxShape.circle
            //
            //     ),

              SvgPicture.asset('${productImg[index]}',width: 50,height: 50,fit: BoxFit.contain,),
        Text("${productName[index]}"),
            Text('${productDetail[index]}'),

          Row(
            children: [
              Image(image: AssetImage('assets/images/star.png')),
              Text('${productRating[index]}'),
            ],
          ),
          ],
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



      // Row(
      //
      //   children: [
      //     Column(
      //       children: [
      //         Text('Order your favourite food!',style: TextStyle(fontWeight: FontWeight.w400,height: 61,color: Color(0xFF3C2F2F),fontFamily: 'Poppins'),),
      //       ],
      //     ),
      //     Container(
      //
      //       width: 106,
      //       height: 73,
      //       decoration: BoxDecoration(
      //           color: Colors.blue,
      //
      //           image: DecorationImage(image: AssetImage('assets/images/profilePhoto.png'))),)
      //   ],
      // ),
      
    );
  }
}
