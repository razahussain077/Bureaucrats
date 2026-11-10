# Development setup

## Requirements
- Flutter stable with Dart 3.4+
- A dedicated Supabase project for Bureaucrats
- Gemini API key stored only as a Supabase Edge Function secret

## Run
1. Copy the project URL and publishable key from Supabase.
2. Run `flutter pub get`.
3. Run `flutter run --dart-define=SUPABASE_URL=https://YOUR_PROJECT.supabase.co --dart-define=SUPABASE_ANON_KEY=YOUR_PUBLISHABLE_KEY`.

The publishable/anon key is designed for client use; database access is constrained by RLS. Never ship a service-role key or Gemini key in the app.

## Supabase
1. Apply `supabase/migrations/202611100001_initial_schema.sql` using the Supabase SQL editor or CLI.
2. Deploy `supabase/functions/evaluate-essay` with JWT verification enabled.
3. Set `GEMINI_API_KEY` as an Edge Function secret.
4. Enable email/password authentication and configure email confirmation/redirect URLs for your app.
5. If the client later reads public tables directly, explicitly expose only the required tables in Data API settings and retain RLS. The current essay insert is server-side; the service-role key never reaches Flutter.

## Current milestone
The app shell, email authentication UI, essay submission interface, structured result view, SQL foundation and Edge Function are in the repository. Pakistan Affairs, Current Affairs, MCQ delivery, syllabus, payments, analytics, production observability, rate limiting and a full accessibility review are not complete.

## Quality gates
Run `flutter pub get`, `flutter analyze` and `flutter test`. Then test sign-up, email confirmation, sign-in and sign-out; verify RLS with two separate accounts; test malformed/oversized essays; validate model output; and review Supabase security/performance advisors. GitHub Actions runs static analysis and widget tests on pushes and pull requests.

## Supabase SDK compatibility
The project is pinned to the stable Supabase Flutter v2 line for this first milestone. Supabase announced a v3 major release for November 11, 2026, with breaking API changes; upgrade only with a deliberate migration and test pass.
