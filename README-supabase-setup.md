# Opening Bell Chess: Supabase setup

The dashboard is hosted on GitHub Pages. Supabase stores games and account data so games can be loaded in another browser.

## 1. Create the games table

In the Supabase project, open **SQL Editor → New query**. Copy the contents of [`supabase-setup.sql`](supabase-setup.sql), paste them into the editor, and choose **Run**. The table has row-level security enabled; signed-in users can access only rows whose `user_id` matches their Supabase account.

## 2. Allow the GitHub Pages sign-in redirect

In Supabase, open **Authentication → URL Configuration** and set both the **Site URL** and an allowed **Redirect URL** to:

`https://nate-eaves.github.io/opening-bell-chess/`

Save the configuration.

## 3. Create your dashboard account

Open [Opening Bell Chess](https://nate-eaves.github.io/opening-bell-chess/), enter your email and a password, and choose **Create account**. If email confirmation is enabled, confirm the message Supabase sends, then sign in on the dashboard.

## 4. Import your games

Once signed in, choose **Import PGN**. Games and Stockfish reviews are saved to your Supabase account and load after signing in from another browser. If your older games exist only in the local-file copy of the dashboard, import their PGN files again on the hosted dashboard.

The Supabase publishable key is included in the public page by design. Keep database passwords and service-role/secret keys private. Access to game records is restricted by the table's row-level security policy.

