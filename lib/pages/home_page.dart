import 'package:flutter/material.dart';
import '../constants/app_colors.dart';
import '../service/connection_service.dart';
import '../widgets/home/photo_container.dart';
import '../widgets/home/send_love_container.dart';
import '../widgets/bottom_nav_bar.dart';
import '../widgets/home/share_code_sheet.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final connectionService = ConnectionService();

  bool connected = false;
  String? partnerName;
  int _index = 2;


  @override
  void initState() {
    super.initState();
    _loadConnection();
  }

  Future<void> _loadConnection() async {
    final result = await connectionService.getConnectionStatus();

    setState(() {
      connected = result['connected'];
      partnerName = result['partnerName'];
    });
  }

  @override
  Widget build(BuildContext context) {
    bool connected = false;
    String? partnerName;


    return Scaffold(
      backgroundColor: AppColors.bgPrimary,

      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,

        title: Text(
          connected
              ? (partnerName ?? "My Love 💕")
              : "Our Little Space 💖",
          style: TextStyle(
            color: AppColors.textPrimary,
            fontWeight: FontWeight.w600,
          ),
        ),

        actions: [
          if (!connected)
            IconButton(
              icon: Icon(
                Icons.favorite_outline,
                color: AppColors.textPrimary,
              ),
              onPressed: () async {
                await showModalBottomSheet(
                  context: context,
                  isScrollControlled: true,
                  shape: const RoundedRectangleBorder(
                    borderRadius:
                    BorderRadius.vertical(top: Radius.circular(30)),
                  ),
                  builder: (_) => const ShareCodeSheet(),
                );

                // refresh after closing sheet
                _loadConnection();
              },
            ),
        ],
      ),



      body: Expanded(
        child: Column(
          children: const [
            SizedBox(height: 20),
            Text(
              "Every little moment with you means everything to me 🌸",
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 24),
            PhotoContainer(),
            Spacer(),
            SendLoveContainer(),
          ],
        ),
      ),

      bottomNavigationBar: AppBottomNavBar(
        index: _index,
        onTap: (i) => setState(() => _index = i),
      ),
    );
  }
}
