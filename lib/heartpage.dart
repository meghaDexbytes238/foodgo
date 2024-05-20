import 'package:flutter/material.dart';
import 'package:footgo/widgets.dart';

import 'app_string.dart';


class HeartPage extends StatefulWidget {
  const HeartPage({super.key});

  @override
  State<HeartPage> createState() => _HeartPageState();
}

class _HeartPageState extends State<HeartPage> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title:  AllWidgets.customText(data: AppString.heartScreenName , fontWeight: FontWeight.w400,fontFamily: 'Lobster',fontSize: 20 ),
      ),
    );
  }
}


