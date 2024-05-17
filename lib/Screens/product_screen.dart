import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ProductScreen extends StatefulWidget {
  const ProductScreen({super.key});

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  double _currentValue = 0;

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

body: Column(
  children: [
    Container(
      height: MediaQuery.of(context).size.height/3,width: MediaQuery.of(context).size.width,
      child: Row(
        children: [
          Expanded(
            child: Container(
              alignment: Alignment.centerLeft,
             //   height: 297,
             // width: MediaQuery.of(context).size.width/2.5,
                decoration: BoxDecoration(
                    color: Colors.blue,
                  image: DecorationImage(
                    image: AssetImage('assets/images/pngwingImg.png')
                  )
                ),
                ),
          ),
          Container(
            padding: EdgeInsets.only(right: 15),
            color: Colors.grey,
            width: MediaQuery.of(context).size.width/2.5,

              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Customize Your Burger to Your Tastes. Ultimate Experience',style: TextStyle(fontFamily: 'Roboto',),maxLines: 5,softWrap: true,),
                // SizedBox(height: 40,),
                  Text('Spicy',style: TextStyle(fontFamily: 'Roboto',fontWeight: FontWeight.w700 ,fontSize: 14)),
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                      trackHeight: 6,

                   minThumbSeparation: 20,
                   rangeTrackShape: RectangularRangeSliderTrackShape(),
                      activeTickMarkColor:Colors.white,
                      inactiveTickMarkColor:Colors.white,
                      overlayColor: Colors.white,
                      valueIndicatorShape: PaddleSliderValueIndicatorShape(),

                    ),
                    child:
                    Container(
                      width: MediaQuery.of(context).size.width,
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
                  
                  

                  SizedBox(height: 40,),
                  Text('Portion',style: TextStyle(fontFamily: 'Roboto',fontWeight: FontWeight.w500 ,fontSize: 14)),



Padding(
  padding: const EdgeInsets.only(left: 5,right: 5),
  child: Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      IconButton.filledTonal(
        onPressed: () {
          print('click');
          //minus.png
        },
        icon:
        Icon(Icons.remove,color: Colors.white,),
        style: ButtonStyle(
          shape: MaterialStatePropertyAll(RoundedRectangleBorder(borderRadius: BorderRadius.circular(12))),
          backgroundColor: MaterialStatePropertyAll(Color(0xffEF2A39)),
        ),

      ),
      Text('2',style: TextStyle(fontFamily: 'Roboto',fontWeight: FontWeight.w500 ,fontSize: 18)),
      IconButton.filledTonal(

          onPressed: () {
  print('click');
      }, icon: Icon(Icons.add,color: Colors.white,),
  style: ButtonStyle(
      shape: MaterialStatePropertyAll(RoundedRectangleBorder(borderRadius: BorderRadius.circular(12))),

      backgroundColor: MaterialStatePropertyAll(Color(0xffEF2A39)),


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
  ],
),


    );
  }
}
