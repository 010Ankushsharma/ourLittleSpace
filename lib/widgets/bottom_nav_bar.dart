import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import '../constants/app_colors.dart';

class AppBottomNavBar extends StatelessWidget {
  final int index;
  final Function(int) onTap;

  const AppBottomNavBar({
    super.key,
    required this.index,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return CurvedNavigationBar(
      index: index,
      height: 65,
      backgroundColor: Colors.transparent,
      color: AppColors.accentPeachPink,
      buttonBackgroundColor: AppColors.surfaceWhite,
      items: const [
        Icon(Icons.favorite, color: Colors.pink),
        Icon(Icons.photo_album, color: Colors.pink),
        Icon(Icons.home, color: Colors.pink),
        Icon(Icons.music_note, color: Colors.pink),
        Icon(Icons.card_giftcard, color: Colors.pink),
      ],
      onTap: onTap,
    );
  }
}
