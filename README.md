# Bureaucrats

Bureaucrats is a Flutter-based CSS preparation companion for Pakistan's Central Superior Services examination.

## Implemented in the repository
- Blue/white Flutter application shell
- Supabase email/password authentication UI
- Authenticated home screen and sign-out
- Study Centre with eight introductory Pakistan Affairs lessons
- Six evergreen Current Affairs analytical issue briefs
- Ten interactive Pakistan Affairs MCQs with answer explanations and score
- CSS syllabus planning checklist with an in-session progress indicator
- Essay writing screen and structured rubric feedback view
- Server-side Gemini evaluation through a Supabase Edge Function
- Initial Postgres schema with row-level security and user-owned essay history
- GitHub Actions workflow for Flutter static analysis and widget tests

## Not yet production complete
- Study content is a starter set, not the full CSS syllabus or a complete textbook-quality course.
- Current Affairs issue briefs are not a live, dated news feed. Facts, statistics and recent developments must be editorially verified and updated.
- Syllabus checklist progress currently lives only in the running screen; cross-device persistence is not implemented.
- MCQ bank is a small starter set and does not yet include all compulsory/optional subjects, timed mock exams or admin authoring.
- Essay history UI, subscription billing, admin/content CMS, notifications and analytics are not implemented.
- No dedicated Bureaucrats Supabase project has been connected; migrations and Edge Functions have not been deployed.
- No live Gemini request, Flutter build, device test or production deployment has been verified.

## Security
Never put a Supabase service-role/secret key or AI provider key in the Flutter app. Configure secrets only in the Supabase project. The Edge Function requires a valid user JWT. AI-generated marks are practice feedback, not an official FPSC result.

## Development
See [Development setup](docs/DEVELOPMENT.md) for local configuration and release checks.
