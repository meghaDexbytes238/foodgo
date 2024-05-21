import 'package:flutter/material.dart';
import 'package:footgo/widgets.dart';

import '../config/app_string.dart';

class UserPage extends StatefulWidget {
  const UserPage({super.key});

  @override
  State<UserPage> createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title:  AllWidgets.customText(data: AppString.userScreenName , fontWeight: FontWeight.w400,fontFamily: 'Lobster',fontSize: 20 ),
      ),
    );
  }
}
