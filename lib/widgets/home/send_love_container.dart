import 'package:flutter/material.dart';
import '../../constants/app_colors.dart';

class SendLoveContainer extends StatelessWidget {
  const SendLoveContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 0, 16, 90),
      child: Container(
        padding: const EdgeInsets.all(14),
        decoration: BoxDecoration(
          color: AppColors.surfaceWhite,
          borderRadius: BorderRadius.circular(30),
          boxShadow: [
            BoxShadow(
              color: AppColors.shadowSoft,
              blurRadius: 10,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Row(
          children: [
            IconButton(
              icon: const Icon(Icons.add_circle_outline),
              onPressed: () {},
            ),
            const Expanded(
              child: TextField(
                decoration: InputDecoration(
                  hintText: "Send a love 💕",
                  border: InputBorder.none,
                ),
              ),
            ),
            IconButton(
              icon: const Icon(Icons.send_rounded),
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}
