import 'package:flutter/material.dart';

import 'core/theme.dart';
import 'features/home/home_screen.dart';

class BureaucratsApp extends StatelessWidget {
  const BureaucratsApp({super.key});

  @override
  Widget build(BuildContext context) => MaterialApp(
    title: 'Bureaucrats',
    debugShowCheckedModeBanner: false,
    theme: AppTheme.light,
    home: const HomeScreen(),
  );
}
