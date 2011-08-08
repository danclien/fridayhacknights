# Friday Night Hacks Official Website

[http://www.fridaynighthacks.com/](http://www.fridaynighthacks.com/)

This is the source and stuff. You should contribute. And stuff.

## How to Spork and Stuff

    $ git clone https://github.com/danclien/fridayhacknights.git
    $ cd fridayhacknights
    $ bundle install
    $ rails server -p 9001

## When the world is not perfect

If stuff does not work when you run `bundle install`, try commenting out `gem 'pg'` like so:

    group :production do
      # gem 'pg'
    end

Then try to run stuff again.

## what stuff is there TODO ?

Check out the [issues page](https://github.com/danclien/fridayhacknights/issues) for stuff to do and stuff.
