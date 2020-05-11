import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).backgroundColor,
      child: Center(
        child: SpinKitThreeBounce(
          color: Theme.of(context).accentColor,
          size: 30.0,
        ),
      ),
    );
  }
}
