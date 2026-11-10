# Development setup

## Requirements
- Flutter stable with Dart 3.9 or later (see the SDK constraint in `pubspec.yaml`)
- Access to the Bureaucrats Supabase project
- Gemini API key stored only as a Supabase Edge Function secret

## Run locally
1. The app has the Bureaucrats project URL and publishable key configured as safe client-side defaults.
2. Run `flutter pub get`.
3. Run `flutter run`.

You can override the public configuration with `--dart-define=SUPABASE_URL=...` and `--dart-define=SUPABASE_PUBLISHABLE_KEY=...`. Never ship a service-role/secret key or Gemini key in Flutter.

## Deployed Supabase backend
- Project: `Bureaucrats` (`ap-south-1`, Mumbai)
- URL: `https://kqwdlktvuggxyaubcukj.supabase.co`
- Migration `initial_schema` has been applied and the `profiles` and `essay_submissions` tables have been verified.
- Edge Function `evaluate-essay` is deployed with JWT verification enabled.
- Add `GEMINI_API_KEY` under Supabase Dashboard → Project Settings → Edge Functions → Secrets (or the current Edge Function secrets interface). Do not add it to Flutter or GitHub source.
- Ensure email/password authentication and email confirmation/redirect URLs are configured for the intended app platforms.

## Quality gates
Run:
```sh
flutter pub get
flutter analyze --fatal-infos
flutter test
flutter build apk --release
```

Then test sign-up, email confirmation, sign-in and sign-out; verify RLS with two separate accounts; test malformed and oversized essays; validate Gemini output; and review Supabase security/performance advisors. GitHub Actions runs analysis and widget tests on pushes and pull requests, but a successful run must be confirmed before release.

## Current milestone
The app shell, authentication UI, Essay Examiner interface and deployed Edge Function, initial Pakistan Affairs lessons, Current Affairs issue briefs, interactive starter MCQ quiz and syllabus checklist are present. These study modules are a foundation, not a complete CSS course. User progress is not yet persisted across sessions. Android/iOS builds and end-to-end authentication/essay flows remain to be verified.

## Supabase SDK note
The app is pinned to the Supabase Flutter v2 line. Do not upgrade major versions automatically; follow the official migration guide and run the full test suite when deliberately upgrading.
