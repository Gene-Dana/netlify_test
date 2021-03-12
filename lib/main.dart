import 'dart:async';
import 'package:flutter/material.dart';

void main() {
  runApp(App());
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
  late Timer _everySecond;

  @override
  void initState() {
    super.initState();

    // defines a timer
    _everySecond = Timer.periodic(const Duration(milliseconds: 500), (Timer t) {
      setState(() {
        if (position < 6) {
          position++;
        } else {
          position = 0;
        }
      });
    });
  }

  @override
  void dispose() {
    _everySecond.cancel();
    super.dispose();
  }

  bool isHovering = false;
  var position = 0;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => null,
      onHover: (hovering) {
        setState(() => isHovering = hovering);
      },
      child: Stack(
        children: [
          L2TLogo(position: position),
          AnimatedOpacity(
              opacity: !isHovering ? 1.0 : 0.0,
              duration: const Duration(milliseconds: 200),
              child: Image.asset('black.png')),
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
  var images = [
    Image.network('https://i.imgur.com/UqeKHEh.png'),
    Image.network('https://i.imgur.com/xucEeZv.png'),
    Image.network('https://i.imgur.com/4XUfchi.png'),
    Image.network('https://i.imgur.com/GGtmnh3.png'),
    Image.network('https://i.imgur.com/FOUt0Cd.png'),
    Image.network('https://i.imgur.com/tTSoAaE.png'),
    Image.network('https://i.imgur.com/iMdhAgW.png'),
  ];

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 500),
      child: images[widget.position],
    );
  }
}
