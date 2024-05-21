import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:footgo/config/app_color.dart';
import 'package:footgo/pages/commentpage.dart';
import 'package:footgo/pages/heartpage.dart';
import 'package:footgo/HomeScreenBloc/homescreen.dart';
import 'package:footgo/pages/userpage.dart';

class BottomNavigationBarScreen extends StatefulWidget {
  const BottomNavigationBarScreen({super.key});
  @override
  State<BottomNavigationBarScreen> createState() =>
      _BottomNavigationBarScreenState();
}

class _BottomNavigationBarScreenState extends State<BottomNavigationBarScreen> {
  final PageController pageController = PageController(initialPage: 0);
  int selectedIndex = 0;
  void onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
      pageController.jumpToPage(index);
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      resizeToAvoidBottomInset: false,
      extendBody: false,
      extendBodyBehindAppBar: false,
      floatingActionButton: Container(
        padding: const EdgeInsets.only(
          bottom: 10,
        ),
        child: FloatingActionButton(
          isExtended: false,
          elevation: 15,
          backgroundColor: Color(0xffEF2A39),
          shape: const CircleBorder(),
          onPressed: () {},
          child: Icon(
            Icons.add,
            color: AppColor.white,
            weight: 100,
          ),
        ),
      ),
      bottomNavigationBar: SizedBox(
        height: MediaQuery.of(context).viewInsets.bottom == 0 ? 90.sp : 0,
        child: BottomAppBar(
          color: AppColor.red,
          shape: const CircularNotchedRectangle(),
          notchMargin: 10.0.sp,
          clipBehavior: Clip.antiAlias,
          child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisSize: MainAxisSize.max,
              children: [
                Expanded(
                  child: InkWell(
                    splashFactory: NoSplash.splashFactory,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Image(
                            image: AssetImage('assets/images/home.png')),
                        SizedBox(height: 10,),
                        selectedIndex == 0 ? CircleAvatar(backgroundColor: Colors.white,radius: 2.0,): CircleAvatar(backgroundColor: Colors.white,radius: 0,),
                        SizedBox(height: 10,),
                      ],
                    ),
                    onTap: () {
                      onItemTapped(0);
                    },
                  ),
                ),
                Expanded(
                  child: InkWell(
                    splashFactory: NoSplash.splashFactory,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Image(
                            image: AssetImage('assets/images/user.png')),
                        SizedBox(height: 10,),
                        selectedIndex == 1 ? CircleAvatar(backgroundColor: Colors.white,radius: 2.0,): CircleAvatar(backgroundColor: Colors.white,radius: 0,),
                        SizedBox(height: 10,),
                      ],
                    ),
                    onTap: () {
                      onItemTapped(1);
                    },
                  ),
                ),
                Expanded(
                  child: InkWell(
                    splashFactory: NoSplash.splashFactory,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Image(
                            image: AssetImage('assets/images/comment.png')),
                        SizedBox(height: 10,),
                        selectedIndex == 2 ? CircleAvatar(backgroundColor: Colors.white,radius: 2.0,): CircleAvatar(backgroundColor: Colors.white,radius: 0,),
                        SizedBox(height: 10,),
                      ],
                    ),
                    onTap: () {
                      onItemTapped(2);
                    },
                  ),
                ),
                Expanded(
                  child: InkWell(
                    splashFactory: NoSplash.splashFactory,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Image(
                            image: AssetImage('assets/images/heart.png')),
                        SizedBox(height: 10,),
                        selectedIndex == 3 ? CircleAvatar(backgroundColor: Colors.white,radius: 2.0,): CircleAvatar(backgroundColor: Colors.white,radius: 0,),
                        SizedBox(height: 10,),

                      ],
                    ),
                    onTap: () {
                      onItemTapped(3);
                    },
                  ),
                ),
              ]),
        ),
      ),
      body: PageView(
        physics: const NeverScrollableScrollPhysics(),
        controller: pageController,
        children: const <Widget>[
          Center(
            child: HomeScreen(),
          ),
          Center(
            child: UserPage(),
          ),
          Center(
            child: CommentPage(),
          ),
          Center(
            child: HeartPage(),
          ),
        ],
      ),
    );
  }
}
