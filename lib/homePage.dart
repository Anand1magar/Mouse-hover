import 'package:flutter/material.dart';
import 'package:mouse_hover/hover.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        child: Container(
          width: 500,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  blurRadius: 12,
                  spreadRadius: 5,
                  color: Colors.grey,
                )
              ]),
          child: buttonsUI(),
        ),
      ),
    );
  }
}

buttonsUI() {
  return Column(
    children: List.generate(6, (int i) {
      return ButtonHover(
        index: i,
        title: 'Same title',
      );
    }),
  );
}
