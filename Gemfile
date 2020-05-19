source 'https://rubygems.org'

###########
# web library/framework
gem 'sinatra'


########################
# databaase access

gem 'activerecord'

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

gem 'pluto-models'
gem 'pluto-feedfetcher'
gem 'pluto-update'

gem 'pluto-admin'

