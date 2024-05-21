
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'config/app_color.dart';

abstract class AllWidgets {

  static Widget customText(
      {required String data,
        double? fontSize,
        String? fontFamily,
        FontWeight? fontWeight,
        TextAlign? textAlign,Color? color}) {
    return Text(
      data,
      textAlign: textAlign,

      maxLines: 2,
      textHeightBehavior: TextHeightBehavior(applyHeightToFirstAscent: true),
      softWrap: true,

      overflow: TextOverflow.fade,
      style: TextStyle(
        fontSize: fontSize ?? 10,
        fontWeight: fontWeight ?? FontWeight.normal,
        fontFamily: fontFamily ?? 'Roboto',
        color: color ?? AppColor.black
      ),
    );
  }

  static Widget buildGridview({required List img,required List name}){
    return  GridView.builder(
      scrollDirection: Axis.horizontal,
      shrinkWrap: true,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 1,mainAxisSpacing: 20 ,childAspectRatio: 4/3),
      itemBuilder: (context, index) {
        return Card(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          margin: EdgeInsets.only(top: 15,bottom: 15,right: 10),
          elevation: 8,
          color: AppColor.black,
          child: Column(
            children: [
              Container(
                  decoration: BoxDecoration(
                      image: DecorationImage(image: AssetImage('${img[index]}',),),
                      color: Colors.white,
                      borderRadius: const BorderRadius.only(bottomLeft: Radius.circular(15), bottomRight: Radius.circular(15),topRight: Radius.circular(20), topLeft:  Radius.circular(20))
                  ),
                  width: double.infinity,
                  height: 70.sp
              ),
              Padding(
                padding:  const EdgeInsets.only(top: 13),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    AllWidgets.customText(data:name[index],fontSize: 10.sp,fontWeight: FontWeight.w700 ,color: AppColor.white,textAlign: TextAlign.center),
                    CircleAvatar(backgroundColor: AppColor.red,minRadius: 9.sp,child: Icon(Icons.add,color: Colors.white,size: 12.sp,weight: 30,),)
                  ],
                ),
              ),
            ],
          ),

        );

      },
      itemCount: name.length,

    );
  }
 static Widget customButton({required IconData icon , required void Function()? onPressed}){
    return  Container(
      child: IconButton.filledTonal(
        onPressed: onPressed,
        icon:  Icon(icon,color: AppColor.white,),
        style: ButtonStyle(
          shape: MaterialStatePropertyAll(RoundedRectangleBorder(borderRadius: BorderRadius.circular(12))),
          backgroundColor: MaterialStatePropertyAll(AppColor.red),
        ),
      ),
      decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: AppColor.borderShadowYellow,offset: Offset(0, 3),
              blurRadius: 6,
            ),
          ],
          borderRadius: BorderRadius.all(Radius.circular(10))
      ),
    );
  }


}