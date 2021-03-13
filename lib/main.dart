import 'dart:async';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(home: App()));
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(child: HoverL2T()),
    );
  }
}

class HoverL2T extends StatefulWidget {
  const HoverL2T({Key? key}) : super(key: key);

  @override
  _HoverL2TState createState() => _HoverL2TState();
}

class _HoverL2TState extends State<HoverL2T> {
  late Timer tick;
  bool isHovering = false;
  var position = 0;

  void startAnimate() {
    tick = Timer.periodic(
      Duration(milliseconds: 500),
      (timer) {
        setState(() {
          if (position < 6) {
            position++;
          } else {
            position = 0;
          }
        });
      },
    );
  }

  void stopAnimate() {
    tick.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      focusColor: Colors.transparent,
      highlightColor: Colors.transparent,
      hoverColor: Colors.transparent,
      onTap: () => null,
      onHover: (hovering) {
        setState(() {
          isHovering = hovering;
        });
        if (hovering) {
          print('hvering');
          startAnimate();
        } else {
          print('not hvering');
          stopAnimate();
        }
      },
      child: Stack(
        children: [
          L2TLogo(position: position),
          AnimatedOpacity(
              opacity: !isHovering ? 1.0 : 0.0,
              duration: const Duration(milliseconds: 200),
              child: Image.network('https://i.imgur.com/vfoOK26.png')),
        ],
      ),
    );
  }
}

class L2TLogo extends StatefulWidget {
  const L2TLogo({Key? key, required this.position}) : super(key: key);

  final int position;
  @override
  _L2TLogoState createState() => _L2TLogoState();
}

class _L2TLogoState extends State<L2TLogo> {
  Image? image1;
  Image? image2;
  Image? image3;
  Image? image4;
  Image? image5;
  Image? image6;
  Image? image7;
  var images;

  @override
  void initState() {
    super.initState();

    image1 = Image.network('https://i.imgur.com/UqeKHEh.png');
    image2 = Image.network('https://i.imgur.com/xucEeZv.png');
    image3 = Image.network('https://i.imgur.com/4XUfchi.png');
    image4 = Image.network('https://i.imgur.com/GGtmnh3.png');
    image5 = Image.network('https://i.imgur.com/FOUt0Cd.png');
    image6 = Image.network('https://i.imgur.com/tTSoAaE.png');
    image7 = Image.network('https://i.imgur.com/iMdhAgW.png');

    images = [
      image1,
      image2,
      image3,
      image4,
      image5,
      image6,
      image7,
    ];
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    precacheImage(image1!.image, context);
    precacheImage(image2!.image, context);
    precacheImage(image3!.image, context);
    precacheImage(image4!.image, context);
    precacheImage(image5!.image, context);
    precacheImage(image6!.image, context);
    precacheImage(image7!.image, context);
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 500),
      child: images[widget.position],
    );
  }
}
