import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'core/config.dart';
import 'core/theme.dart';
import 'features/auth/auth_screen.dart';
import 'features/home/home_screen.dart';
import 'features/study/study_hub_screen.dart';

class BureaucratsApp extends StatelessWidget {
  const BureaucratsApp({super.key});

  @override
  Widget build(BuildContext context) => MaterialApp(
    title: 'Bureaucrats',
    debugShowCheckedModeBanner: false,
    theme: AppTheme.light,
    home: !AppConfig.hasSupabase
        ? const _ConfigurationScreen()
        : StreamBuilder<AuthState>(
            stream: Supabase.instance.client.auth.onAuthStateChange,
            builder: (context, snapshot) {
              final session = Supabase.instance.client.auth.currentSession;
              return session == null ? const _GuestPreviewScreen() : const HomeScreen();
            },
          ),
  );
}

class _GuestPreviewScreen extends StatefulWidget {
  const _GuestPreviewScreen();

  @override
  State<_GuestPreviewScreen> createState() => _GuestPreviewScreenState();
}

class _GuestPreviewScreenState extends State<_GuestPreviewScreen> {
  bool _showSignIn = false;

  @override
  Widget build(BuildContext context) {
    if (_showSignIn) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Sign in'),
          leading: IconButton(
            tooltip: 'Back to guest preview',
            onPressed: () => setState(() => _showSignIn = false),
            icon: const Icon(Icons.arrow_back),
          ),
        ),
        body: const AuthScreen(),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Bureaucrats · Guest preview'),
        actions: [
          TextButton.icon(
            onPressed: () => setState(() => _showSignIn = true),
            icon: const Icon(Icons.login_rounded),
            label: const Text('Sign in'),
          ),
          const SizedBox(width: 12),
        ],
      ),
      body: Column(
        children: [
          Material(
            color: const Color(0xFFEAF3FB),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 12),
              child: Row(
                children: [
                  const Icon(Icons.visibility_outlined, color: AppTheme.blue),
                  const SizedBox(width: 10),
                  const Expanded(
                    child: Text(
                      'You are browsing as a guest. Study resources are open; sign in only when you want to use your personal workspace and essay evaluation.',
                      style: TextStyle(fontSize: 12, height: 1.4),
                    ),
                  ),
                ],
              ),
            ),
          ),
          const Expanded(child: StudyHubScreen()),
        ],
      ),
    );
  }
}

class _ConfigurationScreen extends StatelessWidget {
  const _ConfigurationScreen();

  @override
  Widget build(BuildContext context) => const Scaffold(
    body: Center(
      child: Padding(
        padding: EdgeInsets.all(28),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.school_outlined, size: 48, color: AppTheme.blue),
            SizedBox(height: 16),
            Text('Bureaucrats', style: TextStyle(fontSize: 26, fontWeight: FontWeight.w800)),
            SizedBox(height: 8),
            Text('Connect your Supabase project using the setup guide to enable accounts and essay evaluation.', textAlign: TextAlign.center),
          ],
        ),
      ),
    ),
  );
}
