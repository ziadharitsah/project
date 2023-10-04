import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class PageHeaderRegister extends StatelessWidget {
  const PageHeaderRegister({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SizedBox(
      width: double.infinity,
      height: size.height * 0.3,
      child: Lottie.asset('assets/images/register.json'),
    );
  }
}
