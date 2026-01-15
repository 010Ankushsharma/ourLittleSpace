import 'package:flutter/material.dart';
import 'package:foryou/pages/home_page.dart';
import 'package:lottie/lottie.dart';

import '../constants/app_colors.dart';

class StartPage extends StatelessWidget {
  const StartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            AppColors.bgLightBlush,
            AppColors.bgPrimary,
          ],
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [

              // Text Section
              Column(
                children: [
                  Text(
                    "Hey you 💕",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: AppColors.textPrimary,
                    ),

                  ),
                  const SizedBox(height: 6),
                  Text(
                    "my favorite place to be 🌸",
                    style: TextStyle(
                      fontSize: 15,
                      color: AppColors.textSecondary,
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 30),

              // Lottie Section
              ClipOval(
                child: SizedBox(
                  width: 250,
                  height: 250,
                  child: Lottie.asset(
                    'assets/girl.json',
                    fit: BoxFit.contain,
                  ),
                ),
              ),
              const SizedBox(height: 50),
              //
              ElevatedButton(
                onPressed: () {
                  Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const HomePage(),
                  ),
                );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.accentPeachPink,
                  elevation: 0,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 48,
                    vertical: 14,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                child: Text(
                  "Tap here 💖",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: AppColors.textPrimary,
                  ),
                ),
              ),

            ],
          ),
        ),
      ),

    );
  }
}
