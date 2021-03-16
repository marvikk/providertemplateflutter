import 'package:flutter/material.dart';

class SearchBarWidget extends StatelessWidget {
  final Color color;
  final double width;
  final double height;
  final inputTextController;

  const SearchBarWidget(
      {this.color = const Color(0xffedf1fa),
      this.width = 290,
      this.height = 44,
      Key key,
      this.inputTextController})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        child: TextField(
          controller: inputTextController,
          decoration: InputDecoration(
            border: InputBorder.none,
            // icon: Icon(Icons.send),
            contentPadding: EdgeInsets.all(16.0),
          ),
        ),
        width: width,
        height: height,
        decoration: new BoxDecoration(
            border: Border.all(width: 1.0, color: Color(0xFFFF7F7F7F)),
            color: color,
            borderRadius: BorderRadius.circular(23.5)));
  }
}
