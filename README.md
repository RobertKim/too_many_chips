# TooManyChips

TooManyChips is the final project that I collaborated with two other Dev Bootcamp members to produce, and present for the finale of my attendance at the program.

The application aimed to solve the problem of event planning, specifically for potlucks, and the difficulty of dividing up responsibilities among the guests who wish to contribute to the event.  

# To view the site:

At the moment, the site is no longer deployed to Heroku, but can be accessed through the standard Ruby on Rails server, localhost:3000, upon following these instructions to enable background jobs with Sidekiq and Redis.

You will need to open three separate tabs in the terminal.

1) In the first tab of the terminal, enter the following lines:

brew install redis

redis-server /usr/local/etc/redis.conf

2) In the second tab, simply enter:

sidekiq

3) Finally, in the third tab, enter:

rails s

Please enjoy TooManyChips!

