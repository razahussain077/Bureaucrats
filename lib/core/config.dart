class AppConfig {
  // Supabase publishable keys are intended for client-side use.
  // Authorization is enforced by Postgres RLS and authenticated Edge Functions.
  static const supabaseUrl = String.fromEnvironment(
    'SUPABASE_URL',
    defaultValue: 'https://kqwdlktvuggxyaubcukj.supabase.co',
  );
  static const supabasePublishableKey = String.fromEnvironment(
    'SUPABASE_PUBLISHABLE_KEY',
    defaultValue: 'sb_publishable_xuynuYR7sipnsr4ap0aL2A_eAW4DjwI',
  );
  static bool get hasSupabase => supabaseUrl.isNotEmpty && supabasePublishableKey.isNotEmpty;
}
