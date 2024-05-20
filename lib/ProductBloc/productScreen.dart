/*
import 'package:flutter/material.dart';

class ProductScreen extends StatefulWidget {
  const ProductScreen({super.key});

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}
double _currentSliderValue = 1;

class _ProductScreenState extends State<ProductScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Text('Spicy'),
          Container(
            color: Color.fromARGB(255, 255, 115, 0),
            child: Theme(
              data: Theme.of(context).copyWith(
                sliderTheme: SliderThemeData(
                  thumbShape: SquareSliderComponentShape(),
                 // trackShape: MyRoundedRectSliderTrackShape(),
                ),
              ),
              child: Slider(
                onChanged: (value) => setState(() => _currentSliderValue = value),
                value: _currentSliderValue,
                min: 0,
                max: 100,
                activeColor: Colors.black,
                inactiveColor: const Color.fromARGB(255, 230, 209, 138),
              ),
            ),
          ),



          SliderTheme(
            data:
            SliderTheme.of(context).copyWith(
                  activeTrackColor: Colors.green,
                  thumbShape: RoundSliderThumbShape(enabledThumbRadius: 15.0),
                  overlayShape: RoundSliderOverlayShape(overlayRadius: 30.0),
                ),
            child: Slider(
              value: _currentSliderValue,
              onChanged: (val) {
                _currentSliderValue = val;
                setState(() {});
              },
            ),
          ),

          Slider(
            activeColor: Colors.red,
           // divisions: 10,
            min: 1,
            max: 100,
            value: _currentSliderValue,
           // label: _currentSliderValue.round().toString(),
            onChanged: (double value) {
              setState(() {
                _currentSliderValue = value;
              });
            },
          ),
          Padding(
            padding: const EdgeInsets.only(right: 10,left: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [Text('Mild',style: TextStyle(color: Colors.green),),
              Text('Hot',style: TextStyle(color: Colors.red),),
            ],),
          )
        ],
      ),
    );
  }
}
class SquareSliderComponentShape extends SliderComponentShape {
  @override
  Size getPreferredSize(bool isEnabled, bool isDiscrete) {
    return const Size(20, 30);
  }

  @override
  void paint(PaintingContext context, Offset center,
      {required Animation<double> activationAnimation,
        required Animation<double> enableAnimation,
        required bool isDiscrete,
        required TextPainter labelPainter,
        required RenderBox parentBox,
        required SliderThemeData sliderTheme,
        required TextDirection textDirection,
        required double value,
        required double textScaleFactor,
        required Size sizeWithOverflow}) {
    final Canvas canvas = context.canvas;
    canvas.drawShadow(
        Path()
          ..addRRect(RRect.fromRectAndRadius(
            Rect.fromCenter(center: center, width: 24, height: 30),
            const Radius.circular(4),
          )),
        Colors.black,
        5,
        false);
    canvas.drawRRect(
      RRect.fromRectAndRadius(
        Rect.fromCenter(center: center, width: 20, height: 30),
        const Radius.circular(4),
      ),
      Paint()..color = Colors.amber,
    );
  }
}*/



import 'package:flutter/cupertino.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:footgo/widgets.dart';

import 'product_bloc.dart';
import 'product_event.dart';
import '../app_color.dart';
import '../app_string.dart';


class ProductScreen extends StatefulWidget {
  final double price;
  //final List getList;
   ProductScreen({super.key, required this.price,});

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}
List toppingNames = ['Tomato','Onions','Pickles','Bacons','Tomato'];
List sideOption = ['Fries','Coleslaw','Salad','Onion','Fries'];
List toppingImg = ['assets/images/tomoto.png','assets/images/onion.png','assets/images/pickles.png','assets/images/Bacons.png','assets/images/tomoto.png'];
List sideOptionImg = ['assets/images/firies.png','assets/images/Coleslaw.png','assets/images/salad.png','assets/images/OnionFreid.png','assets/images/firies.png'];


class _ProductScreenState extends State<ProductScreen> {
  ProductBloc bloc = ProductBloc();
  double _currentValue = 0;
  int value = 1;
  double finalPrice= 0.0;
  @override
  void initState() {
    finalPrice = widget.price;
    setState(() {
    });
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(onPressed: () {
          Navigator.pop(context);
        }, icon: const Image(image: AssetImage('assets/images/Vector.png'),)),
        actions: const [Padding(
          padding: EdgeInsets.only(right: 15),
          child: Image(image: AssetImage('assets/images/search.png'),),
        )],
      ),
      body: BlocBuilder(
        bloc: bloc,
        builder: (BuildContext context, state) {
          return SingleChildScrollView(
            scrollDirection: Axis.vertical,
            physics: AlwaysScrollableScrollPhysics(),
            child: Padding(
              padding: const EdgeInsets.only(left: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
color: Colors.purple,
                    height: MediaQuery.of(context).size.height/2.9,
                    width: MediaQuery.of(context).size.width,
                    child: Row(
                      children: [
                        Expanded(
                          child: Container(
                            margin: EdgeInsets.only( right: 50.sp),
                            alignment: Alignment.centerLeft,
                            decoration: const BoxDecoration(
                                color: Colors.red,
                                image: DecorationImage(
                                    image: AssetImage('assets/images/pngwingImg.png'),fit: BoxFit.fill
                                )
                            ),
                          ),
                        ),
                        Container(
                          color: Colors.blue,
                            padding: EdgeInsets.only(right: 15),
                            width: MediaQuery.of(context).size.width/2.5,
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                textSpan(),
                                space(height: 20),
                                AllWidgets.customText(data: AppString.spicy,fontWeight: FontWeight.w700 ,fontSize: 14),
                                space(height: 15.sp),
                                slider(),
                                space(height: 10.sp),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    AllWidgets.customText(data: AppString.mild,color: AppColor.green,fontFamily: 'Roboto',fontWeight: FontWeight.w800 ,fontSize: 12.sp),
                                    AllWidgets.customText(data: AppString.hot,color: AppColor.red,fontFamily: 'Roboto',fontWeight: FontWeight.w800 ,fontSize: 12.sp),
                                  ],
                                ),
                                space(height: 10.sp),
                                AllWidgets.customText(data: AppString.portion,fontSize: 14.sp,fontWeight: FontWeight.w500 ),
                                space(height: 10.sp),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    AllWidgets. customButton(icon: Icons.remove, onPressed: () {
                                      bloc.add(ProductSelectDecreamentEvent(totalDecPri: widget.price));
                                    }),
                                   AllWidgets.customText(data: bloc.value.toString(),fontSize: 18.sp,fontWeight: FontWeight.w500 ),
                                  AllWidgets.customButton(icon: Icons.add, onPressed: () {
                                      bloc.add(ProductSelectIncreamentEvent(totalIncPri: widget.price));
                                    }),
                                  ],
                                )
                              ],
                            ))
                      ],
                    ),
                  ),
                  space(),
                  AllWidgets.customText(data:AppString.toppings,fontSize: 18,fontWeight: FontWeight.w700 ),
                  SizedBox(
                    height: 145.sp,
                    child: AllWidgets.buildGridview(img: toppingImg, name: toppingNames)
                  ),
                  AllWidgets.customText(data:AppString.sideOption,fontSize: 18,fontWeight: FontWeight.w700 ),
                  SizedBox(
                    height: 145.sp,
                    child: AllWidgets.buildGridview(img: sideOptionImg, name: sideOption)
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          AllWidgets.customText(data: AppString.total,fontSize: 18.sp,fontWeight: FontWeight.w800 ),
                          Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(top: 8),
                                child: AllWidgets.customText(data: AppString.dSign, color: AppColor.red,fontSize: 20.sp,fontWeight: FontWeight.w900 ,textAlign: TextAlign.end),
                              ),
                              AllWidgets.customText(
                                  data:
                                (  bloc.totalPrice == 0.0)?
                                 finalPrice.toString() : bloc.totalPrice.toStringAsFixed(2),
                                  fontSize: 36.sp,fontWeight: FontWeight.bold ),
                            ],
                          ),
                        ],
                      ),
                      orderButton(),
                    ],
                  ),
                ],),
            ),
          );
        },
      ),
    );
  }
Widget slider(){
    return SliderTheme(
      data: SliderTheme.of(context).copyWith(
          trackHeight: 7,
          thumbShape: const RoundSliderThumbShape(enabledThumbRadius: 8.0,),
          overlayShape: SliderComponentShape.noOverlay
      ),
      child:
      SizedBox(
        width: double.infinity,
        child: Slider(
          activeColor: AppColor.red,
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
    );
}
  Widget space({double? height}) {
    return SizedBox(
      height: height ?? 30,
    );
  }
Widget textSpan(){
    return RichText(
      maxLines: 4,
      text: TextSpan(
        text: AppString.customize,
        style: TextStyle(fontWeight: FontWeight.bold,fontFamily: 'Roboto',color: AppColor.black,),
        children:  <TextSpan>[
          TextSpan(text: AppString.detail,style: const TextStyle(fontWeight: FontWeight.normal)),
        ],
      ),
    );
}
Widget orderButton(){
    return   Container(
      padding: const EdgeInsets.only(right: 15),
      width: MediaQuery.of(context).size.width/1.8,
      height: 70.sp,
      child: TextButton(
          onPressed: () {
          },
          style: ButtonStyle(
            shape: MaterialStatePropertyAll(RoundedRectangleBorder(borderRadius: BorderRadius.circular(20))),
            backgroundColor: MaterialStatePropertyAll(AppColor.red),
          ), child: AllWidgets.customText(data: AppString.order,fontWeight: FontWeight.w800,fontSize: 18.sp,color: AppColor.white)
      ),
    );
}

}
