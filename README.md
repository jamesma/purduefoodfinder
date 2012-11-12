PurdueFoodFinder
================

Author: [James Ma][]

A Rails web app hosted on Heroku that lets you find local events with free food or giveaways around Purdue's campus. Live off free food as much as you can. 

This is a work in progress. Check out the website [here][]! Currently it is populated with fake data.

Devise::Mailer Setup on Heroku
==============================

- Follow this [Heroku blog post][] to setup Devise::Mailer with Gmail on Heroku.
- Run `heroku config:add GMAIL_SMTP_USER=username@gmail.com`
- Run `heroku config:add GMAIL_SMTP_PASSWORD=yourpassword`
- The advantage is that your email username and password are not exposed in the `config/environments/` directory. Win-win!

Database Seeds
==============
- Run `heroku config:add SEED_ADMIN_PASSWORD=yourpassword` for seeding administrator password.
- Run `heroku config:add SEED_USER_PASSWORD=yourpassword` for seeding example users password.
- This is such that the password isn't revealed in `db/seeds.rb` and it is local to your production env.

Third-party Usage
=================

- [Devise][]: Authentication solution for Rails
- [CanCan][]: Authentication gem for Rails
- [DataTables][]: jQuery plugin for HTML tables
- [Twitter Bootstrap][]: Amazing front-end framework
- [Datepicker][]: Datepicker for Bootstrap
- [Timepicker][]: Timepicker for Bootstrap
- [RailsApps][]: Tutorials for setting up Devise-CanCan-Bootstrap
- [Rspec][], [Cucumber][]... the list goes on!

[James Ma]: http://jamesma.info
[here]: http://purduefoodfinder.herokuapp.com/
[Devise]: https://github.com/plataformatec/devise
[CanCan]: https://github.com/ryanb/cancan
[DataTables]: http://datatables.net/
[Twitter Bootstrap]: http://twitter.github.com/bootstrap/
[Datepicker]: http://www.eyecon.ro/bootstrap-datepicker/
[Timepicker]: http://jdewit.github.com/bootstrap-timepicker/
[RailsApps]: http://railsapps.github.com/tutorial-rails-bootstrap-devise-cancan.html
[Rspec]: http://rspec.info/
[Cucumber]: http://cukes.info/
[Heroku blog post]: http://blog.heroku.com/archives/2009/11/9/tech_sending_email_with_gmail/