import 'package:flutter/material.dart';

class CustomWidgets {
  static Widget socialButtonRect(title, color, icon, {Function? onTap}) {
    return InkWell(
      onTap: () {
        onTap!();
      },
      child: Container(
        height: 50,
        margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        decoration: BoxDecoration(
            color: color,
            borderRadius: const BorderRadius.all(Radius.circular(10))),
        child: Padding(
          padding: const EdgeInsets.only(left: 28.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Icon(
                icon,
                color: color == Colors.white ? Colors.black : Colors.white,
              ),
              Container(
                margin: const EdgeInsets.only(left: 40),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(title,
                        style: TextStyle(
                            color: // colour white unless google
                                color == Colors.white
                                    ? Colors.black
                                    : Colors.white,
                            fontSize: 14,
                            fontWeight: FontWeight.w400)),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  static Widget socialButtonCircle(color, icon, {iconColor, Function? onTap}) {
    return InkWell(
      onTap: () {
        onTap!();
      },
      child: Container(
          padding: const EdgeInsets.all(20.0),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: color,
          ),
          child: Icon(
            icon,
            color: iconColor,
          )), //
    );
  }
}
