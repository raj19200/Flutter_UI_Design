// import 'package:flutter/material.dart';
// class Dummy extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//         child: PageView.builder(
//           controller: _pageController,
//           scrollDirection: Axis.vertical,
//           itemCount: _creditCards.length,
//           itemBuilder: (context, index) => _builder(index),
//         ),
//       ),
//     );
//   }
//
//   _builder(int index) {
//     CreditCard _card = _creditCards[index];
//     return AnimatedBuilder(
//       animation: _pageController,
//       builder: (context, child) {
//         double value = 1.0;
//
//         if (_pageController.position.haveDimensions) {
//           value = _pageController.page - index;
//
//           if (value >= 0) {
//             double _lowerLimit = 0;
//             double _upperLimit = pi / 2;
//
//             value = (_upperLimit - (value.abs() * (_upperLimit - _lowerLimit)))
//                 .clamp(_lowerLimit, _upperLimit);
//             value = _upperLimit - value;
//             value *= -1;
//           }
//         } else {
//           if (index == 0) {
//             value = 0;
//           } else if (index == 1) {
//             value = -1;
//           }
//         }
//
//         return Center(
//           child: Transform(
//             transform: Matrix4.identity()
//               ..setEntry(3, 2, 0.001)
//               ..rotateX(value),
//             alignment: Alignment.center,
//             child: child,
//           ),
//         );
//       },
//       child: _card,
//     );
//   }
//
// }
//
// / final percent =(value-index).abs().clamp(0.0, 1.0 );
// // final factor =_pageController.position.userScrollDirection == ScrollDirection.forward?1.0:-1.0;
// // final opacity=percent.clamp(0.0, 0.7);
// // print(percent);
//
//
//
