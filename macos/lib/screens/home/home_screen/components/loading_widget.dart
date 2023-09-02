import 'package:flutter/material.dart';
import 'package:megabank/constants.dart';
import 'package:sizer/sizer.dart';

//! Loaidng widget

class LoadingWidget extends StatefulWidget {
  const LoadingWidget({super.key});

  @override
  State<LoadingWidget> createState() => _LoadingWidgetState();
}

class _LoadingWidgetState extends State<LoadingWidget> {
  bool _fadeOut = false;
  late bool _isDisposed; 

  @override
  void initState() {
    super.initState();
    _isDisposed = false; 
    _startFadeOutAnimation();
  }

  @override
  void dispose() {
    _isDisposed = true;
    super.dispose();
  }

  void _startFadeOutAnimation() {
    Future.delayed(const Duration(seconds: 10), () {
      if (!_isDisposed) { 
        setState(() {
          _fadeOut = true;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: 'loading',
      child: AnimatedOpacity(
        opacity: _fadeOut ? 0.0 : 1.0,
        duration: const Duration(seconds: 1),
        child: Image.asset(
          loadingImg,
          width: 20.w,
          height: 20.h,
        ),
      ),
    );
  }
}
