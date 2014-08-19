source 'https://rubygems.org'

###########
# web library/framework
gem 'sinatra'


########################
# databaase access

gem 'activerecord', '=3.2.19' ## use 3.2.x series for now (still runs w/ Ruby 1.9.2)

group :production do
  gem 'pg'                # note: pg is PostgreSQL
end

group :development do
  gem 'sqlite3'
end

##############
# web server - use faster multiplexed (w/ eventmachine) web server 
gem 'thin'


##############################
# our own (feedreader) gems

gem 'pluto'
gem 'pluto-admin'

