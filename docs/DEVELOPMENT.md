# Development setup

## Requirements
- Flutter stable with Dart 3.9 or later (see the SDK constraint in pubspec.yaml)
- A dedicated Supabase project for Bureaucrats
- Gemini API key stored only as a Supabase Edge Function secret

## Run locally
1. Copy the project URL and publishable key from the Supabase project Connect panel.
2. Run `flutter pub get`.
3. Run `flutter run --dart-define=SUPABASE_URL=https://YOUR_PROJECT.supabase.co --dart-define=SUPABASE_PUBLISHABLE_KEY=YOUR_PUBLISHABLE_KEY`.

The publishable key is designed for client use; database access is constrained by RLS. Never ship a service-role key or Gemini key in Flutter.

## Supabase setup
1. Create a dedicated Supabase project for Bureaucrats.
2. Apply `supabase/migrations/202611100001_initial_schema.sql` using the Supabase SQL editor or the Supabase CLI migration workflow.
3. Deploy `supabase/functions/evaluate-essay` with JWT verification enabled.
4. Set `GEMINI_API_KEY` as an Edge Function secret.
5. Enable email/password authentication and configure email confirmation/redirect URLs for the app.
6. Confirm the required tables are exposed through the Data API where applicable and retain RLS.

## Quality gates
Run:
```sh
flutter pub get
flutter analyze --fatal-infos
flutter test
```

Then test sign-up, email confirmation, sign-in and sign-out; verify RLS with two separate accounts; test malformed and oversized essays; validate Gemini output; and review Supabase security/performance advisors. GitHub Actions runs analysis and widget tests on pushes and pull requests, but a successful run must be confirmed before release.

## Current milestone
The repository contains the app shell, authentication UI, Essay Examiner interface and Edge Function, initial Pakistan Affairs lessons, Current Affairs issue briefs, an interactive starter MCQ quiz and a syllabus checklist. These study modules are a functional foundation, not a complete CSS course. User progress is not yet persisted across sessions. See README for the remaining release blockers.

## Supabase SDK note
The app is pinned to the Supabase Flutter v2 line. Supabase announced v3 as a breaking major release planned for November 11, 2026. Do not upgrade automatically: follow the official migration guide and run the full test suite when deliberately upgrading. See the [v3 breaking-change notice](https://supabase.com/changelog/supabase-flutter-v3).
