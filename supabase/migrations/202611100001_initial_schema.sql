create extension if not exists pgcrypto;

create table if not exists public.profiles (
  id uuid primary key references auth.users(id) on delete cascade,
  full_name text,
  target_exam_year integer,
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now()
);

create table if not exists public.essay_submissions (
  id uuid primary key default gen_random_uuid(),
  user_id uuid not null references auth.users(id) on delete cascade,
  topic text not null check (char_length(topic) between 5 and 300),
  essay_text text not null check (char_length(essay_text) between 500 and 20000),
  evaluation jsonb not null,
  total_score integer not null check (total_score between 0 and 100),
  created_at timestamptz not null default now()
);

create index if not exists essay_submissions_user_created_idx
  on public.essay_submissions(user_id, created_at desc);

alter table public.profiles enable row level security;
alter table public.essay_submissions enable row level security;

create policy "profile_select_own" on public.profiles
  for select to authenticated using ((select auth.uid()) = id);
create policy "profile_insert_own" on public.profiles
  for insert to authenticated with check ((select auth.uid()) = id);
create policy "profile_update_own" on public.profiles
  for update to authenticated using ((select auth.uid()) = id)
  with check ((select auth.uid()) = id);

create policy "essay_select_own" on public.essay_submissions
  for select to authenticated using ((select auth.uid()) = user_id);

revoke all on public.profiles from anon, authenticated;
grant select, insert, update on public.profiles to authenticated;
revoke all on public.essay_submissions from anon, authenticated;
grant select on public.essay_submissions to authenticated;


comment on table public.essay_submissions is
  'User-owned essay practice submissions. Inserts are performed by the authenticated Edge Function using server-side credentials.';
