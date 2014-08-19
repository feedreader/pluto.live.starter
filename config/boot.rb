# encoding: utf-8

############################################
# 3rd party gems via bundler (see Gemfile)

require 'bundler'

ENV['RACK_ENV'] ||= 'development'
puts "RACK_ENV=#{ENV['RACK_ENV']}"

# only add development or production gems (depending on RACK_ENV)
Bundler.setup( :default, ENV['RACK_ENV'].to_sym )


require 'pp' ## fyi: pp is pretty printer
puts '$LOAD_PATH:'
pp $LOAD_PATH


############################
# require 3rd party gems

require 'sinatra/base'     # note: sinatra will pull in web server (e.g. rack)



require 'pluto'                # note: pluto will pull in database access (e.g. activrecord)

require 'pluto/admin'          ### fix/todo: load pluto admin here (remove pluto/admin/server !!!)
require 'pluto/admin/server'   # note: pluto admin server app (requires extra require)


# planet app

require './planet'


### todo: check how we can auto-connect in Planet
#  use activerecord.connected? or similar?

Pluto.connect!   # try connect w/ DATABASE_URL

