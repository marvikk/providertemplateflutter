import 'package:flutter/material.dart';

class IconWithBgWidget extends StatelessWidget {
  final double width;
  final double height;
  final double padding;
  final String assetImage;
  final int bgColor;
  final VoidCallback onClick;
  const IconWithBgWidget({
    Key key,
    this.width = 56,
    this.height = 56,
    this.padding = 8,
    this.assetImage,
    this.bgColor = 0xffebf6fe,
    this.onClick,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          return onClick();
        },
        child: Container(
          padding: EdgeInsets.all(padding),
          child: Image.asset(
            assetImage,
            // height: 5,
            // width: 5,
            // fit: BoxFit.fill,
          ),
          width: width,
          height: height,
          decoration: new BoxDecoration(
            color: Color(bgColor),
            borderRadius: BorderRadius.all(Radius.circular(15)),
            // image: DecorationImage(
            //     image: AssetImage('assets/audio.png'))
          ),
        ));
  }
}
