import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Split Screen Demo"),
      ),
      body: Center(
          child: Row(
            children: <Widget>[
              Sidebar(initialWidth: 400.0,maxWidth: 800.0,),
              Expanded(child: Container(color: Colors.red))
        ],
      )),
    );
  }
}

class Sidebar extends StatefulWidget {
  final double maxWidth;
  final double initialWidth;

  const Sidebar({Key key, this.maxWidth = 0.0, this.initialWidth = 300.0}): super(key: key);

  @override
  _SidebarState createState() => _SidebarState(maxWidth: this.maxWidth, width: this.initialWidth);
}

class _SidebarState extends State<Sidebar> {
  double width;
  double maxWidth;

  _SidebarState({@required this.maxWidth, @required this.width});

  updateWidth(double newWidth) {
    width = maxWidth > 0.0 ? min(newWidth, maxWidth) : newWidth;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
              color: Colors.blue,
              width: width,
              alignment: Alignment.centerRight,
              child: Listener(
                // onPointerEnter: (PointerEnterEvent details) {
                //   print("X: ${details.position.dx}, Y: ${details.position.dx}");
                // },
                // onPointerExit: (PointerExitEvent e) {
                //   print("X: ${e.position.dx}, Y: ${e.position.dy}");
                // },
                
                // onPointerHover: (PointerHoverEvent e) {
                //   print("X: ${e.position.dx}, Y: ${e.position.dy}");
                // },
                child: GestureDetector(
                    onHorizontalDragUpdate: (DragUpdateDetails details) {
                      // print("xOffset: ${details.globalPosition.dx}");
                      setState(() {
                        updateWidth(width + details.primaryDelta);
                      });
                    },
                    child: Column(
                    children: <Widget>[
                      Expanded(
                        child: Container(width: 5.0, color: Colors.black),
                      )
                    ],
                  ),
                ),
              ));
  }
}

