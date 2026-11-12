# Bureaucrats

Bureaucrats is a Flutter-based CSS preparation companion for Pakistan's Central Superior Services examination.

## Implemented in the repository
- Blue/white Flutter application shell
- Supabase email/password authentication UI, connected to the dedicated Bureaucrats project
- Authenticated home screen and sign-out
- Academy Classroom with 46 syllabus-mapped chapter lessons across Pakistan Affairs (12), English Essay (4), English Precis & Composition (4), General Science & Ability (9), Current Affairs (4), Islamic Studies (7) and the Comparative Study of Major Religions alternative paper (6)
- Each classroom lesson includes explanatory teaching sections, key terms, a CSS-style question and classwork
- Twenty optional-paper courses now have structured chapter maps and teaching, including Political Science, International Relations, Economics, Computer Science, Public Administration, Gender Studies, Sociology, Criminology, Environmental Sciences, Business Administration, Accountancy & Auditing, Agriculture & Forestry, Anthropology, Applied Mathematics, Physics, Chemistry, Constitutional Law, British History, Governance & Public Policies and Town Planning & Urban Management (96 chapters / 80 structured lessons). This is substantial coverage, but it is not a verified exhaustive transcription of every FPSC optional syllabus clause.
- Six evergreen Current Affairs issue briefs in the older Study Centre tab
- Ten interactive Pakistan Affairs MCQs with answer explanations and score
- CSS syllabus planning checklist with an in-session progress indicator
- Essay writing screen and structured rubric feedback view
- Deployed, JWT-protected Supabase Edge Function for Gemini-based essay evaluation
- Supabase Postgres schema for profiles and user-owned essay submissions, with RLS enabled
- GitHub Actions workflow for Flutter static analysis and widget tests

## Live backend
- Supabase project: `Bureaucrats`
- Region: Mumbai (`ap-south-1`)
- Project URL: `https://kqwdlktvuggxyaubcukj.supabase.co`
- Database migration applied; `profiles` and `essay_submissions` tables verified with RLS enabled.
- Edge Function `evaluate-essay` deployed with JWT verification enabled.
- Security advisor currently reports no findings. Performance advisor reports one informational unused-index notice on the new essay history index; this is expected before real usage.

## Remaining production work
- Add `GEMINI_API_KEY` as a Supabase Edge Function secret; without it the live essay examiner returns a server-not-configured error.
- Complete sign-up, email confirmation, sign-in and sign-out tests against the deployed project.
- Run and verify Flutter analyze, widget tests, Android build and device testing.
- The Academy Classroom now contains expanded compulsory-paper teaching across Pakistan Affairs, English Essay, English Precis & Composition, General Science & Ability, Current Affairs and Islamic Studies. This is still not a claim that every FPSC syllabus clause has been fully exhausted; source notes, diagrams/data, further practice questions and expert-reviewed answer keys remain ongoing work.
- The twenty optional-paper courses have expanded teaching but still require a line-by-line audit against the latest official FPSC syllabi, additional topic depth, diagrams/data where relevant, practice questions and expert-reviewed answer keys.
- Comparative Study of Major Religions is included as an alternative-paper course; it also needs further depth, references and question-bank coverage.
- Current Affairs issue briefs are evergreen, not a live, dated news feed.
- Syllabus checklist progress currently lives only in the running screen; cross-device persistence is not implemented.
- MCQ bank is a small starter set and does not yet include all compulsory/optional subjects, timed mock exams or admin authoring.
- Essay history UI, subscription billing, admin/content CMS, notifications and analytics are not implemented.
- No Android APK/IPA or production store release has been verified.

## Security
Never put a Supabase service-role/secret key or AI provider key in the Flutter app. Configure secrets only in Supabase Edge Function secrets. The Edge Function requires a valid user JWT. AI-generated marks are practice feedback, not an official FPSC result.

## Development
See [Development setup](docs/DEVELOPMENT.md) for local configuration and release checks.
