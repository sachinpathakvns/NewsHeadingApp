import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class WaterFlowing extends StatefulWidget {
  const WaterFlowing({Key? key}) : super(key: key);

  @override
  State<WaterFlowing> createState() => _WaterFlowingState();
}

class _WaterFlowingState extends State<WaterFlowing>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller =
        AnimationController(duration: Duration(seconds: 3), vsync: this);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _controller.dispose();
  }

  bool animation = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            GestureDetector(
              onTap: () {
                setState(() {

                });
                if (animation == false) {
                  animation = true;
                  _controller.stop();
                } else {
                  animation = false;
                  _controller.repeat();

                }
              },
              child: Container(
                height: 800,
                child: Lottie.network(
                    'https://assets1.lottiefiles.com/packages/lf20_gqtjgeja.json',
                controller: _controller,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
