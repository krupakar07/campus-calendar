# Publish Campus Calendar with GitHub and Render

This folder contains the complete static app, the Supabase client configuration, the database schema, and a Render Blueprint.

## 1. Put the files in GitHub

1. Download and extract `campus-calendar-render.zip`.
2. Create a GitHub repository. For a personal calendar, choose **Private**.
3. Upload every file from the extracted folder to the repository's top level. Keep `index.html`, `render.yaml`, and `supabase-config.js` at the top level, not inside another folder.
4. Commit the files.

## 2. Create the Render static site

1. In Render, select **New → Blueprint**.
2. Connect GitHub and select the repository.
3. Render reads `render.yaml`, which sets the site type to static and publishes the repository root. Review and deploy it.
4. Wait for the deploy to finish, then open the `https://….onrender.com` URL shown by Render.

No build command or Node package installation is needed; this app is plain HTML, CSS, and JavaScript.

## 3. Finish Supabase URL setup

In Supabase, open **Authentication → URL Configuration**:

- Set **Site URL** to the exact Render URL, including `https://`.
- Add the same URL to **Redirect URLs** and save.

The SQL schema and Supabase Project URL/publishable key are already included. The publishable key is intended for browser code. Never add a Supabase secret or service-role key to this repository.

## 4. Create your accounts

Open the Render URL. Create one account and choose **Hochschule Wismar**. Your girlfriend creates her own account and chooses **Hochschule Worms**. Each account has its own private calendar. If email confirmation is enabled in Supabase, confirm each account from its email before signing in.

## Updating the app

Upload changed files to the same GitHub repository and commit. Render will redeploy the static site from that repository.
