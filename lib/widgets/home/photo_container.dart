import 'package:flutter/material.dart';
import '../../constants/app_colors.dart';

class PhotoContainer extends StatelessWidget {
  const PhotoContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Container(
        height: 220,
        decoration: BoxDecoration(
          color: AppColors.surfaceWhite,
          borderRadius: BorderRadius.circular(24),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(24),
          child: GridView.count(
            physics: const NeverScrollableScrollPhysics(),
            crossAxisCount: 2,
            children: const [
              // replace with real images
              ColoredBox(color: Colors.pinkAccent),
              ColoredBox(color: Colors.pink),
              ColoredBox(color: Colors.pinkAccent),
              ColoredBox(color: Colors.pink),
            ],
          ),
        ),
      ),
    );
  }
}
