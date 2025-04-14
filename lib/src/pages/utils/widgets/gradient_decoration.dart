
import 'package:flutter/material.dart';

class GradientDecoration extends BoxDecoration {
  
  const GradientDecoration();

  static BoxDecoration get () {
    return BoxDecoration(
      gradient: LinearGradient(
          colors: [
          Color.fromARGB(255, 23, 23, 153),
          Color.fromARGB(255, 53, 53, 237),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          stops: [0.1,0.8],
          tileMode: TileMode.clamp
        )
      );
  }

  static BoxDecoration changeOnlyBorder (BoxBorder? boxBorder) {
    return BoxDecoration(
      border: boxBorder,
      gradient: LinearGradient(
          colors: [
          Color.fromARGB(255, 23, 23, 153),
          Color.fromARGB(255, 53, 53, 237),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          stops: [0.1,0.8],
          tileMode: TileMode.clamp
        )
      );
  }

   static BoxDecoration changeOnlyBorderRadius (BorderRadiusGeometry? borderRadiusGeometry) {
    return BoxDecoration(
      borderRadius: borderRadiusGeometry,
      gradient: LinearGradient(
          colors: [
          Color.fromARGB(255, 23, 23, 153),
          Color.fromARGB(255, 53, 53, 237),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          stops: [0.1,0.8],
          tileMode: TileMode.clamp
        )
      );
  }



}