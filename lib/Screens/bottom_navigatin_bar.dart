import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:footgo/Screens/comment_screen.dart';
import 'package:footgo/Screens/home_screen.dart';
import 'package:footgo/Screens/user_screen.dart';
import 'package:flutter/material.dart';
import 'Homemenu_screen.dart';
import 'heart_screen.dart';




/*
class BottomNavigationbarforItems extends StatefulWidget {
  @override
  State<BottomNavigationbarforItems> createState() => _BottomNavigationbarforItemsState();
}
int selectedIndex = 0;
List screensList = [LoginScreen(),HeartScreen(),HomeScreen(),HeartScreen()];
class _BottomNavigationbarforItemsState extends State<BottomNavigationbarforItems> {
  void _onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton:FloatingActionButton(
        backgroundColor: Colors.red,
        shape: CircleBorder(),//Floating action button on Scaffold
        onPressed: (){
          //code to execute on button press
        },
        child: Icon(Icons.add,color: Colors.white), //icon inside button
      ),

      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      //floating action button position to center

      bottomNavigationBar: BottomAppBar(
        //bottom navigation bar on scaffold
        color:Colors.redAccent,
        height: 80,
        shape: CircularNotchedRectangle(), //shape of notch
        notchMargin: 5, //notche margin between floating button and bottom appbar
        child:TabBarView(children: [
          IconButton(icon: Icon(Icons.menu, color: Colors.white,), onPressed: () {

          },),
          IconButton(icon: Icon(Icons.search, color: Colors.white,), onPressed: () {
           // Navigator.push(context, MaterialPageRoute(builder: (context) => HomeScreen() ,));
          },),
          IconButton(icon: Icon(Icons.print, color: Colors.white,), onPressed: () {
           // Navigator.push(context, MaterialPageRoute(builder: (context) => HeartScreen() ,));
          },),
          IconButton(icon: Icon(Icons.people, color: Colors.white,), onPressed: () {

          //  Navigator.push(context, MaterialPageRoute(builder: (context) => HomeScreen() ,));
          },),
        ],
         // controller: TabController(length: , vsync: vsync),
        ),
       // Row( //children inside bottom appbar
       //    mainAxisSize: MainAxisSize.max,
       //    mainAxisAlignment: MainAxisAlignment.spaceBetween,
       //    children: <Widget>[
       //      IconButton(icon: Icon(Icons.menu, color: Colors.white,), onPressed: () {
       //        Navigator.push(context, MaterialPageRoute(builder: (context) => LoginScreen() ,));
       //      },),
       //      IconButton(icon: Icon(Icons.search, color: Colors.white,), onPressed: () {
       //        Navigator.push(context, MaterialPageRoute(builder: (context) => HomeScreen() ,));
       //      },),
       //      IconButton(icon: Icon(Icons.print, color: Colors.white,), onPressed: () {
       //        Navigator.push(context, MaterialPageRoute(builder: (context) => HeartScreen() ,));
       //      },),
       //      IconButton(icon: Icon(Icons.people, color: Colors.white,), onPressed: () {
       //        Navigator.push(context, MaterialPageRoute(builder: (context) => HomeScreen() ,));
       //      },),
        //  ],
        ),
     // ),
    );

//     return Scaffold(
//       backgroundColor: Colors.transparent,
//       extendBody: true,
//       body: screensList[selectedIndex],
//       bottomNavigationBar: Container(
//         height: 80,
//         decoration: BoxDecoration(
//           color: Color(0xFF091522).withOpacity(0.5),
//           borderRadius: BorderRadius.only(topLeft: Radius.circular(40),topRight: Radius.circular(40)),
//         ),
//         child: BottomNavigationBar(
//           backgroundColor: Colors.transparent,
//           showUnselectedLabels: true,
//           showSelectedLabels: true,
//           useLegacyColorScheme: true,
//           items: [
//             BottomNavigationBarItem(
//               icon: Icon(Icons.home_filled),
//              // activeIcon: SvgPicture.asset('assets/image/homeIcon.svg',color:  Color(0xFF11DCE8),),
//               label: 'Home',
//
//             ),
//             BottomNavigationBarItem(
//               //icon: Icon(Icons.heart),
//               icon: Icon(Icons.supervised_user_circle),
// //              // icon: Image.asset('assets/image/hearticojn.png',),
//               label: 'Favourites',
//             ),
//             BottomNavigationBarItem(
//               icon: Icon(Icons.comment),
//             //  activeIcon: SvgPicture.asset('assets/image/more.svg',color:  Color(0xFF11DCE8) ,),
//               //  icon: Image.asset('assets/image/moreicon.png',),
//               label: 'More',
//             ),
//             BottomNavigationBarItem(
//               icon: Icon(Icons.heart_broken),
//               //  activeIcon: SvgPicture.asset('assets/image/more.svg',color:  Color(0xFF11DCE8) ,),
//               //  icon: Image.asset('assets/image/moreicon.png',),
//               label: 'More',
//             ),
//           ],
//           currentIndex: selectedIndex,
//           onTap: _onItemTapped,
//           // onTap: (value) {
//           //   return setState(() {
//           //     selectedIndex = value;
//           //   });
//           // },
//           type: BottomNavigationBarType.fixed,
//           //enableFeedback: true,
//           selectedIconTheme: const IconThemeData( color: Color(0xFF11DCE8) ),
//           selectedItemColor: Colors.white,
//           unselectedIconTheme: const IconThemeData( color: Colors.white),
//           unselectedItemColor: Color(0xFF8D8E99),
//         ),
//       ),
//     );
  }
}*/
class BottomNavigationBarScreen extends StatefulWidget {
  const  BottomNavigationBarScreen({Key? key}) : super(key: key);
  @override
  State<BottomNavigationBarScreen> createState() => _BottomNavigationBarScreenState();
}
int selectedIndex = 0;
class _BottomNavigationBarScreenState extends State<BottomNavigationBarScreen> {
  final PageController pageController = PageController(initialPage: 0);
  late int _selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Container(

        padding: const EdgeInsets.only(bottom: 10,),
        child: FloatingActionButton(
          elevation: 10,

          backgroundColor: Color(0xffEF2A39),
          shape: CircleBorder(),
          onPressed: () {},
          child:
         // Image(image: AssetImage('assets/images/addNewImgpng.png'),)
         // SvgPicture.asset('assets/images/addSvgImgnew.svg',height: 25,width: 25,)
         const Icon(Icons.add,color: Colors.white,weight: 100,),
        //  Image(image: AssetImage('assets/images/iconAdd.png',),fit: BoxFit.cover,width: 20,height: 20,)
        ),
      ),
      bottomNavigationBar: Container(
        height: 90,

        child: BottomAppBar(

          color: Color(0xffEF2A39),
          // padding: EdgeInsets.all(20),
          height: 80,
          shape:  CircularNotchedRectangle(),
          notchMargin: 10.0,
          clipBehavior: Clip.antiAlias,
          child: BottomNavigationBar(
            showUnselectedLabels: true,
            showSelectedLabels: true,
            selectedItemColor: Colors.white,
            type: BottomNavigationBarType.fixed,
            selectedLabelStyle: TextStyle(fontWeight: FontWeight.bold),
            backgroundColor:  Color(0xffEF2A39),
            elevation: 0,
            currentIndex: _selectedIndex,
            onTap: (index) {
              setState(() {
                _selectedIndex = index;
                pageController.jumpToPage(index);
              });
            },
            items: const[
              BottomNavigationBarItem(
                icon: Image(image: AssetImage('assets/images/home.png')),
                label: '.',
               // activeIcon: Text('.')
              ),
              BottomNavigationBarItem(
                icon: Image(image: AssetImage('assets/images/user.png')),
                label: '.',
              ),
              BottomNavigationBarItem(
                icon: Image(image: AssetImage('assets/images/comment.png')),
                label: '.',
              ),
              BottomNavigationBarItem(
                icon: Image(image: AssetImage('assets/images/heart.png')),
                label: '.',
              ),
            ],
          ),
        ),
      ),
      body: PageView(
        controller: pageController,
        children: const <Widget>[
          Center(
            child: HomeScreen(),
          ),
          Center(
            child: LoginScreen(),
          ),
          Center(
            child: CommentScreen(),
          ),
          Center(
            child: MyHomePage(),
          ),
        ],
      ),

    );

  }
}
