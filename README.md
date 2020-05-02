# 431-accessible-uber [![Build Status](https://travis-ci.org/keyboard-nipple/431-accessible-uber.svg?branch=master)](https://travis-ci.org/keyboard-nipple/431-accessible-uber)

## Setup
Before starting, make sure that Ruby, Rails, and SQLite3 are installed.

Clone the repository:
```bash
git clone https://github.com/keyboard-nipple/driverse.git
cd driverse
```
Install missing gems:
```bash
bundle install
```
If you get the following error,
```
An error occurred while installing pg (0.21.0), and Bundler cannot continue.
Make sure that `gem install pg -v '0.21.0' --source 'https://rubygems.org/'` succeeds before bundling.
```
Run this to install the missing dependencies for PostgreSQL:
```bash
sudo apt-get update
sudo apt-get install libpq-dev
```
Migrate the database:
```bash
rake db:migrate
```
Run the server:
```bash
rails server
```

## Google Sign-In
For Google sign-in to work, you must first create your own Google API Console project and client ID. A guide to do so can be found here: https://developers.google.com/identity/sign-in/web/sign-in.

Once you have created a project, you have to set the environment variables in your development environment so that the application knows where to redirect the sign-in to. There are two variables that you need to set, and there are two methods to set them.

This sets the environment variables temporarily for only your current shell session.
```bash
GOOGLE_CLIENT_ID="YOUR CLIENT ID HERE"
GOOGLE_CLIENT_SECRET="YOUR SECRET HERE"
```

To add it permanently, add these lines to your .bashrc
```bash
export GOOGLE_CLIENT_ID="YOUR CLIENT ID HERE"
export GOOGLE_CLIENT_SECRET="YOUR SECRET HERE"
```
Then reload the .bashrc file:
```bash
source .bashrc
```
You may have to perform additional configuration in the Google API Console to add the authorized URIs and redirect URIs. The redirect URI will likely be something similar to this format:
```
https://[YOUR EC2/CLOUD9 INSTANCE NAME].vfs.cloud9.us-east-1.amazonaws.com/auth/google_oauth2/callback
```
You will need to do this for every development environment you plan to work with.
