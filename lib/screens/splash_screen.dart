import 'package:flutter/material.dart';
import 'dart:async';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with TickerProviderStateMixin {
  late AnimationController _letterController;
  late AnimationController _exitController;
  late List<Animation<double>> _fadeAnimations;
  late List<Animation<double>> _scaleAnimations;
  late Animation<double> _zoomOutAnimation;
  late Animation<double> _finalFadeOut;

  final String title = "ReadRit";

  @override
  void initState() {
    super.initState();

    _letterController = AnimationController(
      duration: Duration(seconds: 3),
      vsync: this,
    );

    _exitController = AnimationController(
      duration: Duration(seconds: 2),
      vsync: this,
    );

    // Letter-by-letter pop in
    _fadeAnimations = List.generate(title.length, (index) {
      double start = index * 0.1;
      double end = start + 0.3;
      return Tween<double>(begin: 0.0, end: 1.0).animate(
        CurvedAnimation(
          parent: _letterController,
          curve: Interval(start, end, curve: Curves.easeOut),
        ),
      );
    });

    _scaleAnimations = List.generate(title.length, (index) {
      double start = index * 0.1;
      double end = start + 0.3;
      return Tween<double>(begin: 0.5, end: 1.0).animate(
        CurvedAnimation(
          parent: _letterController,
          curve: Interval(start, end, curve: Curves.elasticOut),
        ),
      );
    });

    // Final word zoom-out + fade
    _zoomOutAnimation = Tween<double>(begin: 1.0, end: 1.5).animate(
      CurvedAnimation(parent: _exitController, curve: Curves.easeInOut),
    );

    _finalFadeOut = Tween<double>(begin: 1.0, end: 0.0).animate(
      CurvedAnimation(parent: _exitController, curve: Curves.easeInOut),
    );

    _letterController.forward().whenComplete(() {
      _exitController.forward();
    });

    Timer(Duration(seconds: 5), () {
      Navigator.pushReplacementNamed(context, '/login');
    });
  }

  @override
  void dispose() {
    _letterController.dispose();
    _exitController.dispose();
    super.dispose();
  }

  Widget _buildAnimatedLetter(int index) {
    return FadeTransition(
      opacity: _fadeAnimations[index],
      child: ScaleTransition(
        scale: _scaleAnimations[index],
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 2),
          child: Text(
            title[index],
            style: TextStyle(
              fontSize: 60,
              fontWeight: FontWeight.bold,
              color: Color(0xFF4E2C0C),
              shadows: [
                Shadow(
                  blurRadius: 20.0,
                  color: Colors.white.withOpacity(0.6),
                  offset: Offset(0, 0),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF2C16C),
      body: Center(
        child: AnimatedBuilder(
          animation: _exitController,
          builder: (context, child) {
            return Opacity(
              opacity: _finalFadeOut.value,
              child: Transform.scale(
                scale: _zoomOutAnimation.value,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: List.generate(title.length, _buildAnimatedLetter),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
