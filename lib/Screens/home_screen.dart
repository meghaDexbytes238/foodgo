import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body:  Text('Foodgo',style: TextStyle(fontWeight: FontWeight.w400,color: Color(0xFF3C2F2F),fontFamily: 'Lobster',height: 100),),

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
