# Bureaucrats

A focused CSS preparation companion for Pakistan's Central Superior Services examination.

## Implemented foundation
- Flutter app shell with a clean blue/white visual system
- Email/password sign-up and sign-in through Supabase Auth
- Authenticated home screen and sign-out
- Essay writing screen with structured rubric feedback
- Server-side Gemini evaluation through a Supabase Edge Function
- Initial Postgres schema with row-level security and user-owned essay history
- GitHub Actions workflow for Flutter static analysis and widget tests

## Planned modules
- Pakistan Affairs and Current Affairs learning feed
- Syllabus and study progress
- MCQ practice with server-controlled answer validation
- Saved notes, revision planner and study analytics
- Subscription entitlements verified server-side

## Security
Never put a Supabase service-role/secret key or AI provider key in the Flutter app. Configure secrets only in the Supabase project. The Edge Function requires a valid user JWT. AI-generated marks are practice feedback, not an official FPSC result.

## Status
This is an active implementation, not a production release. It has not yet been built on a Flutter toolchain, connected to a Bureaucrats-specific Supabase project, or tested against a live Gemini key. See [Development setup](docs/DEVELOPMENT.md).
