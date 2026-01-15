import 'dart:math';

import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../constants/app_colors.dart';
import '../../service/couple_service.dart';

class ShareCodeSheet extends StatefulWidget {
  const ShareCodeSheet({super.key});

  @override
  State<ShareCodeSheet> createState() => _ShareCodeSheetState();
}

class _ShareCodeSheetState extends State<ShareCodeSheet> {
  String? inviteCode;
  final TextEditingController codeController = TextEditingController();
  final CoupleService coupleService = CoupleService();

  String _generateCode() {
    final rand = Random();
    return (100000 + rand.nextInt(900000)).toString();
  }

  @override
  void dispose() {
    codeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: 24,
        right: 24,
        top: 24,
        bottom: MediaQuery.of(context).viewInsets.bottom + 24,
      ),
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              "Connect with your person 💕",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: AppColors.textPrimary,
              ),
            ),

            const SizedBox(height: 20),

            /// GENERATED CODE
            if (inviteCode != null)
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: AppColors.bgSoftPink,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  inviteCode!,
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 2,
                  ),
                ),
              ),

            const SizedBox(height: 16),

            /// GENERATE CODE BUTTON
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.accentPeachPink,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                onPressed: () async {
                  final user = Supabase.instance.client.auth.currentUser;
                  if (user == null) return;

                  final code = _generateCode();
                  await coupleService.createCouple(code);

                  setState(() {
                    inviteCode = code;
                  });
                },
                child: const Text("Generate Code 💌"),
              ),
            ),

            const SizedBox(height: 24),

            Text("OR", style: TextStyle(color: AppColors.textMuted)),

            const SizedBox(height: 16),

            /// ENTER CODE
            TextField(
              controller: codeController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                hintText: "Enter partner code",
                filled: true,
                fillColor: AppColors.surfaceWhite,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: BorderSide.none,
                ),
              ),
            ),

            const SizedBox(height: 16),

            /// CONNECT BUTTON
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () async {
                  final code = codeController.text.trim();
                  if (code.isEmpty) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text("Enter a code 💬")),
                    );
                    return;
                  }

                  final user = Supabase.instance.client.auth.currentUser;
                  if (user == null) return;

                  final couple = await Supabase.instance.client
                      .from('couples')
                      .select()
                      .eq('code', code)
                      .maybeSingle();

                  if (couple == null) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text("Invalid code ❌")),
                    );
                    return;
                  }

                  /// prevent self-connect
                  if (couple['user1'] == user.id) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text("You can't connect to yourself 😅"),
                      ),
                    );
                    return;
                  }

                  /// already connected
                  if (couple['user2'] != null) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text("Already connected 💔"),
                      ),
                    );
                    return;
                  }

                  /// connect partner
                  await Supabase.instance.client
                      .from('couples')
                      .update({'user2': user.id})
                      .eq('id', couple['id']);

                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text("Connected successfully 💞"),
                    ),
                  );

                  Navigator.pop(context);
                },
                child: const Text("Connect 💞"),
              ),
            ),

            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
