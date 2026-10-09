-- Each signed-in account has exactly one private calendar row.
-- RLS policies below prevent one account from reading or changing another account's row.
create table if not exists public.campus_calendars (
  user_id uuid primary key references auth.users(id) on delete cascade,
  university text not null check (university in ('Hochschule Wismar', 'Hochschule Worms')),
  events jsonb not null default '[]'::jsonb check (jsonb_typeof(events) = 'array'),
  updated_at timestamptz not null default now()
);

alter table public.campus_calendars enable row level security;

revoke all on table public.campus_calendars from anon, authenticated;
grant select, insert, update, delete on table public.campus_calendars to authenticated;

drop policy if exists "Users can read their own campus calendar" on public.campus_calendars;
create policy "Users can read their own campus calendar"
  on public.campus_calendars for select to authenticated
  using ((select auth.uid()) = user_id);

drop policy if exists "Users can create their own campus calendar" on public.campus_calendars;
create policy "Users can create their own campus calendar"
  on public.campus_calendars for insert to authenticated
  with check ((select auth.uid()) = user_id);

drop policy if exists "Users can update their own campus calendar" on public.campus_calendars;
create policy "Users can update their own campus calendar"
  on public.campus_calendars for update to authenticated
  using ((select auth.uid()) = user_id)
  with check ((select auth.uid()) = user_id);

drop policy if exists "Users can delete their own campus calendar" on public.campus_calendars;
create policy "Users can delete their own campus calendar"
  on public.campus_calendars for delete to authenticated
  using ((select auth.uid()) = user_id);
