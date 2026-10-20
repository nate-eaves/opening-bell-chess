-- Opening Bell Chess: per-user game storage for Supabase.
-- Run this once in Supabase Dashboard → SQL Editor → New query.

create table if not exists public.chess_games (
  user_id uuid not null references auth.users (id) on delete cascade,
  game_key text not null,
  game_data jsonb not null,
  updated_at timestamptz not null default now(),
  primary key (user_id, game_key)
);

alter table public.chess_games enable row level security;

revoke all on table public.chess_games from anon;
grant select, insert, update, delete on table public.chess_games to authenticated;

drop policy if exists "Users can manage their own chess games" on public.chess_games;
create policy "Users can manage their own chess games"
  on public.chess_games
  for all
  to authenticated
  using ((select auth.uid()) = user_id)
  with check ((select auth.uid()) = user_id);

