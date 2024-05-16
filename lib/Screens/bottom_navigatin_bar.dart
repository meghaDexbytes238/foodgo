import 'package:flutter/material.dart';
import 'package:footgo/Screens/comment_screen.dart';
import 'package:footgo/Screens/user_screen.dart';

import 'Homemenu_screen.dart';
import 'heart_screen.dart';

class BottomNavigationBar extends StatefulWidget {
  const BottomNavigationBar({super.key});

  @override
  State<BottomNavigationBar> createState() => _BottomNavigationBarState();
}
int selectedIndex = 0;
List screensList = [HomeMenuScreen(),UserScreen(),CommentScreen(),HeartScreen(),];
class _BottomNavigationBarState extends State<BottomNavigationBar> {
  void _onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
  }
  @override
  Widget build(BuildContext context) {
    return
      Scaffold(
        backgroundColor: Colors.transparent,
        extendBody: true,
        body: screensList[selectedIndex],
        bottomNavigationBar: Container(
          height: 80,
          decoration: BoxDecoration(
            color: Color(0xFF091522).withOpacity(0.5),
            borderRadius: BorderRadius.only(topLeft: Radius.circular(40),topRight: Radius.circular(40)),
          ),
          child: BottomNavigationBar(
            backgroundColor: Colors.transparent,
            showUnselectedLabels: true,
            showSelectedLabels: true,
            useLegacyColorScheme: true,
            items: [
              BottomNavigationBarItem(
                icon: SvgPicture.asset('assets/image/homeIcon.svg'),
                activeIcon: SvgPicture.asset('assets/image/homeIcon.svg',color:  Color(0xFF11DCE8),),
                label: 'Home',

              ),
              BottomNavigationBarItem(
                //icon: Icon(Icons.heart),
                icon: SvgPicture.asset('assets/image/heartsvg.svg'),
                activeIcon: SvgPicture.asset('assets/image/heartsvg.svg',color:  Color(0xFF11DCE8),),
                // icon: Image.asset('assets/image/hearticojn.png',),
                label: 'Favourites',
              ),
              BottomNavigationBarItem(
                icon: SvgPicture.asset('assets/image/more.svg'),
                activeIcon: SvgPicture.asset('assets/image/more.svg',color:  Color(0xFF11DCE8) ,),
                //  icon: Image.asset('assets/image/moreicon.png',),
                label: 'More',
              ),
            ],
            currentIndex: selectedIndex,
            onTap: _onItemTapped,
            // onTap: (value) {
            //   return setState(() {
            //     selectedIndex = value;
            //   });
            // },
            type: BottomNavigationBarType.fixed,
            //enableFeedback: true,
            selectedIconTheme: const IconThemeData( color: Color(0xFF11DCE8) ),
            selectedItemColor: Colors.white,
            unselectedIconTheme: const IconThemeData( color: Colors.white),
            unselectedItemColor: Color(0xFF8D8E99),
          ),
        ),
      );
  }
}
