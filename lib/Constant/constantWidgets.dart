import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
class CommonWidgets{
  //! 1
Text text(
    text,
    fontSize,
    color,
    fontWeight,
    maxlines,
  ) {
    return Text(
      text,
      maxLines: maxlines,
      overflow: TextOverflow.ellipsis,
      style:
          TextStyle(fontSize: fontSize, color: color, fontWeight: fontWeight),
    );
  }
//!2
Widget bottomButton(text,text2,onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.only(bottom: 3),
        decoration: BoxDecoration(
          color: Colors.blue,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(vertical: 8, horizontal: 15),
              child: CommonWidgets()
                  .text(text, 22.0, Colors.white, FontWeight.w600, 1),
            ),
             Card(
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 8, horizontal: 15),
                child: CommonWidgets()
                    .text('\$ $text2', 22.0, Colors.black, FontWeight.w600, 1),
              ),
            ),
          ],
        ),
      ),
    );
  }
//! 3
AppBar appBar(String title, List<Widget> action) {
    return AppBar(
      backgroundColor: Colors.blue,
      backwardsCompatibility: false,
      systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor:  Colors.blue,
          statusBarIconBrightness: Brightness.light),
      //leading: leadingIcon,
      title: Text(title,
          style: TextStyle(
              fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white)),
      centerTitle: true,
      actions: action,
      elevation: 0,
      iconTheme: IconThemeData(color: Colors.white),
    );
  }
}

