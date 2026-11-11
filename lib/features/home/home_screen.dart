import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../essay/essay_screen.dart';
import '../study/study_hub_screen.dart';

const _workspaceNav = [
  (Icons.space_dashboard_rounded, 'Overview'),
  (Icons.menu_book_rounded, 'Study Centre'),
  (Icons.edit_note_rounded, 'Essay Examiner'),
];

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _section = 0;

  static const _nav = _workspaceNav;

  void _open(int index) => setState(() => _section = index);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      final wide = constraints.maxWidth >= 900;
      final compact = constraints.maxWidth < 620;
      final title = _nav[_section].$2;
      return Scaffold(
        backgroundColor: const Color(0xFFF5F8FC),
        appBar: AppBar(
          toolbarHeight: 72,
          titleSpacing: wide ? 28 : 18,
          title: Row(children: [
            if (!wide) const _BrandMark(),
            if (!wide) const SizedBox(width: 10),
            Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text(title, style: const TextStyle(fontSize: 17, fontWeight: FontWeight.w800, color: Color(0xFF102A43))),
              if (!compact) const Text('CSS preparation workspace', style: TextStyle(fontSize: 11, color: Color(0xFF718096), fontWeight: FontWeight.w500)),
            ]),
          ]),
          actions: [
            if (!compact) const _TopPill(icon: Icons.calendar_today_rounded, label: 'CSS 2027'),
            const SizedBox(width: 10),
            IconButton(
              tooltip: 'Sign out',
              onPressed: () async => Supabase.instance.client.auth.signOut(),
              icon: const Icon(Icons.logout_rounded, size: 20),
            ),
            const SizedBox(width: 12),
          ],
        ),
        body: Row(children: [
          if (wide) _Sidebar(selected: _section, onSelect: _open),
          Expanded(child: _section == 0
              ? _Dashboard(onNavigate: _open, compact: compact)
              : _section == 1
                  ? const StudyHubScreen()
                  : const EssayScreen()),
        ]),
        bottomNavigationBar: wide ? null : NavigationBar(
          selectedIndex: _section,
          onDestinationSelected: _open,
          height: 68,
          destinations: const [
            NavigationDestination(icon: Icon(Icons.space_dashboard_outlined), selectedIcon: Icon(Icons.space_dashboard_rounded), label: 'Home'),
            NavigationDestination(icon: Icon(Icons.menu_book_outlined), selectedIcon: Icon(Icons.menu_book_rounded), label: 'Study'),
            NavigationDestination(icon: Icon(Icons.edit_note_outlined), selectedIcon: Icon(Icons.edit_note_rounded), label: 'Essay'),
          ],
        ),
      );
    });
  }
}

class _Sidebar extends StatelessWidget {
  const _Sidebar({required this.selected, required this.onSelect});
  final int selected;
  final ValueChanged<int> onSelect;

  @override
  Widget build(BuildContext context) => Container(
    width: 248,
    color: Colors.white,
    padding: const EdgeInsets.fromLTRB(18, 24, 14, 18),
    child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      const Padding(padding: EdgeInsets.only(left: 10, bottom: 34), child: Row(children: [
        _BrandMark(), SizedBox(width: 11),
        Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text('Bureaucrats', style: TextStyle(fontWeight: FontWeight.w900, fontSize: 17, color: Color(0xFF102A43), letterSpacing: -.4)),
          Text('CSS PREPARATION', style: TextStyle(fontSize: 9, letterSpacing: 1.3, color: Color(0xFF718096), fontWeight: FontWeight.w800)),
        ]),
      ])),
      const Padding(padding: EdgeInsets.only(left: 12, bottom: 10), child: Text('WORKSPACE', style: TextStyle(fontSize: 10, letterSpacing: 1.3, color: Color(0xFF9AA8B7), fontWeight: FontWeight.w800))),
      ...List.generate(_workspaceNav.length, (i) {
        final item = _workspaceNav[i];
        final active = selected == i;
        return Padding(
          padding: const EdgeInsets.only(bottom: 5),
          child: Material(
            color: active ? const Color(0xFFEAF3FB) : Colors.transparent,
            borderRadius: BorderRadius.circular(11),
            child: InkWell(
              borderRadius: BorderRadius.circular(11),
              onTap: () => onSelect(i),
              child: Padding(padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 13), child: Row(children: [
                Icon(item.$1, size: 19, color: active ? const Color(0xFF1769AA) : const Color(0xFF718096)),
                const SizedBox(width: 12),
                Text(item.$2, style: TextStyle(fontSize: 13, fontWeight: active ? FontWeight.w800 : FontWeight.w600, color: active ? const Color(0xFF1769AA) : const Color(0xFF526579))),
              ])),
            ),
          ),
        );
      }),
      const Spacer(),
      Container(
        padding: const EdgeInsets.all(14),
        decoration: BoxDecoration(color: const Color(0xFFF5F8FC), borderRadius: BorderRadius.circular(13)),
        child: const Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Icon(Icons.verified_user_outlined, color: Color(0xFF1769AA), size: 19),
          SizedBox(height: 9),
          Text('Prepare with purpose', style: TextStyle(fontWeight: FontWeight.w800, color: Color(0xFF102A43), fontSize: 12)),
          SizedBox(height: 5),
          Text('Build concepts, practise retrieval and improve your written arguments.', style: TextStyle(fontSize: 11, height: 1.45, color: Color(0xFF718096))),
        ]),
      ),
      const SizedBox(height: 12),
      const Padding(padding: EdgeInsets.only(left: 10), child: Text('Version 0.1 • Learning edition', style: TextStyle(fontSize: 10, color: Color(0xFF9AA8B7)))),
    ]),
  );
}

class _Dashboard extends StatelessWidget {
  const _Dashboard({required this.onNavigate, required this.compact});
  final ValueChanged<int> onNavigate;
  final bool compact;

  @override
  Widget build(BuildContext context) {
    final email = Supabase.instance.client.auth.currentUser?.email;
    final firstName = email == null ? 'Aspirant' : email.split('@').first;
    return SingleChildScrollView(
      padding: EdgeInsets.fromLTRB(compact ? 16 : 34, 28, compact ? 16 : 34, 36),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1240),
          child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                const Text('YOUR CSS JOURNEY', style: TextStyle(fontSize: 10, letterSpacing: 1.6, color: Color(0xFF1769AA), fontWeight: FontWeight.w900)),
                const SizedBox(height: 9),
                Text('Good to see you, $firstName.', maxLines: 2, overflow: TextOverflow.ellipsis, style: TextStyle(fontSize: compact ? 25 : 31, height: 1.15, fontWeight: FontWeight.w900, letterSpacing: -.8, color: const Color(0xFF102A43))),
                const SizedBox(height: 8),
                const Text('A clear plan turns preparation into measurable progress.', style: TextStyle(fontSize: 13, color: Color(0xFF718096))),
              ])),
              if (!compact) const _TopPill(icon: Icons.auto_awesome_rounded, label: 'Your learning desk'),
            ]),
            const SizedBox(height: 25),
            _HeroCard(onStudy: () => onNavigate(1), compact: compact),
            const SizedBox(height: 25),
            const _SectionHeading(title: 'Your preparation toolkit', subtitle: 'Focused resources for the written examination'),
            const SizedBox(height: 13),
            LayoutBuilder(builder: (context, box) {
              final cols = box.maxWidth > 850 ? 4 : box.maxWidth > 540 ? 2 : 1;
              final items = [
                _ToolData(Icons.account_balance_rounded, 'Pakistan Affairs', '8 foundation lessons', 'Historical context, constitutional development and analytical frameworks', const Color(0xFFEAF3FB), () => onNavigate(1)),
                _ToolData(Icons.public_rounded, 'Current Affairs', '6 issue briefs', 'Build balanced arguments around national and global challenges', const Color(0xFFEAF5F0), () => onNavigate(1)),
                _ToolData(Icons.quiz_rounded, 'MCQ Practice', '30 practice questions', 'Test recall with instant explanations and answer feedback', const Color(0xFFFFF4E5), () => onNavigate(1)),
                _ToolData(Icons.edit_note_rounded, 'Essay Examiner', 'Structured feedback', 'Practise thesis, structure, evidence, analysis and expression', const Color(0xFFF1EDFC), () => onNavigate(2)),
              ];
              return GridView.count(
                crossAxisCount: cols,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                crossAxisSpacing: 12,
                mainAxisSpacing: 12,
                childAspectRatio: compact ? 2.0 : cols == 4 ? 1.05 : 1.6,
                children: items.map((item) => _ToolCard(item: item)).toList(),
              );
            }),
            const SizedBox(height: 26),
            LayoutBuilder(builder: (context, box) {
              final stacked = box.maxWidth < 760;
              final plan = const _StudyPlanCard();
              final guidance = const _GuidanceCard();
              if (stacked) return Column(children: [plan, const SizedBox(height: 14), guidance]);
              return Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Expanded(flex: 6, child: plan),
                const SizedBox(width: 14),
                Expanded(flex: 4, child: guidance),
              ]);
            }),
            const SizedBox(height: 22),
            const _FooterNote(),
          ]),
        ),
      ),
    );
  }
}

class _HeroCard extends StatelessWidget {
  const _HeroCard({required this.onStudy, required this.compact});
  final VoidCallback onStudy;
  final bool compact;
  @override
  Widget build(BuildContext context) => Container(
    width: double.infinity,
    padding: EdgeInsets.all(compact ? 20 : 28),
    decoration: BoxDecoration(
      gradient: const LinearGradient(begin: Alignment.topLeft, end: Alignment.bottomRight, colors: [Color(0xFF123B63), Color(0xFF1769AA)]),
      borderRadius: BorderRadius.circular(20),
    ),
    child: Stack(children: [
      Positioned(right: -8, top: -22, child: Icon(Icons.school_rounded, size: compact ? 100 : 150, color: Colors.white.withValues(alpha: .07))),
      Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        const Text('THE DISCIPLINED ASPIRANT', style: TextStyle(color: Color(0xFFB9D9F5), fontSize: 10, letterSpacing: 1.5, fontWeight: FontWeight.w900)),
        const SizedBox(height: 13),
        Text('Learn deeply.\nWrite with clarity.', style: TextStyle(color: Colors.white, fontSize: compact ? 25 : 31, height: 1.15, fontWeight: FontWeight.w900, letterSpacing: -.6)),
        const SizedBox(height: 10),
        ConstrainedBox(constraints: const BoxConstraints(maxWidth: 500), child: const Text('CSS rewards understanding, evidence and a structured argument. Start with one topic, test what you remember, then write what you know.', style: TextStyle(color: Color(0xFFE1EDF7), height: 1.5, fontSize: 13))),
        const SizedBox(height: 19),
        FilledButton.icon(
          onPressed: onStudy,
          style: FilledButton.styleFrom(backgroundColor: Colors.white, foregroundColor: const Color(0xFF145B94), padding: const EdgeInsets.symmetric(horizontal: 17, vertical: 13)),
          icon: const Icon(Icons.menu_book_rounded, size: 17),
          label: const Text('Continue learning', style: TextStyle(fontWeight: FontWeight.w800)),
        ),
      ]),
    ]),
  );
}

class _ToolCard extends StatelessWidget {
  const _ToolCard({required this.item});
  final _ToolData item;
  @override
  Widget build(BuildContext context) => Material(
    color: Colors.white,
    borderRadius: BorderRadius.circular(15),
    child: InkWell(
      borderRadius: BorderRadius.circular(15),
      onTap: item.onTap,
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(border: Border.all(color: const Color(0xFFE6EDF4)), borderRadius: BorderRadius.circular(15)),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Container(width: 38, height: 38, decoration: BoxDecoration(color: item.tint, borderRadius: BorderRadius.circular(11)), child: Icon(item.icon, color: const Color(0xFF1769AA), size: 19)),
          const SizedBox(height: 13),
          Text(item.title, style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w900, color: Color(0xFF102A43))),
          const SizedBox(height: 4),
          Text(item.meta, style: const TextStyle(fontSize: 10, color: Color(0xFF1769AA), fontWeight: FontWeight.w800)),
          const SizedBox(height: 8),
          Expanded(child: Text(item.description, style: const TextStyle(fontSize: 11, height: 1.45, color: Color(0xFF718096)))),
          const Row(children: [Text('Open resource', style: TextStyle(fontSize: 11, fontWeight: FontWeight.w800, color: Color(0xFF1769AA))), SizedBox(width: 5), Icon(Icons.arrow_forward_rounded, size: 14, color: Color(0xFF1769AA))]),
        ]),
      ),
    ),
  );
}

class _StudyPlanCard extends StatelessWidget {
  const _StudyPlanCard();
  @override
  Widget build(BuildContext context) => Container(
    padding: const EdgeInsets.all(20),
    decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(16), border: Border.all(color: const Color(0xFFE6EDF4))),
    child: const Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      _SectionHeading(title: 'A practical study session', subtitle: 'A suggested 2-hour routine to build consistency'),
      const SizedBox(height: 17),
      const _PlanRow(time: '35 min', title: 'Concept study', detail: 'Read one Pakistan Affairs lesson actively', icon: Icons.menu_book_rounded),
      const _PlanRow(time: '20 min', title: 'Active recall', detail: 'Close your notes and reconstruct key points', icon: Icons.psychology_alt_rounded),
      const _PlanRow(time: '25 min', title: 'MCQ practice', detail: 'Test recall and review every explanation', icon: Icons.quiz_rounded),
      const _PlanRow(time: '40 min', title: 'Answer writing', detail: 'Write one structured analytical response', icon: Icons.edit_note_rounded, last: true),
    ]),
  );
}

class _PlanRow extends StatelessWidget {
  const _PlanRow({required this.time, required this.title, required this.detail, required this.icon, this.last = false});
  final String time, title, detail;
  final IconData icon;
  final bool last;
  @override
  Widget build(BuildContext context) => Padding(
    padding: const EdgeInsets.only(top: 12),
    child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Container(width: 34, height: 34, decoration: BoxDecoration(color: const Color(0xFFEAF3FB), borderRadius: BorderRadius.circular(10)), child: Icon(icon, size: 17, color: const Color(0xFF1769AA))),
      const SizedBox(width: 11),
      Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Row(children: [Expanded(child: Text(title, style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w800, color: Color(0xFF243B53)))), Text(time, style: const TextStyle(fontSize: 10, color: Color(0xFF1769AA), fontWeight: FontWeight.w800))]),
        const SizedBox(height: 3),
        Text(detail, style: const TextStyle(fontSize: 11, color: Color(0xFF718096))),
        if (!last) const Divider(height: 16, color: Color(0xFFEDF1F5)),
      ])),
    ]),
  );
}

class _GuidanceCard extends StatelessWidget {
  const _GuidanceCard();
  @override
  Widget build(BuildContext context) => Container(
    padding: const EdgeInsets.all(20),
    decoration: BoxDecoration(color: const Color(0xFFEAF3FB), borderRadius: BorderRadius.circular(16)),
    child: const Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Icon(Icons.lightbulb_outline_rounded, color: Color(0xFF1769AA), size: 23),
      SizedBox(height: 12),
      Text('Think like an examiner', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w900, color: Color(0xFF102A43))),
      SizedBox(height: 8),
      Text('A strong CSS answer does more than repeat facts. It defines the issue, builds a defensible thesis, supports claims with credible evidence and weighs counterarguments.', style: TextStyle(fontSize: 12, height: 1.55, color: Color(0xFF486581))),
      SizedBox(height: 14),
      Text('BEFORE YOU SUBMIT AN ANSWER', style: TextStyle(fontSize: 9, letterSpacing: 1.1, fontWeight: FontWeight.w900, color: Color(0xFF1769AA))),
      SizedBox(height: 8),
      _CheckLine('Does the introduction answer the question?'),
      _CheckLine('Does each paragraph make one clear point?'),
      _CheckLine('Are examples and facts relevant and verified?'),
      _CheckLine('Does the conclusion follow from the analysis?'),
    ]),
  );
}

class _CheckLine extends StatelessWidget {
  const _CheckLine(this.label);
  final String label;
  @override
  Widget build(BuildContext context) => Padding(
    padding: const EdgeInsets.only(bottom: 7),
    child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
      const Icon(Icons.check_circle_outline, size: 14, color: Color(0xFF1769AA)),
      const SizedBox(width: 7),
      Expanded(child: Text(label, style: const TextStyle(fontSize: 10, height: 1.35, color: Color(0xFF486581)))),
    ]),
  );
}

class _SectionHeading extends StatelessWidget {
  const _SectionHeading({required this.title, required this.subtitle});
  final String title, subtitle;
  @override
  Widget build(BuildContext context) => Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
    Text(title, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w900, color: Color(0xFF102A43))),
    const SizedBox(height: 4),
    Text(subtitle, style: const TextStyle(fontSize: 11, color: Color(0xFF718096))),
  ]);
}

class _FooterNote extends StatelessWidget {
  const _FooterNote();
  @override
  Widget build(BuildContext context) => const Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
    Icon(Icons.info_outline_rounded, size: 15, color: Color(0xFF718096)),
    SizedBox(width: 8),
    Expanded(child: Text('Learning content is an initial foundation set. Verify the latest FPSC syllabus, paper rules, dates and current-affairs evidence from official sources. Your dashboard currently provides a study framework, not an official FPSC preparation or scoring service.', style: TextStyle(fontSize: 10, height: 1.45, color: Color(0xFF718096)))),
  ]);
}

class _TopPill extends StatelessWidget {
  const _TopPill({required this.icon, required this.label});
  final IconData icon;
  final String label;
  @override
  Widget build(BuildContext context) => Container(
    padding: const EdgeInsets.symmetric(horizontal: 11, vertical: 8),
    decoration: BoxDecoration(color: const Color(0xFFF0F6FC), borderRadius: BorderRadius.circular(30)),
    child: Row(children: [Icon(icon, size: 13, color: const Color(0xFF1769AA)), const SizedBox(width: 6), Text(label, style: const TextStyle(fontSize: 10, fontWeight: FontWeight.w800, color: Color(0xFF486581)))]),
  );
}

class _BrandMark extends StatelessWidget {
  const _BrandMark();
  @override
  Widget build(BuildContext context) => Container(
    width: 38, height: 38,
    decoration: BoxDecoration(color: const Color(0xFF1769AA), borderRadius: BorderRadius.circular(11)),
    child: const Icon(Icons.account_balance_rounded, color: Colors.white, size: 21),
  );
}

class _ToolData {
  const _ToolData(this.icon, this.title, this.meta, this.description, this.tint, this.onTap);
  final IconData icon;
  final String title, meta, description;
  final Color tint;
  final VoidCallback onTap;
}
