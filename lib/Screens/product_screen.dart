import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ProductScreen extends StatefulWidget {
  const ProductScreen({super.key});

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}
List toppingNames = ['Tomato','Onions','Pickles','Bacons','Tomato'];
List sideOption = ['Fries','Coleslaw','Salad','Onion','Fries'];
List toppingImg = ['assets/images/tomoto.png','assets/images/onion.png','assets/images/pickles.png','assets/images/Bacons.png','assets/images/tomoto.png'];
List sideOptionImg = ['assets/images/tomoto.png','assets/images/OnionFreid.png','assets/images/salad.png','assets/images/OnionFreid.png','assets/images/tomoto.png'];


class _ProductScreenState extends State<ProductScreen> {
  double _currentValue = 0;
  int value = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
appBar: AppBar(
  leading: IconButton(onPressed: () {
  Navigator.pop(context);

}, icon: Image(image: AssetImage('assets/images/Vector.png'),)),

actions: [Padding(
  padding: const EdgeInsets.only(right: 15),
  child: Image(image: AssetImage('assets/images/search.png'),),
)],
),
body: SingleChildScrollView(
  scrollDirection: Axis.vertical,
  physics: AlwaysScrollableScrollPhysics(),
  child: Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Container(
        height: MediaQuery.of(context).size.height/2.9,width: MediaQuery.of(context).size.width,
        child: Row(
          children: [
            Expanded(
              child: Container(
                alignment: Alignment.centerLeft,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/images/pngwingImg.png')
                    )
                  ),
                  ),
            ),
            Container(
              padding: EdgeInsets.only(right: 15),
              width: MediaQuery.of(context).size.width/2.5,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Customize Your Burger to Your Tastes. Ultimate Experience',style: TextStyle(fontFamily: 'Roboto',),maxLines: 5,softWrap: true,),
                   SizedBox(height: 20,),
                    Text('Spicy',style: TextStyle(fontFamily: 'Roboto',fontWeight: FontWeight.w700 ,fontSize: 14)),
                    SizedBox( height: 15,),
                    SliderTheme(
                      data: SliderTheme.of(context).copyWith(
                        trackHeight: 6,
                    overlayShape: SliderComponentShape.noOverlay
                      ),
                      child:
                      Container(
                        width: double.infinity,
                        child: Slider(
                          activeColor: Color(0xffEF2A39),
                          value: _currentValue,
                          min: 0,
                          max: 100,
                          onChanged: (double newValue) {
                            setState(() {
                              _currentValue = newValue;
                            });
                          },
                        ),
                      ),
                    ),
                    Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Mild',style: TextStyle(color: Colors.green,fontFamily: 'Roboto',fontWeight: FontWeight.w800 ,fontSize: 12),),
                        Text('Home',style: TextStyle(color: Color(0xffEF2A39),fontFamily: 'Roboto',fontWeight: FontWeight.w800 ,fontSize: 12),),
                      ],
                    ),
                    SizedBox(height: 20,),
                    Text('Portion',style: TextStyle(fontFamily: 'Roboto',fontWeight: FontWeight.w500 ,fontSize: 14)),
                    SizedBox(height: 10,),
  Padding(
    padding: const EdgeInsets.only(left: 5,right: 5),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(

          child: IconButton.filledTonal(

            onPressed: () {
              setState(() {
                value = value - 1;
                if(value< 1){
                  value =1;
                }

                print('$value');
              });

              //minus.png
            },
            icon: const Icon(Icons.remove,color: Colors.white,),
            style: ButtonStyle(
              shape: MaterialStatePropertyAll(RoundedRectangleBorder(borderRadius: BorderRadius.circular(12))),
              backgroundColor: MaterialStatePropertyAll(Color(0xffEF2A39)),
            ),

          ),
          decoration: BoxDecoration(
           boxShadow: [
             BoxShadow(
               color: Colors.yellow.shade100,offset: Offset(0, 3),
                 blurRadius: 5,
                 spreadRadius: 2
             ),

           ],
            borderRadius: BorderRadius.all(Radius.circular(10))
          ),
        ),
        Text('$value',style: TextStyle(fontFamily: 'Roboto',fontWeight: FontWeight.w500 ,fontSize: 18)),
        Container(
          decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                    color: Colors.yellow.shade100,offset: Offset(0, 3),
                    blurRadius: 5,
                    spreadRadius: 2
                ),
              ],
              borderRadius: BorderRadius.all(Radius.circular(10))
          ),


          child: IconButton.filledTonal(

              onPressed: () {
                setState(() {
                  value = value + 1;
                  print('$value');
                  print('click');
                });

          }, icon: Icon(Icons.add,color: Colors.white,),
            style: ButtonStyle(
          shape: MaterialStatePropertyAll(RoundedRectangleBorder(borderRadius: BorderRadius.circular(12))),

          backgroundColor: MaterialStatePropertyAll(Color(0xffEF2A39)),


            ),

          ),
        ),
      ],
    ),
  )
                  ],
                ))
          ],
        ),
      ),
      SizedBox(height: 30,),
      Padding(
        padding: const EdgeInsets.only(left: 15),
        child: Text('Toppings',style: TextStyle(fontFamily: 'Roboto',fontWeight: FontWeight.w700 ,fontSize: 18),),
      ),
  Container(
    height: 140,


    child: GridView.builder(
      scrollDirection: Axis.horizontal,
      shrinkWrap: true,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 1 ),
    itemBuilder: (context, index) {
      return Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        margin: EdgeInsets.only(top: 15,bottom: 15,left: 15,right: 10),
        elevation: 8,
        color: Colors.black,

        child: Column(

         // mainAxisAlignment:MainAxisAlignment.spaceEvenly ,
         // crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(

              decoration: BoxDecoration(
                image: DecorationImage(image: AssetImage('${toppingImg[index]}')),
                color: Colors.white,
                borderRadius: BorderRadius.only(bottomLeft: Radius.circular(15), bottomRight: Radius.circular(15),topRight: Radius.circular(20), topLeft:  Radius.circular(20))
              ),
              width: double.infinity,height: 60
            ),
            Padding(
              padding:  EdgeInsets.only(top: 15),
              child: Row(

                children: [
                  Text('${toppingNames[index]}',style: TextStyle(fontFamily: 'Roboto',fontWeight: FontWeight.w700 ,fontSize: 10,color: Colors.white),textAlign: TextAlign.center,),
                  CircleAvatar(backgroundColor: Color(0xffEF2A39),minRadius: 12,child: Icon(Icons.add,color: Colors.white,),)
                ],
                mainAxisAlignment: MainAxisAlignment.spaceAround,
              ),
            ),

          ],
        ),

      );

    },
      itemCount: toppingNames.length,

    ),
  ),
   Padding(
     padding: const EdgeInsets.only(left: 15),
     child: Text('Side options',style: TextStyle(fontFamily: 'Roboto',fontWeight: FontWeight.w700 ,fontSize: 18)),
   ),
      Container(
        height: 140,
        child: GridView.builder(
          scrollDirection: Axis.horizontal,
          shrinkWrap: true,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 1 ),
          itemBuilder: (context, index) {
            return Card(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
              margin: EdgeInsets.only(top: 15,bottom: 15,left: 15,right: 10),
              elevation: 8,
              color: Colors.black,

              child: Column(
                children: [
                  Container(

                      decoration: BoxDecoration(
                          image: DecorationImage(image: AssetImage('${sideOptionImg[index]}')),
                          color: Colors.white,
                          borderRadius: BorderRadius.only(bottomLeft: Radius.circular(15), bottomRight: Radius.circular(15),topRight: Radius.circular(20), topLeft:  Radius.circular(20))
                      ),
                      width: double.infinity,height: 60
                  ),
                  Padding(
                    padding:  EdgeInsets.only(top: 15),
                    child: Row(

                      children: [
                        Text('${sideOption[index]}',style: TextStyle(fontFamily: 'Roboto',fontWeight: FontWeight.w700 ,fontSize: 10,color: Colors.white),textAlign: TextAlign.center,),
                        CircleAvatar(backgroundColor: Color(0xffEF2A39),minRadius: 12,child: Icon(Icons.add,color: Colors.white,),)
                      ],
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                    ),
                  ),

                ],
              ),

            );

          },
          itemCount: toppingNames.length,

        ),
      ),
       Row(
         mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only( left: 15),
                child: Text('Total',style: TextStyle(fontFamily: 'Roboto',fontWeight: FontWeight.w800 ,fontSize: 18),),
              ),
              Padding(
                padding: EdgeInsets.only( left: 15),
                child: Text('\$16.49 ',style: TextStyle(fontFamily: 'Roboto',fontWeight: FontWeight.bold ,fontSize: 36),),
              ),
            ],
          ),
          Container(
            padding: EdgeInsets.only(right: 15),
            width: 200,
            height: 65,
            child: TextButton(

              onPressed: () {
                print('click');
                //minus.png
              },
              style: ButtonStyle(
                shape: MaterialStatePropertyAll(RoundedRectangleBorder(borderRadius: BorderRadius.circular(20))),
                backgroundColor: MaterialStatePropertyAll(Color(0xffEF2A39)),
              ), child: Text('ORDER NOW',style: TextStyle(fontFamily: 'Roboto',fontWeight: FontWeight.w800 ,fontSize: 18,color: Colors.white),),


            ),
          ),



    ],
  ),

  ],),
),
    );
  }
}
