import 'package:flutter/material.dart';

class AnimatedItem extends StatefulWidget {
  final Function onPressed;
  final double? minWidth;
  final Image image;

  const AnimatedItem( {Key? key,   required this.onPressed, required this.image, this.minWidth,}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _AnimatedItemState();
}

class _AnimatedItemState extends State<AnimatedItem> with SingleTickerProviderStateMixin {
  double? _scale;
  AnimationController? _controller;
   bool _isElevated = true;

  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(
        milliseconds: 50,
      ),
      lowerBound: 0.0,
      upperBound: 0.1,
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
    return GestureDetector(
      onTap: _onTap,
      child: Transform.scale(
        scale: _scale,
        child: _animatedButton(),
      ),
    );
  }

  Widget _animatedButton() {
    return Container(
      height: 40,
      width: 40,
      color: _isElevated == true ? null : Colors.black,
      child: SizedBox(
        height: 30,
        width: 30,
        child: CircleAvatar(
          child: widget.image,
        ),
      ),
    );
  }

  Future<void> _onTap() async {
    if(_isElevated == true){
      _isElevated = false;
    }else{
      _isElevated = true;
    }
    _controller?.forward();
    await Future.delayed(const Duration(milliseconds: 50));
    _controller?.reverse();
    widget.onPressed();
  }
}
