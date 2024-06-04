import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class White_Notice extends StatefulWidget {
  const White_Notice({super.key});

  @override
  State<White_Notice> createState() => _White_NoticeState();
}

class _White_NoticeState extends State<White_Notice> {
  @override
  Widget build(BuildContext context) {
    return   Scaffold(

      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
        ),
        centerTitle: true,
        backgroundColor: Colors.blueGrey,
      ),


      body: Center(
        child: Column(
          children: [
            Text("This is White Notice")
          ],
        ),
      ),
      
    );
  }
}
