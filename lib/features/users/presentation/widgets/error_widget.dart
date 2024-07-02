import 'package:blingpay_assesment/app_colors.dart';
import 'package:flutter/material.dart';

class ErrorViewWidget extends StatelessWidget {
  final String error ;
  final VoidCallback? onPressed;
  const ErrorViewWidget({super.key, required this.error, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(error,textAlign: TextAlign.center,),
        const SizedBox(height: 20,),
        MaterialButton(
          color: shakeSpearBlue,
          elevation: 0.0,
          onPressed: onPressed,child: const Text('Retry',style: TextStyle(color: Colors.white),),)
      ],
    );
  }
}

