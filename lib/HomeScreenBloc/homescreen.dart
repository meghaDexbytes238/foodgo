/*
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:loginwithgoogle/product.dart';
import 'package:loginwithgoogle/productScreen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

// List <dynamic> productName = ['CheesBurger','Hamburger','Hamburger1','Hamburger2'];
// List productDetail = ["Wendy'y Burger","Veggle Burger",'Chicken Burger','Fried Chicken Burger'];
// List productRating = ["4.9","4.8",'4.6','4.5'];
// List productImg = ["assets/images/foodImg1png.png","assets/images/imagepng2.png",'assets/images/foodImgPng3.png',"assets/images/foodImgPng3.png"];
final List<Product> productsListForAll = [
  Product(productName: 'CheesBurger', productRating: "4.9", productDetail: "Wendy'y Burger", productImage: 'assets/images/foodImg1png.png', productprice: 8.24,),
  Product(productName: 'Hamburger', productRating: "4.8", productDetail: "Veggle Burger",productImage: "assets/images/imagepng2.png", productprice: 9.99 ),
  Product(productName: 'Hamburger', productRating: "4.6", productDetail: 'Chicken Burger',productImage: 'assets/images/foodImgPng3.png', productprice: 12.48),
  Product(productName: 'Hamburger', productRating: "4.5", productDetail: 'Fried Chicken Burger',productImage:'assets/images/foodImgPng3.png', productprice: 26.99),
  // Product(name: 'Product 5', price: 20.0, category: 'Category A'),
];
final List<Product> productsListForCombos = [
  Product(productName: 'CheesBurger1', productRating: "4.9", productDetail: "Wendy'y Burger", productImage: 'assets/images/foodImg1png.png', productprice: 8.24,),
  Product(productName: 'CheesBurger2', productRating: "4.8", productDetail: "Veggle Burger",productImage: "assets/images/imagepng2.png", productprice: 9.99 ),
  Product(productName: 'CheesBurger3', productRating: "4.6", productDetail: 'Chicken Burger',productImage: 'assets/images/foodImgPng3.png', productprice: 12.48),
  Product(productName: 'CheesBurger4', productRating: "4.5", productDetail: 'Fried Chicken Burger',productImage:'assets/images/foodImgPng3.png', productprice: 26.99),
  // Product(name: 'Product 5', price: 20.0, category: 'Category A'),
];
final List<Product> productsListForSliders = [
  Product(productName: 'Hamburger Veggle Burger1', productRating: "4.9", productDetail: "Wendy'y Burger", productImage: 'assets/images/foodImg1png.png', productprice: 8.24,),
  Product(productName: 'Hamburger Veggle Burger3', productRating: "4.8", productDetail: "Veggle Burger",productImage: "assets/images/imagepng2.png", productprice: 9.99 ),
  Product(productName: 'Hamburger Veggle Burger3', productRating: "4.6", productDetail: 'Chicken Burger',productImage: 'assets/images/foodImgPng3.png', productprice: 12.48),
  Product(productName: 'Hamburger Veggle Burger4', productRating: "4.5", productDetail: 'Fried Chicken Burger',productImage:'assets/images/foodImgPng3.png', productprice: 26.99),
  // Product(name: 'Product 5', price: 20.0, category: 'Category A'),
];
List choiceItemsList = ['All','Combos','Sliders','Combos'];

class _HomeScreenState extends State<HomeScreen> {
  late TextEditingController _searchController;
  late List<Product> filteredProductNames;
  late List<Product> filteredProductNamesForCombo;
  late List<Product> filteredProductNamesForSliders;

  double selectedPrice = 0.0;
  late TabController _tabController;
  int value = 0;
  bool forList = true;

  @override
  void initState() {
    super.initState();
    _searchController = TextEditingController();
    filteredProductNames = List.from(productsListForAll);
    filteredProductNamesForCombo = List.from(productsListForCombos);
    filteredProductNamesForSliders = List.from(productsListForSliders);

  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }
  int _selectedIndex = 0;
  bool isSelected = false;
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body:  Padding(
        padding:  const EdgeInsets.only(left: 15,right: 15,top: 15),
        child: Column(
          crossAxisAlignment:  CrossAxisAlignment.start,
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
                      filteredProductNames = productsListForAll
                          .where((product) => product.productName.toLowerCase().contains(value.toLowerCase()))
                          .toList();
                      filteredProductNamesForCombo = productsListForAll
                          .where((product) => product.productName.toLowerCase().contains(value.toLowerCase()))
                          .toList();
                      filteredProductNamesForSliders = productsListForAll
                          .where((product) => product.productName.toLowerCase().contains(value.toLowerCase()))
                          .toList();
                    });
                  },
                  // _onSearch,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 5,bottom: 30,top: 10),
              child: Wrap(

                direction: Axis.horizontal,
                alignment: WrapAlignment.start,
                spacing: 15,

                children: List<Widget>.generate(
                  4,
                      (int index) {
                    return ChoiceChip(
                      labelPadding: EdgeInsets.only(top: 4,bottom: 4,left: 7,right: 7),
                      //  pressElevation: 12,
                      side: BorderSide(color: Colors.transparent,width: 0),
                      elevation: value == index ? 10 : 0,
                      labelStyle: value == index ? TextStyle( color: Colors.white): TextStyle( color: Colors.black),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(13),side: BorderSide.none),
                      selectedShadowColor: Colors.grey ,
                      showCheckmark: false,
                      shadowColor: Colors.grey.shade200,
                      selectedColor: Color(0xffEF2A39),
                      backgroundColor: Colors.grey.shade500,
                      label: Text('${choiceItemsList[index]}'),
                      selected: value == index,
                      onSelected: (bool selected) {
                        setState(() {
                          forList = true;
                          value = (selected ? index : null)!;
                          print("index value is  $value");
                        });
                      },
                    );
                  },
                ).toList(),
              ),
            ),
            Expanded(
              child: GridView.builder(
                padding: EdgeInsets.only(bottom: 10),
                //shrinkWrap: true,
                //physics: NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 8.0,
                  mainAxisSpacing: 8.0,
                ),
                itemBuilder: (context, index) {
                  return GestureDetector(
                    child: Card(
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
                              child: Image(image: AssetImage('${ filteredProductNames[index].productImage}'),),

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
                            Text("${value == 0? filteredProductNames[index].productName : filteredProductNamesForCombo[index].productName }",style: TextStyle(fontWeight: FontWeight.bold,fontFamily: 'Roboto'),),
                            Text('${ value == 0 ? filteredProductNames[index].productDetail : filteredProductNamesForCombo[index].productDetail  }',style: TextStyle(fontFamily: 'Roboto'),),
                            // SizedBox(height: ,),
                            Row(
                              children: [
                                Image(image: AssetImage('assets/images/star.png')),
                                //  SizedBox(width: 2,),
                                Expanded (
                                  child: Text('${value == 0 ?filteredProductNames[index].productRating : filteredProductNamesForCombo[index].productRating }'),flex: 1,
                                ),
                                SvgPicture.asset('assets/images/heart.svg'),
                              ],
                            ),
                          ],
                        ),
                      ),
                      //Center(child: Text("${filteredProductNames[index].productName}")),
                    ),
                    onTap:  () {
                      print("price is : ${filteredProductNames[index].productprice}");
                      Navigator.push(context, MaterialPageRoute(builder: (context) => ProductScreen(price: filteredProductNames[index].productprice,),));
                    },
                  );
                },
                itemCount:  value == 0 ?  filteredProductNames.length : filteredProductNamesForCombo.length,
              ),
            ),
          ],
        ),
      ),





    );
  }

}
*/

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:footgo/product.dart';
import 'package:footgo/ProductBloc/productScreen.dart';
import 'package:footgo/widgets.dart';
import 'home_screen_bloc.dart';
import 'home_screen_event.dart';
import 'home_screen_state.dart';
import '../app_color.dart';
import '../app_string.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}
final List<Product> productsListForAll = [
  Product(
    productName: 'CheesBurger',
    productRating: "4.9",
    productDetail: "Wendy'y Burger",
    productImage: 'assets/images/foodImg1png.png',
    productprice: 8.24,
  ),
  Product(
      productName: 'Hamburger1',
      productRating: "4.8",
      productDetail: "Veggle Burger",
      productImage: "assets/images/imagepng2.png",
      productprice: 9.99),
  Product(
      productName: 'Hamburger2',
      productRating: "4.6",
      productDetail: 'Chicken Burger',
      productImage: 'assets/images/foodImgPng3.png',
      productprice: 12.48),
  Product(
      productName: 'Hamburger3',
      productRating: "4.5",
      productDetail: 'Chicken Burger',
      productImage: 'assets/images/foodImg1png.png',
      productprice: 26.99),
];
final List<Product> productsListForCombos = [
  Product(
    productName: 'CheesBurger1',
    productRating: "4.9",
    productDetail: "Wendy'y Burger",
    productImage: 'assets/images/foodImg1png.png',
    productprice: 8.24,
  ),
  Product(
      productName: 'CheesBurger2',
      productRating: "4.8",
      productDetail: "Veggle Burger",
      productImage: "assets/images/imagepng2.png",
      productprice: 9.99),
  Product(
      productName: 'CheesBurger3',
      productRating: "4.6",
      productDetail: 'Chicken Burger',
      productImage: 'assets/images/foodImgPng3.png',
      productprice: 12.48),
  Product(
      productName: 'CheesBurger4',
      productRating: "4.5",
      productDetail: 'Fried  Burger',
      productImage: 'assets/images/foodImgPng3.png',
      productprice: 26.99),
];
final List<Product> productsListForSliders = [
  Product(
    productName: 'Hamburger Veggle Burger1',
    productRating: "4.9",
    productDetail: "Wendy'y Burger",
    productImage: 'assets/images/foodImg1png.png',
    productprice: 8.24,
  ),
  Product(
      productName: 'Hamburger Veggle Burger3',
      productRating: "4.8",
      productDetail: "Veggle Burger",
      productImage: "assets/images/imagepng2.png",
      productprice: 9.99),
  Product(
      productName: 'Hamburger Veggle Burger3',
      productRating: "4.6",
      productDetail: 'Chicken Burger',
      productImage: 'assets/images/foodImgPng3.png',
      productprice: 12.48),
  Product(
      productName: 'Hamburger Veggle Burger4',
      productRating: "4.5",
      productDetail: 'Fried Burger',
      productImage: 'assets/images/foodImgPng3.png',
      productprice: 26.99),
];
List choiceItemsList = ['All', 'Combos', 'Sliders'];
class _HomeScreenState extends State<HomeScreen> {
  TextEditingController searchController = TextEditingController();
  List<Product> filteredProductNames = [];
  List<Product> filteredProductNamesForCombo = [];
  List<Product> filteredProductNamesForSliders = [];
  List blankList = [];
  bool heartIs = false;
  double selectedPrice = 0.0;
  int value = 0;
  bool forList = true;
  int selectedIndex = 0;
  @override
  void initState() {
    super.initState();
    filteredProductNames = List.from(productsListForAll);
  }
  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }
  bool isSelected = false;
  void filterProducts(String query) {
    List<Product> originalList;
    if (selectedIndex == 0) {
      originalList = productsListForAll;
    } else if (selectedIndex == 1) {
      originalList = productsListForCombos;
    } else {
      originalList = productsListForSliders;
    }
    setState(() {
      filteredProductNames = originalList
          .where((product) =>
              product.productName.toLowerCase().contains(query.toLowerCase()))
          .toList();
    });
  }
  HomeScreenBloc homeBloc = HomeScreenBloc();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(
            right: 15,
            left: 15,
          ),
          child: BlocConsumer(
            bloc: homeBloc,
            builder: (BuildContext context, state) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      header(),
                      AllWidgets.customText(
                          data: AppString.favouriteOrder,
                          fontWeight: FontWeight.w400,
                          fontFamily: 'Poppins',
                          fontSize: 18.sp)
                    ],
                  ),
                  space(),
                  Row(
                    children: [
                      Expanded(
                        child: searchBar(
                          searchController: searchController,
                          onChanged: (value) {
                            filterProducts(value);
                          },
                        ),
                      ),
                      settingButton(),
                    ],
                  ),
                  space(),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 5, bottom: 30, top: 10),
                    child: Wrap(
                      direction: Axis.horizontal,
                      alignment: WrapAlignment.start,
                      spacing: 15,
                      children: List<Widget>.generate(
                        choiceItemsList.length,
                        (int index) {
                          return ChoiceChip(
                            labelPadding: const EdgeInsets.symmetric(
                                horizontal: 12, vertical: 4),
                            side: const BorderSide(
                                color: Colors.transparent, width: 0),
                            elevation: selectedIndex  == index ? 10 : 0,
                            labelStyle: selectedIndex == index
                                ? const TextStyle(color: Colors.white)
                                : TextStyle(color: AppColor.textGrey),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15),
                                side: BorderSide.none),
                            selectedShadowColor: Colors.grey,
                            showCheckmark: false,
                            shadowColor: AppColor.greyShadow,
                            selectedColor: AppColor.red,
                            backgroundColor: AppColor.lightGrey,
                            label: Text('${choiceItemsList[index]}'),
                            selected: selectedIndex == index,
                            onSelected: (bool selected) {
                             // homeBloc.add(LoadedChipsListEvent(index: index));
                              setState(() {
                                 selectedIndex = index;
                                filterProducts(searchController.text);
                              });

                            },
                          );
                        },
                      ).toList(),
                    ),
                  ),
                  Expanded(
                    child: GridView.builder(
                      padding: const EdgeInsets.only(bottom: 10),
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 8.0,
                        mainAxisSpacing: 8.0,
                       childAspectRatio: 2/3,
                      ),
                      itemBuilder: (context, index) {
                        return card(index: index);
                        //   Card(
                        //   semanticContainer: true,
                        //   elevation: 8,
                        //   shadowColor: AppColor.greyShadowCard,
                        //   surfaceTintColor: AppColor.white,
                        //   shape: RoundedRectangleBorder(
                        //       borderRadius: BorderRadius.circular(30)),
                        //   child: Padding(
                        //     padding: const EdgeInsets.only(
                        //       left: 15,
                        //       right: 10,
                        //     ),
                        //     child: Column(
                        //       children: [
                        //         GestureDetector(
                        //           child: Column(
                        //             crossAxisAlignment:
                        //                 CrossAxisAlignment.start,
                        //             children: [
                        //               Container(
                        //                 decoration: BoxDecoration(
                        //                     image: DecorationImage(
                        //                         image: AssetImage(
                        //                             filteredProductNames[index].productImage))),
                        //                 height: 70.sp,
                        //               ),
                        //               AllWidgets.customText(
                        //                   data:
                        //                       filteredProductNames[index].productName,
                        //                   fontWeight: FontWeight.bold,
                        //                   fontSize: 15.sp),
                        //               AllWidgets.customText(
                        //                   data:
                        //                       filteredProductNames[index].productDetail,
                        //                   fontSize: 15.sp),
                        //             ],
                        //           ),
                        //           onTap: () {
                        //             homeBloc.add(HomeScreenNavigateEvent(
                        //                 pri: filteredProductNames[index]
                        //                     .productprice));
                        //           },
                        //         ),
                        //         heartButton(index: index,onPressed: () {
                        //           setState(() {
                        //             if (blankList.contains(
                        //                 filteredProductNames[index]
                        //                     .productName
                        //                     .toString())) {
                        //               blankList.remove(
                        //                   filteredProductNames[index]
                        //                       .productName
                        //                       .toString());
                        //             } else {
                        //               blankList.add(
                        //                   filteredProductNames[index]
                        //                       .productName
                        //                       .toString());
                        //             }
                        //           });
                        //         },),
                        //       /*  Row(
                        //           children: [
                        //             const Image(
                        //                 image: AssetImage(
                        //                     'assets/images/star.png')),
                        //             const SizedBox(
                        //               width: 5,
                        //             ),
                        //             Expanded(
                        //               flex: 1,
                        //               child: AllWidgets.customText(
                        //                   data:
                        //                       filteredProductNames[index].productRating,
                        //                   fontWeight: FontWeight.bold,
                        //                   fontSize: 15),
                        //             ),
                        //             IconButton(
                        //               onPressed: () {
                        //                 setState(() {
                        //                   if (blankList.contains(
                        //                       filteredProductNames[index]
                        //                           .productName
                        //                           .toString())) {
                        //                     blankList.remove(
                        //                         filteredProductNames[index]
                        //                             .productName
                        //                             .toString());
                        //                   } else {
                        //                     blankList.add(
                        //                         filteredProductNames[index]
                        //                             .productName
                        //                             .toString());
                        //                   }
                        //                 });
                        //               },
                        //               icon: !(blankList.contains(
                        //                       filteredProductNames[index]
                        //                           .productName
                        //                           .toString()))
                        //                   ? SvgPicture.asset(
                        //                       'assets/images/heart.svg')
                        //                   : const Icon(CupertinoIcons.heart_fill,
                        //                       color: Colors.red),
                        //               //child:
                        //             ),
                        //           ],
                        //         ),*/
                        //       ],
                        //     ),
                        //   ),
                        // );
                      },
                      itemCount: value == 0
                          ? filteredProductNames.length
                          : filteredProductNamesForCombo.length,
                    ),
                  ),
                ],
              );
            },
            listener: (BuildContext context, Object? state) {
              if (state is HomeScreenNavigateToScreenState) {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (BuildContext context) {
                  return ProductScreen(price: state.price);
                }));
              }
            },

            // child:
          ),
        ),
      ),
    );
  }
  Widget space({double? height,width}) {
    return SizedBox(
      height: height ?? 30.sp,
      width: width,
    );
  }
  Widget header() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        AllWidgets.customText(
            data: AppString.projectName,
            fontWeight: FontWeight.w400,
            fontFamily: 'Lobster',
            fontSize: 45.sp),
        Container(
          width: 60.sp,
          height: 60.sp,
          decoration: const BoxDecoration(
              color: Colors.blue,
              image: DecorationImage(
                  image: AssetImage(
                    'assets/images/profilePhoto.png',
                  ),
                  fit: BoxFit.cover),
              shape: BoxShape.rectangle,
              borderRadius: BorderRadius.all(Radius.circular(20))),
        )
      ],
    );
  }
  Widget searchBar(
      {Function(String)? onChanged,
      required TextEditingController searchController}) {
    return Container(
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5), //color of shadow
            blurRadius: 7, // blur radius
            offset: const Offset(0, 1),
          ),
        ],
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.circular(15),
        color: Colors.red,
      ),
      child: TextField(
          controller: searchController,
          decoration: InputDecoration(
            filled: true,
            border: InputBorder.none,
            fillColor: AppColor.white,
            hintText: 'Search',
            prefixIcon: const Icon(Icons.search),
          ),
          onChanged: onChanged
          //     (value) {
          //   filterProducts(value);
          // },
          // _onSearch,
          ),
    );
  }

  Widget settingButton() {
    return Container(
      margin: const EdgeInsets.only(left: 15),
      height: 47.sp,
      width: 47.sp,
      child: IconButton.filledTonal(
        onPressed: () {},
        icon: const Padding(
          padding: EdgeInsets.all(6),
          child: Image(
            image: AssetImage(
              'assets/images/settings-sliders.png',
            ),
          ),
        ),
        style: ButtonStyle(
          shape: MaterialStatePropertyAll(
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15))),
          backgroundColor: MaterialStatePropertyAll(AppColor.red),
        ),
      ),
    );
  }

  Widget heartButton({ required int index ,required Function()? onPressed }){
    return Row(
      children: [
        const Image(
            image: AssetImage(
                'assets/images/star.png')),
        SizedBox(width: 3,),
        Expanded(
          flex: 1,
          child: AllWidgets.customText(
              data:
              filteredProductNames[index].productRating,
              fontWeight: FontWeight.bold,
              fontSize: 15),
        ),
        IconButton(
          onPressed: onPressed,
          //     () {
          //   setState(() {
          //     if (blankList.contains(
          //         filteredProductNames[index]
          //             .productName
          //             .toString())) {
          //       blankList.remove(
          //           filteredProductNames[index]
          //               .productName
          //               .toString());
          //     } else {
          //       blankList.add(
          //           filteredProductNames[index]
          //               .productName
          //               .toString());
          //     }
          //   });
          // },
          icon: !(blankList.contains(
              filteredProductNames[index]
                  .productName
                  .toString()))
              ? SvgPicture.asset(
              'assets/images/heart.svg')
              : const Icon(CupertinoIcons.heart_fill,
              color: Colors.red),
          //child:
        ),
      ],
    );
  }
  Widget card({required int index}){
    return Card(
      semanticContainer: true,
      elevation: 8,
      shadowColor: AppColor.greyShadowCard,
      surfaceTintColor: AppColor.white,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30)),
      child: Padding(
        padding: const EdgeInsets.only(
          left: 15,
          right: 10,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            GestureDetector(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment:
                CrossAxisAlignment.start,
                children: [
                  Container(
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage(
                                filteredProductNames[index].productImage),)),
                   height: 120.sp,
                  ),
                  AllWidgets.customText(
                      data:
                      filteredProductNames[index].productName,
                      fontWeight: FontWeight.bold,
                      fontSize: 15.sp),
                  AllWidgets.customText(
                      data:
                      filteredProductNames[index].productDetail,
                      fontSize: 15.sp),
                ],
              ),
              onTap: () {
                homeBloc.add(HomeScreenNavigateEvent(
                    pri: filteredProductNames[index]
                        .productprice));
              },
            ),
           // const Spacer(flex: 1,),
            heartButton(index: index,onPressed: () {
              setState(() {
                if (blankList.contains(
                    filteredProductNames[index]
                        .productName
                        .toString())) {
                  blankList.remove(
                      filteredProductNames[index]
                          .productName
                          .toString());
                } else {
                  blankList.add(
                      filteredProductNames[index]
                          .productName
                          .toString());
                }
              });
            },),
           // const Spacer(flex: 1,),
          ],
        ),
      ),
    );
  }
}
