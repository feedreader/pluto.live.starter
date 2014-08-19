# pluto.live.starter

Example planet starter site - a Sinatra web app in Ruby
using the [pluto gem](https://github.com/feedreader/pluto).

```ruby
class Planet < Sinatra::Base
  
  ##########
  # Models
  
  include Pluto::Models   # e.g. Feed, Item, Site, etc.

  ############################################
  # Controllers / Routing / Request Handlers

  get '/' do
    erb :index
  end

end
```

(Source: [`planet.rb`](planet.rb))


Sample template snippet:

```html
<h1><%= site.title %></h1>

<% site.items.latest.limit(24).each do |item| %>

  <div class='item'>

    <h4 class='feed-title'>
      <%= link_to item.feed.title, item.feed.url %>
    </h4>

    <h2 class='item-title'>
     <%= link_to item.title, item.url %>
    </h2>

    <div class='item-content'>
     <%= item.summary %>
    </div>
  </div>

<% end %>
```

(Source: [`views/index.erb`](views/index.erb))


## Live Demos

See the [Planet Ruby](http://plutopluto.herokuapp.com)
running on Heroku.


## Setup

### Setup on your local machine

Clone the pluto.live.starter git repo:

    $ git clone git://github.com/feedreader/pluto.live.starter.git

Get all your Ruby libraries (gems) installed using the bundler tool:

    $ cd pluto.live.starter
    $ bundle install --without production

Note, use the `--without production` option for local development
unless you want to install the PostgreSQL (pg) database libraries
and services (required for production on the Heroku hosting service.)

Setup the database and planet feed subscriptions:

    $ rake setup PLANET=ruby

Update your planet feeds:

    $ rake update

Showtime! Startup the web server:

    $ rackup

That's it.



### Setup on Heroku

Clone the pluto.live.starter git repo:

    $ git clone git://github.com/feedreader/pluto.live.starter.git

Create app on Heroku e.g.

    $ cd pluto.live.starter
    $ heroku create <YOUR_APP_NAME_HERE>

Upload via

    $ git push heroku master

Add the PostgreSQL addon

    $ heroku addons:add heroku-postgresql:dev

Establish primary database (that is, set DATABASE_URL). Find your POSTGRESQL_URL:

    $ heroku config | grep HEROKU_POSTGRESQL

And promote HEROKU_POSTGRESQL_<YOUR_COLOR_HERE>_URL to DATABASE_URL: 

    $ heroku pg:promote HEROKU_POSTGRESQL_<YOUR_COLOR_HERE>_URL

Create database andd add planet feed subscriptions on first upload via

    $ heroku run rake setup PLANET=ruby

Update feeds

    $ heroku run rake update

Showtime! That's it.


Bonus:

Add a scheduler job to update feeds via `rake update` hourly, daily, etc. 


## License

The `pluto` scripts are dedicated to the public domain.
Use it as you please with no restrictions whatsoever.

## Questions? Comments?

Send them along to the [Planet Pluto and Friends Forum/Mailing List](http://groups.google.com/group/feedreader).
Thanks!
