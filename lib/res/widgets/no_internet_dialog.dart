import 'package:flutter/material.dart';
import 'package:meetmax/features/authentication/widgets/custom_button.dart';

class NoInternetDialog extends StatelessWidget {
  final VoidCallback? onCheckAgain;

  const NoInternetDialog({
    super.key,
    this.onCheckAgain,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 20.0, vertical: 24.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Icon(Icons.portable_wifi_off,
                      size: 80.0, color: Colors.black),
                  const SizedBox(height: 20.0),
                  const Text(
                    'Device Offline',
                    style: TextStyle(
                      fontSize: 24.0,
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(height: 16.0),
                  const Text(
                    'Your device has no internet connection, please check your internet connection.',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.w500,
                      color: Colors.black54,
                    ),
                  ),
                  const SizedBox(height: 40.0),
                  CustomButton(
                      text: 'Check Again',
                      backgroundColor: Colors.white,
                      borderColor: Colors.blue,
                      textStyle: const TextStyle(
                        color: Colors.blue,
                      ),
                      onPressed: onCheckAgain ?? () {})
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
