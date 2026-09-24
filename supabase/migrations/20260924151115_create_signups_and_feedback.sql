create table public.signups (
  id uuid primary key default gen_random_uuid(),
  email text not null unique,
  created_at timestamptz not null default now()
);
alter table public.signups enable row level security;

create policy "anyone can insert signups" on public.signups
  for insert to anon, authenticated with check (true);
create policy "authenticated can read signups" on public.signups
  for select to authenticated using (true);

create table public.feedback (
  id uuid primary key default gen_random_uuid(),
  comment text not null,
  email text,
  created_at timestamptz not null default now()
);
alter table public.feedback enable row level security;

create policy "anyone can insert feedback" on public.feedback
  for insert to anon, authenticated with check (true);
create policy "authenticated can read feedback" on public.feedback
  for select to authenticated using (true);
