import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'core/config.dart';
import 'core/theme.dart';
import 'features/auth/auth_screen.dart';
import 'features/home/home_screen.dart';

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
              return session == null ? const AuthScreen() : const HomeScreen();
            },
          ),
  );
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
