import 'package:flutter/material.dart';

class CoupleAppBar extends StatelessWidget implements PreferredSizeWidget {
  final bool connected;
  final String? partnerName;
  final VoidCallback? onShareTap;

  const CoupleAppBar({
    super.key,
    required this.connected,
    this.partnerName,
    this.onShareTap,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      centerTitle: true,
      title: connected
          ? Text(
        partnerName ?? "My Love 💕",
        style: const TextStyle(fontWeight: FontWeight.w600),
      )
          : const Text(
        "Our Little Space",
        style: TextStyle(fontWeight: FontWeight.w600),
      ),
      actions: [
        if (!connected)
          IconButton(
            icon: const Icon(Icons.favorite_outline),
            onPressed: onShareTap,
          ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
