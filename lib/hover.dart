import 'dart:math';

import 'package:flutter/material.dart';

class ButtonHover extends StatefulWidget {
  final int? index;
  final String? title;

  const ButtonHover({Key? key, this.index, this.title}) : super(key: key);

  @override
  _ButtonHoverState createState() =>
      _ButtonHoverState(index: this.index, title: this.title);
}

class _ButtonHoverState extends State<ButtonHover> {
  final int? index;
  final String? title;
  _ButtonHoverState({this.index, this.title});

  bool isHover = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (value) {
        setState(() {
          isHover = true;
        });
      },
      onExit: (value) {
        setState(() {
          isHover = false;
        });
      },
      child: AnimatedContainer(
        margin: EdgeInsets.symmetric(vertical: isHover ? 3 : 0),
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              blurRadius: 11,
              spreadRadius: 5,
              color:
                  isHover ? Colors.pink.withOpacity(0.4) : Colors.transparent,
            )
          ],
          borderRadius: BorderRadius.only(
            topLeft: (isHover || index == 0)
                ? Radius.circular(60)
                : Radius.circular(0),
            topRight: (isHover || index == 0)
                ? Radius.circular(60)
                : Radius.circular(0),
            bottomLeft: (isHover || index == 5)
                ? Radius.circular(60)
                : Radius.circular(0),
            bottomRight: (isHover || index == 5)
                ? Radius.circular(60)
                : Radius.circular(0),
          ),
        ),
        duration: Duration(milliseconds: 200),
        width: 500,
        height: isHover ? 120 : 85,
        child: addElement(),
      ),
    );
  }

  addElement() {
    return Row(
      children: [
        Container(
          width: 80,
          height: isHover ? 100 : 85,
          child: Center(
            child: AnimatedContainer(
              duration: Duration(milliseconds: 200),
              width: isHover ? 55 : 40,
              height: isHover ? 55 : 40,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
                color: isHover ? Colors.pink : Colors.grey[200],
              ),
              child: AnimatedDefaultTextStyle(
                  duration: Duration(milliseconds: 150),
                  style: TextStyle(
                    fontSize: isHover ? 19 : 13,
                    color: isHover ? Colors.white : Colors.grey[700],
                    fontWeight: isHover ? FontWeight.bold : FontWeight.normal,
                  ),
                  child: Center(
                    child: Text(index.toString()),
                  )),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 70),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Hover me to do some action !',
                style: TextStyle(fontSize: 16),
              ),
              Text("Tap for more !"),
            ],
          ),
        ),
      ],
    );
  }
}
