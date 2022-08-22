import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class RadioButton extends StatefulWidget {
  final String text;
  final Function onPressed;
  final double? minWidth;
  final Color? color;

  const RadioButton(this.text, this.onPressed, {Key? key, this.minWidth, this.color}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _RadioButtonState();
}

class _RadioButtonState extends State<RadioButton>
    with SingleTickerProviderStateMixin {
  double? _scale;
  AnimationController? _controller;

  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(
        milliseconds: 50,
      ),
      lowerBound: 0.0,
      upperBound: 0.05,
    )..addListener(() {
      setState(() {});
    });
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _controller?.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _scale = 1.0 - _controller!.value;
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          border: Border.all(
            color: Colors.grey,
          ),
        ),
        child: GestureDetector(
          onTap: widget.onPressed as void Function(),
          onTapDown: _tapDown,
          onTapUp: _tapUp,
          onTapCancel: () => {
            if (_controller?.status == AnimationStatus.forward ||
                _controller?.status == AnimationStatus.completed)
              {
                _tapUp(TapUpDetails(kind: PointerDeviceKind.touch)),
              }
          },
          child: Material(
            color: widget.color,
            borderRadius: BorderRadius.circular(20.0),
            child: InkWell(
              onTap: widget.onPressed as void Function(),
              borderRadius: BorderRadius.circular(20.0),
              child: Transform.scale(
                scale: _scale,
                child: _animatedButton(),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _animatedButton() {
    return SizedBox(
      width: widget.minWidth,
      child: Padding(
        padding: const EdgeInsets.all(14.0),
        child: Text(
          widget.text,
          textAlign: TextAlign.center,
          style: const TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold, color: Colors.blue),
        ),
      ),
    );
  }

  void _tapDown(TapDownDetails details) {
    _controller?.forward();
  }

  void _tapUp(TapUpDetails details) {
    _controller?.reverse();
  }
}
