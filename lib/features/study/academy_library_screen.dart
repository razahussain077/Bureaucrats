import 'package:flutter/material.dart';

import 'academy_course_data.dart';

class AcademyLibraryScreen extends StatefulWidget {
  const AcademyLibraryScreen({super.key});

  @override
  State<AcademyLibraryScreen> createState() => _AcademyLibraryScreenState();
}

class _AcademyLibraryScreenState extends State<AcademyLibraryScreen> {
  int _selectedCourseIndex = 0;

  @override
  Widget build(BuildContext context) {
    final course = compulsoryAcademyCourses[_selectedCourseIndex];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(16, 18, 16, 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'ACADEMY CLASSROOM',
                style: TextStyle(
                  color: Color(0xFF1769AA),
                  fontSize: 10,
                  fontWeight: FontWeight.w900,
                  letterSpacing: 1.3,
                ),
              ),
              const SizedBox(height: 5),
              const Text(
                'Learn the subject. Understand the argument. Practise the answer.',
                style: TextStyle(fontSize: 19, fontWeight: FontWeight.w800),
              ),
              const SizedBox(height: 5),
              Text(
                'Choose a compulsory paper to open its chapter-wise lessons.',
                style: TextStyle(
                  fontSize: 12,
                  color: Theme.of(context).colorScheme.onSurfaceVariant,
                ),
              ),
              const SizedBox(height: 13),
              DropdownButtonFormField<int>(
                initialValue: _selectedCourseIndex,
                isExpanded: true,
                decoration: InputDecoration(
                  labelText: 'Select subject',
                  prefixIcon: const Icon(Icons.menu_book_rounded),
                  filled: true,
                  fillColor: const Color(0xFFF7FAFD),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: const BorderSide(color: Color(0xFFDCE6EF)),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: const BorderSide(color: Color(0xFFDCE6EF)),
                  ),
                ),
                items: [
                  for (var i = 0; i < compulsoryAcademyCourses.length; i++)
                    DropdownMenuItem(
                      value: i,
                      child: Text(
                        compulsoryAcademyCourses[i].title,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                ],
                onChanged: (value) {
                  if (value == null) return;
                  setState(() => _selectedCourseIndex = value);
                },
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(16, 0, 16, 12),
          child: Container(
            width: double.infinity,
            padding: const EdgeInsets.all(15),
            decoration: BoxDecoration(
              color: const Color(0xFF123B63),
              borderRadius: BorderRadius.circular(14),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        course.title.toUpperCase(),
                        style: const TextStyle(
                          color: Color(0xFFB9D9F5),
                          fontSize: 10,
                          letterSpacing: 1.1,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                    ),
                    Text(
                      course.marks,
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w800,
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                Text(
                  course.description,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 13,
                    height: 1.5,
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  '${course.chapters.length} chapters • ${course.chapters.fold<int>(0, (total, chapter) => total + chapter.lessons.length)} lessons',
                  style: const TextStyle(
                    color: Color(0xFFB9D9F5),
                    fontSize: 11,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ],
            ),
          ),
        ),
        Expanded(
          child: ListView.builder(
            padding: const EdgeInsets.fromLTRB(16, 0, 16, 24),
            itemCount: course.chapters.length + 1,
            itemBuilder: (context, index) {
              if (index == course.chapters.length) {
                return Padding(
                  padding: const EdgeInsets.only(top: 8, bottom: 12),
                  child: Text(
                    'Course alignment: chapter headings map to the official FPSC CSS syllabus. Use the latest FPSC notice and syllabus for any revised requirements.',
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.onSurfaceVariant,
                      fontSize: 11,
                      height: 1.5,
                    ),
                  ),
                );
              }

              final chapter = course.chapters[index];
              return Card(
                margin: const EdgeInsets.only(bottom: 10),
                clipBehavior: Clip.antiAlias,
                child: ExpansionTile(
                  key: PageStorageKey<String>(
                    '${course.title}-${chapter.number}',
                  ),
                  initiallyExpanded: index == 0,
                  leading: CircleAvatar(
                    backgroundColor: const Color(0xFFEAF3FB),
                    foregroundColor: const Color(0xFF1769AA),
                    child: Text(
                      chapter.number,
                      style: const TextStyle(
                        fontSize: 11,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                  ),
                  title: Text(
                    chapter.title,
                    style: const TextStyle(fontWeight: FontWeight.w800),
                  ),
                  subtitle: Text(
                    '${chapter.lessons.length} lesson${chapter.lessons.length == 1 ? '' : 's'}',
                  ),
                  childrenPadding: const EdgeInsets.fromLTRB(14, 0, 14, 16),
                  children: [
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(11),
                      decoration: BoxDecoration(
                        color: const Color(0xFFF0F6FC),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Text(
                        'FPSC SYLLABUS LINKAGE\n${chapter.syllabusLink}',
                        style: const TextStyle(height: 1.45, fontSize: 12),
                      ),
                    ),
                    const SizedBox(height: 10),
                    for (final lesson in chapter.lessons)
                      _LessonPanel(lesson: lesson),
                  ],
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}

class _LessonPanel extends StatelessWidget {
  const _LessonPanel({required this.lesson});

  final AcademyLesson lesson;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(top: 8),
      color: const Color(0xFFFCFDFE),
      child: ExpansionTile(
        tilePadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 3),
        childrenPadding: const EdgeInsets.fromLTRB(14, 0, 14, 14),
        title: Text(
          lesson.title,
          style: const TextStyle(fontWeight: FontWeight.w700, fontSize: 14),
        ),
        subtitle: Text(
          lesson.objectives,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
        ),
        children: [
          for (final section in lesson.sections) ...[
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.only(top: 12, bottom: 5),
                child: Text(
                  section.heading,
                  style: const TextStyle(
                    color: Color(0xFF1769AA),
                    fontWeight: FontWeight.w800,
                    fontSize: 13,
                  ),
                ),
              ),
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                section.content,
                style: const TextStyle(fontSize: 13, height: 1.65),
              ),
            ),
          ],
          const SizedBox(height: 14),
          const Align(
            alignment: Alignment.centerLeft,
            child: Text(
              'KEY TERMS',
              style: TextStyle(
                color: Color(0xFF1769AA),
                fontSize: 10,
                fontWeight: FontWeight.w900,
                letterSpacing: 1,
              ),
            ),
          ),
          const SizedBox(height: 7),
          Align(
            alignment: Alignment.centerLeft,
            child: Wrap(
              spacing: 6,
              runSpacing: 6,
              children: [
                for (final term in lesson.keyTerms)
                  Chip(
                    label: Text(term, style: const TextStyle(fontSize: 11)),
                    backgroundColor: const Color(0xFFEAF3FB),
                    side: BorderSide.none,
                    visualDensity: VisualDensity.compact,
                    padding: EdgeInsets.zero,
                  ),
              ],
            ),
          ),
          const SizedBox(height: 12),
          _LessonPrompt(
            title: 'CSS EXAM QUESTION',
            content: lesson.examQuestion,
          ),
          const SizedBox(height: 8),
          _LessonPrompt(
            title: 'CLASSWORK',
            content: lesson.practiceTask,
          ),
        ],
      ),
    );
  }
}

class _LessonPrompt extends StatelessWidget {
  const _LessonPrompt({required this.title, required this.content});

  final String title;
  final String content;

  @override
  Widget build(BuildContext context) => Container(
        width: double.infinity,
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: const Color(0xFFF0F6FC),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(
                color: Color(0xFF1769AA),
                fontSize: 10,
                fontWeight: FontWeight.w900,
                letterSpacing: .8,
              ),
            ),
            const SizedBox(height: 5),
            Text(content, style: const TextStyle(height: 1.5, fontSize: 12)),
          ],
        ),
      );
}
