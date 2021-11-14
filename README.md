
# Rails Project

## Overview

The rails tech event volunteer application is a minimal viable product (MVP) allowing users to perform CRUD functionalities. The application is designed to authenticate users either through general login providing email address and password, or via GitHub. The user can also create an account, if an account does not exist to login using their email and password. The purpose of the application is to allow users to register themselves to volunteer for a tech event, or register another registered user of the application for an event.

If a user is not logged in or chooses not to create an account, they can view all of the events and their details and a list of all of the users registered to use the application. However, a user not registered with the application cannot register themselves for an event to volunteer for nor can they register another user. The user cannot perform any function related to registrations if they are not a registered user.

If a user is logged in they can register themselves for an event to volunteer for. They can also register another user to volunteer for an event. The user can view all of the registered events and filter them by users. The user may choose to edit their profile information, but cannot edit the profile information of another user.

## Install instructions

Users must make sure Rails is installed in their local machine (which can be done through terminal). The application is an open source project. Users can search the username “stabassum” on GitHub and search for the project : “rails-project-tech-event-volunteer-application”. The user can then clone the project to their local machine/desktop. Users can then open up the terminal and move into the project directory. Once a user is in the project directory, the user can run bundle install, to install all of the necessary gems required for the project. Next, the user must run the migrations files with the following rake command (make sure rake is also installed) : rake db:migrate. Once the migration files are run, the user must run the seed file via the command rake db:seed. Finally, to run the application after the database files are run, type the following command into terminal: rails s. This will run the rails server which is on port 3000. If you now open up any browser and type the following : http://localhost:3000/  , you’ll notice the application is ready for use now on your local machine! The homepage of the application details what options are available for the user in regards to the application.

## General Application Flow

![Rails App Flow (1)](https://user-images.githubusercontent.com/20411568/83109958-4dd8a580-a090-11ea-8953-feb6e445b33f.jpg)

## Application Outline

1. Start (Homepage)
   a. About page of what the application does:
      - Authentication
      - Authorization
   b.(Option #1) Authentication: Login using existing account
      - Enter email & password. If credentials entered correctly, redirect to the user's show page, else, redirect back to the login page.
   c. (Option #2) Create account
      - User creates a new account here according to account creation guidelines. If the user creates an account properly, the user is redirected to the user’s show page, else, user is redirected back to create account page.
   d.View all Users & Events
      - View users, can return back to homepage
      - View events and individual details by clicking on each event, can return to homepage
      - User must be logged in to view any information related to registrations

  2. User’s Show Page (users/show.html.erb)
   a. Logout option, if clicked, returned to Start (Homepage).
   b. Can Edit your personal user profile
      - After editing, returned to the User’s Show Page. 
   c. Can register for a new event (can register self or another user for an event) - the user is directed to the create registration (registrations/new.html.erb) page.

  3. Registrations (registrations/index.html.erb) Page
    a. On the index.html.erb page of the “registrations”, users can see all of the registered events by different users. 
    b. Users have the option to filter events by user.
    c. Users can also click on the name of a specific user to filter by that username.

  4. Events (events/index.html.erb) Page
    a. User is allowed to view all of the events whether they are signed in or not (option viewed on homepage)
    b. User is allowed to view details of each event whether they are signed in or not (option viewed on homepage)

## Project File Structure
```
├── .gitignore
├── Gemfile
├── Gemfile.lock
├── README.md
├── app
│   ├── assets
│   │   └── stylesheets
│   │       └── homeapp.scss
│   ├── controllers
│   │   ├── application_controller.rb
│   │   ├── events_controller.rb
│   │   ├── registrations_controller.rb
│   │   ├── sessions_controller.rb
│   │   ├── site_controller.rb
│   │   └── users_controller.rb
│   ├── models
│   │   ├── application_record.rb
│   │   ├── event_record.rb
│   │   ├── registration_record.rb
│   │   └── user.rb
│   └── views
│       ├── events
│       │   └── index.html.erb
│       │   └── show.html.erb
│       ├── layouts
│       │   └── app_layout.html.erb
│       │   └── mailer.html.erb
│       │   └── mailer.text.erb
│       ├── registrations
│       │   ├── _form.html.erb
│       │   └── edit.html.erb
│       │   ├── index.html.erb
│       │   └── new.html.erb
│       │   └── show.html.erb
│       ├── sessions
│       │   ├── new.html.erb
│       ├── site
│       │   └── index.html.erb
│       └── users
│           └── _form.html.erb
│           └── edit.html.erb
│           └── index.html.erb
│           └── new.html.erb
│           └── show.html.erb
└── db
    ├── migrate
    │   ├── 202005223000_create_registrations.rb
    │   └── 20191103143512_create_users.rb
    │   ├── 20191105213844_add_password_digest_to_users.rb
    │   └── 20200522025700_create_events.rb
    ├── schema.rb
    └── seeds.rb
```

```
├── .gitignore
├── Gemfile
├── Gemfile.lock
├── README.md
├── app
│   ├── assets
│   │   └── stylesheets
│   │       └── homeapp.scss
│   ├── controllers
│   │   ├── application_controller.rb
│   │   ├── events_controller.rb
│   │   ├── registrations_controller.rb
│   │   ├── sessions_controller.rb
│   │   ├── site_controller.rb
│   │   └── users_controller.rb
│   ├── models
│   │   ├── application_record.rb
│   │   ├── event_record.rb
│   │   ├── registration_record.rb
│   │   └── user.rb
│   └── views
│       ├── events
│       │   └── index.html.erb
│       │   └── show.html.erb
│       ├── layouts
│       │   └── app_layout.html.erb
│       │   └── mailer.html.erb
│       │   └── mailer.text.erb
│       ├── registrations
│       │   ├── _form.html.erb
│       │   └── edit.html.erb
│       │   ├── index.html.erb
│       │   └── new.html.erb
│       │   └── show.html.erb
│       ├── sessions
│       │   ├── new.html.erb
│       ├── site
│       │   └── index.html.erb
│       └── users
│           └── _form.html.erb
│           └── edit.html.erb
│           └── index.html.erb
│           └── new.html.erb
│           └── show.html.erb
└── db
    ├── migrate
    │   ├── 001_create_registrations.rb
    │   └── 002_create_users.rb
    │   ├── 003_add_password_digest_to_users.rb
    │   └── 004_create_events.rb
    ├── schema.rb
    └── seeds.rb
```
