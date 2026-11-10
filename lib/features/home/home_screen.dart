import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import '../essay/essay_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Bureaucrats'), actions: [
        IconButton(onPressed: () async { await Supabase.instance.client.auth.signOut(); }, icon: const Icon(Icons.logout), tooltip: 'Sign out'),
        const SizedBox(width: 8),
      ]),
      body: SafeArea(
        child: ListView(padding: const EdgeInsets.all(20), children: [
          const Text('Prepare with direction.', style: TextStyle(fontSize: 28, fontWeight: FontWeight.w800, color: Color(0xFF102A43))),
          const SizedBox(height: 8),
          const Text('A disciplined workspace for your CSS journey.', style: TextStyle(color: Color(0xFF526579), fontSize: 15)),
          const SizedBox(height: 24),
          _DailyFocusCard(),
          const SizedBox(height: 18),
          const Text('Your preparation', style: TextStyle(fontSize: 19, fontWeight: FontWeight.w700)),
          const SizedBox(height: 12),
          _ModuleTile(icon: Icons.edit_note_rounded, title: 'Essay Examiner', subtitle: 'Submit an essay for structured, FPSC-style feedback', onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const EssayScreen()))),
          const _ModuleTile(icon: Icons.public, title: 'Pakistan Affairs', subtitle: 'Structured topics and analytical revision', onTap: null),
          const _ModuleTile(icon: Icons.newspaper, title: 'Current Affairs', subtitle: 'Daily issues, context and critical analysis', onTap: null),
          const _ModuleTile(icon: Icons.quiz_outlined, title: 'MCQ Practice', subtitle: 'Practice questions with explanations', onTap: null),
          const SizedBox(height: 16),
          const Text('Modules marked as coming soon are not yet connected to live content.', style: TextStyle(color: Color(0xFF718096), fontSize: 12)),
        ]),
      ),
    );
  }
}

class _DailyFocusCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Container(
    padding: const EdgeInsets.all(20),
    decoration: BoxDecoration(color: const Color(0xFF102A43), borderRadius: BorderRadius.circular(20)),
    child: const Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text('TODAY\'S FOCUS', style: TextStyle(color: Color(0xFF9CC7F0), fontWeight: FontWeight.w700, letterSpacing: 1.2, fontSize: 11)),
      SizedBox(height: 10),
      Text('Build the argument,\nnot just the notes.', style: TextStyle(color: Colors.white, fontSize: 22, fontWeight: FontWeight.w700)),
      SizedBox(height: 8),
      Text('Practice evidence, reasoning and a clear thesis.', style: TextStyle(color: Color(0xFFD9E2EC))),
    ]),
  );
}

class _ModuleTile extends StatelessWidget {
  const _ModuleTile({required this.icon, required this.title, required this.subtitle, required this.onTap});
  final IconData icon;
  final String title;
  final String subtitle;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) => Card(
    margin: const EdgeInsets.only(bottom: 10),
    child: ListTile(
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      leading: CircleAvatar(backgroundColor: const Color(0xFFEAF3FB), foregroundColor: const Color(0xFF1769AA), child: Icon(icon)),
      title: Text(title, style: const TextStyle(fontWeight: FontWeight.w700)),
      subtitle: Text(subtitle),
      trailing: Icon(onTap == null ? Icons.lock_outline : Icons.arrow_forward_ios, size: 16, color: const Color(0xFF718096)),
      onTap: onTap,
    ),
  );
}
