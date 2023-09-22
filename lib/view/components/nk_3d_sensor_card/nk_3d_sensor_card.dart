// import 'package:flutter/material.dart';
// import 'package:mouse_parallax/mouse_parallax.dart';
//
// class DemoPage extends StatefulWidget {
//   @override
//   _DemoPageState createState() => _DemoPageState();
// }
//
// class _DemoPageState extends State<DemoPage> {
//   @override
//   Widget build(BuildContext context) {
//     return ParallaxStack(
//       resetOnExit: true,
//       useLocalPosition: true,
//       referencePosition: 0.2,
//       dragCurve: Curves.easeInOutCubicEmphasized,
//       resetCurve: Curves.fastEaseInToSlowEaseOut,
//       layers: [
//         ParallaxLayer(
//           yRotation: 0.2,
//           xRotation: 0.2,
//           xOffset: 10,
//           yOffset: 10,
//           child: Center(
//             child: Container(
//                 height: MediaQuery.of(context).size.height * 0.5,
//                 width: MediaQuery.of(context).size.width * 0.7,
//                 child: Column(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [Placeholder(), FlutterLogo()],
//                 )),
//           ),
//         ),
//       ],
//     );
//   }
// }

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:my_profile/theme/color/colors.dart';
import 'package:sensors_plus/sensors_plus.dart';
import 'package:velocity_x/velocity_x.dart';

class MyWidget extends StatefulWidget {
  final Widget? child;
  const MyWidget({Key? key, this.child}) : super(key: key);

  @override
  State<MyWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> with TickerProviderStateMixin {
  double xAngle = 0;
  double prevXAngle = 0;
  double yAngle = 0;
  double prevYAngle = 0;
  double zAngle = 0;
  double prevZAngle = 0;
  final double squareSize = 300;
  final streamsub = <StreamSubscription<dynamic>>[];

  @override
  void initState() {
    super.initState();

    streamsub.add(accelerometerEvents.listen((event) {
      setState(() {
        prevXAngle = xAngle;
        xAngle = event.x;
        prevYAngle = yAngle;
        yAngle = event.y;
        prevZAngle = zAngle;
        zAngle = event.z;
      });
    }));
  }

  @override
  void dispose() {
    super.dispose();
    for (final sub in streamsub) {
      sub.cancel();
    }
  }

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder(
        tween: Tween(begin: prevXAngle, end: xAngle),
        duration: const Duration(milliseconds: 400),
        builder: (context, double xValue, _) {
          return TweenAnimationBuilder(
              tween: Tween(begin: prevZAngle, end: zAngle),
              duration: const Duration(milliseconds: 400),
              builder: (context, double zValue, _) {
                return [
                  Transform(
                      origin: Offset(squareSize / 2, squareSize / 2),
                      transform: Matrix4.identity()
                        ..setEntry(3, 2, 0.003)
                        ..rotateX(-zValue / 15) // *1
                        ..rotateY(xValue / 12), // *2
                      child: VxBox().rounded.width(300).height(300).make()),
                  Transform(
                      origin: const Offset(150, 150),
                      transform: Matrix4.identity()
                        ..setEntry(3, 2, 0.002)
                        ..rotateX(-zValue / 15) // *1
                        ..rotateY(xValue / 12), // *2
                      child: VxBox(child: widget.child)
                          .rounded
                          .withShadow([
                            BoxShadow(
                                color: primaryColor.withOpacity(0.2),
                                blurRadius: 50,
                                spreadRadius: 1,
                                offset: Offset(xValue * 2, zValue * 2)), // *3
                            BoxShadow(
                                color: primaryColor.withOpacity(0.6),
                                blurRadius: 40,
                                offset: Offset(xValue * 0.5, zValue * 0.5),
                                spreadRadius: 1)
                          ])
                          .blue50
                          .width(
                              squareSize) //passed in the squareSize variable from earlier
                          .height(
                              squareSize) //passed in the squareSize variable from earlier
                          .make())
                ].zStack(); //this is a Stack widget that is provided in the VelocityX package
              });
        });
  }
}
