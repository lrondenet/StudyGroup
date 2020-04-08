import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey[700],
      child: Center(
        child: SpinKitThreeBounce(
          color: Colors.black,
          size: 30.0,
        ),
      ),
    );
  }
}
