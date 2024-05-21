import 'package:flutter/material.dart';
import 'package:footgo/widgets.dart';

import '../config/app_string.dart';

class CommentPage extends StatefulWidget {
  const CommentPage({super.key});

  @override
  State<CommentPage> createState() => _CommentPageState();
}

class _CommentPageState extends State<CommentPage> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title:  AllWidgets.customText(data: AppString.commentScreenName , fontWeight: FontWeight.w400,fontFamily: 'Lobster',fontSize: 20 ),
      ),
    );
  }
}

