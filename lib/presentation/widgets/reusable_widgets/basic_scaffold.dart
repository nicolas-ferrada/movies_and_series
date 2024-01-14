import 'package:flutter/material.dart';

class BasicScaffoldCenter extends StatelessWidget {
  final Widget child;
  const BasicScaffoldCenter(
    this.child, {
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: child,
        ),
      ),
    );
  }
}
