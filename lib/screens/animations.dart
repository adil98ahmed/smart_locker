import 'package:flutter/material.dart';

class AnimationTry extends StatefulWidget {
  const AnimationTry({Key? key}) : super(key: key);

  @override
  _AnimationTryState createState() => _AnimationTryState();
}

class _AnimationTryState extends State<AnimationTry>
    with TickerProviderStateMixin {
  Animation? colorAnimation;
  Animation? numberAnimation;
  AnimationController? colorAnimationController;
  AnimationController? numberAnimationController;
  @override
  void initState() {
    super.initState();
    colorAnimationController =
        AnimationController(vsync: this, duration: Duration(seconds: 1));

    numberAnimationController =
        AnimationController(vsync: this, duration: Duration(seconds: 1));

    colorAnimation = ColorTween(begin: Colors.grey, end: Colors.red)
        .animate(colorAnimationController!);

    numberAnimation =
        Tween<double>(begin: 150, end: 170).animate(numberAnimationController!);
    colorAnimationController!.forward();
    numberAnimationController!.forward();
    colorAnimation!.addStatusListener((status) {
      print(status);
      if(status == AnimationStatus.completed){
        colorAnimationController!.reverse();
        numberAnimationController!.reverse();
      }
      if(status == AnimationStatus.dismissed){
        colorAnimationController!.forward();
        numberAnimationController!.forward();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AnimatedBuilder(
                animation: colorAnimationController!,
                builder: (context, _) => Icon(
                      Icons.favorite_outlined,
                      size: numberAnimation!.value,
                      color: colorAnimation!.value,
                    )
            )
          ],
        ),
      ),
    );
  }
}
